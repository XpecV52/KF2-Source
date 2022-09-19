//=============================================================================
// KFProjectileStickHelper_HRG_Crossboom
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFProjectileStickHelper_HRG_Crossboom extends KFProjectileStickHelper;

var() float MinDistanceFromPlayer;
var() float DampingFactor;
var() bool bAltFire;

simulated function TryStick(vector HitNormal, optional vector HitLocation, optional Actor HitActor)
{
	local TraceHitInfo HitInfo;
//    local KFProj_Bolt_HRG_Crossboom ProjOwner;
//    ProjOwner = KFProj_Bolt_HRG_Crossboom(Outer);

	if (Instigator == None || !Instigator.IsLocallyControlled() || (Physics == PHYS_None && StuckToActor != none))
	{
		return;
	}

	if (HitActor != none && (HitActor == StuckToActor || HitActor == PinPawn))
	{
		return;
	}

	GetImpactInfo(Velocity, HitLocation, HitNormal, HitInfo);

	if (HitInfo.HitComponent != none && GetImpactResult(HitActor, HitInfo.HitComponent))
	{
		
		Stick(HitActor, HitLocation, HitNormal, HitInfo);

// Bounce if distance is not met?
/*
        if (VSizeSq(HitLocation - Instigator.Location) >= MinDistanceFromPlayer * MinDistanceFromPlayer)
        {
		    Stick(HitActor, HitLocation, HitNormal, HitInfo);
        }
        else
        {
            // Bounce
            ProjOwner.Velocity = DampingFactor * (ProjOwner.Velocity - 2.0*HitNormal*(ProjOwner.Velocity dot HitNormal));
            ProjOwner.GravityScale = 1.0f;

            if( WorldInfo.NetMode != NM_DedicatedServer )
            {
                // do the impact effects
                `ImpactEffectManager.PlayImpactEffects(HitLocation, Instigator, HitNormal, ProjOwner.ImpactEffects, true );
            }

            ProjOwner.NotifyBounce();
        }
*/

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if (bAltFire)
			{
				KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, KFProj_Bolt_HRG_CrossboomAlt(Outer).ImpactEffects);
			}
			else
			{
				KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, KFProj_Bolt_HRG_Crossboom(Outer).ImpactEffects);
			}
		}
	}
}

/** Stops movement of projectile and calculates orientation to surface */
simulated function Stick(Actor HitActor, vector HitLocation, vector HitNormal, const out TraceHitInfo HitInfo)
{
	local int BoneIdx;

	local KFPawn_Monster HitMonster;
	local array<ImpactInfo> HitZoneImpactList;
	local vector StartTrace, EndTrace, Direction, ClosestBoneLocation;
	local name BoneName;

	BoneName = HitInfo.BoneName;

	HitMonster = KFPawn_Monster(HitActor);
	if (HitMonster != none)
	{
		// get injury hit zone
		StartTrace = HitLocation;
		Direction = Normal(Velocity);
		EndTrace = StartTrace + Direction * (HitMonster.CylinderComponent.CollisionRadius * 6.0);
		TraceProjHitZones(HitMonster, EndTrace, StartTrace, HitZoneImpactList);

		if (BoneName == '')
		{
			// get the best bone to attach to
			ClosestBoneLocation = HitMonster.Mesh.GetClosestCollidingBoneLocation(HitLocation, true, false);
			BoneName = HitMonster.Mesh.FindClosestBone(ClosestBoneLocation, ClosestBoneLocation);
		}

		// do impact damage
		if (KFWeapon(Owner) != none)
		{
			HitZoneImpactList[0].RayDir = Normal(EndTrace - StartTrace); // add a raydir here since TraceProjHitZones doesn't fill this out (so certain afflictions apply)
			KFWeapon(Owner).HandleProjectileImpact(WeaponFireMode, HitZoneImpactList[0], PenetrationPower);
		}
	}
	else if ( HitActor.bCanBeDamaged ) // Break collectibles and damage destructibles
	{
		if (Role != ROLE_Authority)
		{
			if (KFProj_Bolt_HRG_Crossboom(Outer) != none)
			{
				KFProj_Bolt_HRG_Crossboom(Outer).OnCollectibleHit(HitActor);
			}
			else if (KFProj_Bolt_HRG_CrossboomAlt(Outer) != none)
			{
				KFProj_Bolt_HRG_CrossboomAlt(Outer).OnCollectibleHit(HitActor);
			}
		}
		else
		{
			HitActor.TakeDamage(Damage, InstigatorController, Location, MomentumTransfer * Normal(Velocity), MyDamageType, HitInfo, Owner);
		}
	}

    if (!IsZero(HitLocation))
    {
    	SetLocation(HitLocation);
    }

	SetStickOrientation(HitNormal);

	BoneIdx = INDEX_NONE;

	if (BoneName != '')
	{
		BoneIdx = GetBoneIndexFromActor(HitActor, BoneName);
	}

    StickToActor(HitActor, HitInfo.HitComponent, BoneIdx, true);

    if (Role < ROLE_Authority)
	{
		Outer.ServerStick(HitActor, BoneIdx, StuckToLocation, StuckToRotation);
	}

	if (WorldInfo.NetMode != NM_DedicatedServer && StickAkEvent != none)
	{
		PlaySoundBase(StickAkEvent);
	}
}

/** Changes the base of the charge to the stick actor and sets its relative loc/rot */
simulated function StickToActor(Actor StickTo, PrimitiveComponent HitComp, int BoneIdx, optional bool bCalculateRelativeLocRot)
{
	local SkeletalMeshComponent SkelMeshComp;
	local Name BoneName;

	local vector RelStuckToLocation;
	local rotator RelStuckToRotation;

	local KFPawn StickToPawn;

	StickToPawn = KFPawn(StickTo);

	if (bCanPin && (StickToPawn == none || StickToPawn.bCanBePinned))
	{
		// if StickTo pawn is dead, pin it and keep flying
		if (Role == ROLE_Authority)
		{
			if (StickToPawn != none && !StickToPawn.IsAliveAndWell())
			{
				if (PinPawn == none)
				{
					Pin(StickTo, BoneIdx);
				}

				return;
			}
		}

		if (WorldInfo.NetMode != NM_DedicatedServer && PinPawn != none)
		{
			if (StickToPawn == none)
			{
				// Pin pinned pawn to StickTo actor
				//PinPawn.Mesh.RetardRBLinearVelocity(vector(Rotation), 0.75);
				PinPawn.Mesh.SetRBPosition(Location, PinBoneName);

				PinConstraint = Spawn(class'RB_ConstraintActorSpawnable',,,Location);
				PinConstraint.InitConstraint(PinPawn, none, PinBoneName, '');
			}

			PinPawn = none;
		}
	}

	SetPhysics(PHYS_None);

	PrevStuckToActor = StuckToActor;
	StuckToActor = StickTo;
	StuckToBoneIdx = BoneIdx;

	// if we found a skel mesh, set our base to it and set relative loc/rot
	if (BoneIdx != INDEX_NONE)
	{
		SkelMeshComp = SkeletalMeshComponent(HitComp);

		BoneName = SkelMeshComp.GetBoneName(BoneIdx);

		if (bCalculateRelativeLocRot)
		{
			StuckToLocation = Location;
			StuckToRotation = Rotation;
		}

		SkelMeshComp.TransformToBoneSpace(BoneName, StuckToLocation, StuckToRotation, RelStuckToLocation, RelStuckToRotation);

		SetBase(StickTo,, SkelMeshComp, BoneName);
		SetRelativeLocation(RelStuckToLocation);
		SetRelativeRotation(RelStuckToRotation);

	}
	// otherwise, just set our base
	else
	{
		if (bCalculateRelativeLocRot)
		{
			// set replicated loc/rot
			StuckToLocation = Location;
			StuckToRotation = Rotation;
		}
		else
		{
			// set loc/rot to replicated loc/rot
			SetLocation(StuckToLocation);
			SetRotation(StuckToRotation);
		}

		SetBase(StickTo);
	}

	if (bAltFire)
	{
		KFProj_Bolt_HRG_CrossboomAlt(Outer).NotifyStick();
	}
	else
	{
		KFProj_Bolt_HRG_Crossboom(Outer).NotifyStick();
	}
}

simulated function UnStick()
{
	PrevStuckToActor = StuckToActor;

	StuckToActor = none;
	StuckToBoneIdx = INDEX_NONE;

	StuckToLocation = vect(0,0,0);
	StuckToRotation = rot(0,0,0);
	if (!PrevStuckToActor.bTearOff)
	{
		SetBase(none);
		SetPhysics(default.Physics);	
	}
}

/** Returns appropriate interaction with HitActor (stick or ignore, for now. add bounce later?) */
simulated function bool GetImpactResult(Actor HitActor, PrimitiveComponent HitComp)
{
	local StaticMeshComponent StaticMeshComp;

	StaticMeshComp = StaticMeshComponent(HitComp);
	if (StaticMeshComp != none)
	{
		return true;
	}

	if (super.GetImpactResult(HitActor, HitComp))
	{
		return true;
	}

	// Check if it is water
	return (InterpActor(HitActor) != none && InterpActor(HitActor).bDestroyProjectilesOnEncroach);
}

defaultproperties
{
   MinDistanceFromPlayer=1500.000000
   DampingFactor=0.020000
   Name="Default__KFProjectileStickHelper_HRG_Crossboom"
   ObjectArchetype=KFProjectileStickHelper'KFGame.Default__KFProjectileStickHelper'
}
