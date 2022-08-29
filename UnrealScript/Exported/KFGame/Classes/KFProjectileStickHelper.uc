//=============================================================================
// KFProjectileStickHelper
//=============================================================================
// Manages projectile sticking and pinning functionality
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFProjectileStickHelper extends Object within KFProjectile;

var transient Pawn PinPawn;
var transient name PinBoneName;
var transient RB_ConstraintActorSpawnable PinConstraint;

var AkEvent StickAkEvent;

/** Tries to stick projectile to hit actor. alternatively, tries to bounce it off of hit actor. */
simulated function TryStick(vector HitNormal, optional vector HitLocation, optional Actor HitActor)
{
	local TraceHitInfo HitInfo;

	if (Instigator == None || !Instigator.IsLocallyControlled())
	{
		return;
	}

	if (HitActor != none && (HitActor == StuckToActor || HitActor == PinPawn))
	{
		return;
	}

	GetImpactInfo(Velocity, HitLocation, HitNormal, HitInfo);

	if (GetImpactResult(HitActor, HitInfo.HitComponent))
	{
		Stick(HitActor, HitLocation, HitNormal, HitInfo);
	}
}

/** Get all relevant impact info (called after collision occurs to fill in details that we don't get in HitWall or ProcessTouch) */
simulated function GetImpactInfo(vector in_Velocity, out vector out_HitLocation, out vector out_HitNormal, out TraceHitInfo out_HitInfo)
{
	local vector VelNorm;
	local vector VelScaled;

	VelNorm = Normal(in_Velocity);
	VelScaled = VelNorm * 30;
	Trace(out_HitLocation, out_HitNormal, Location + VelScaled, Location - VelScaled, , , out_HitInfo, TRACEFLAG_Bullet /*for complex collision*/ );
}

/** Returns appropriate interaction with HitActor (stick or ignore, for now. add bounce later?) */
simulated function bool GetImpactResult(Actor HitActor, PrimitiveComponent HitComp)
{
	local KFPawn_Human KFP;
	local KFDestructibleActor D;
	local StaticMeshComponent StaticMeshComp;

	if (HitActor == none)
	{
		return true;
	}

	if (HitActor.RemoteRole == ROLE_None && !HitActor.bWorldGeometry)
	{
		return false;
	}

	// if we've already been dislodged from an actor, don't keep trying to stick to it while falling
	if (HitActor.bTearOff || HitActor.bDeleteMe || HitActor.bPendingDelete || HitActor == PrevStuckToActor)
	{
		return false;
	}

	StaticMeshComp = StaticMeshComponent(HitComp);
	if (StaticMeshComp != none)
	{
		// NOTE: Door actors fall into this category!

		// pass through meshes that can move
		return !StaticMeshComp.CanBecomeDynamic();
	}

	KFP = KFPawn_Human(HitActor);
	if (KFP != none)
	{
		// bounce off of player pawns, stick to other pawns
		return false;
	}

	D = KFDestructibleActor(HitActor);
	if (D != none)
	{
		// don't react to client-side-only destructibles, stick to others
		return D.ReplicationMode != RT_ClientSide;
	}

	return true;
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

		// get the best bone to attach to
		ClosestBoneLocation = HitMonster.Mesh.GetClosestCollidingBoneLocation(HitLocation, true, false);
		BoneName = HitMonster.Mesh.FindClosestBone(ClosestBoneLocation, ClosestBoneLocation);

		// do impact damage
        if (KFWeapon(Owner) != none)
        {
            KFWeapon(Owner).HandleProjectileImpact(WeaponFireMode, HitZoneImpactList[0], PenetrationPower);
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

	if (bCanPin)
	{
		// if StickTo pawn is dead, pin it and keep flying
		if (Role == ROLE_Authority)
		{
			if (KFPawn(StickTo) != none && !KFPawn(StickTo).IsAliveAndWell())
			{
				Pin(StickTo, BoneIdx);
				return;
			}
		}

		if (WorldInfo.NetMode != NM_DedicatedServer && PinPawn != none)
		{
			// Pin pinned pawn to StickTo actor
			PinPawn.Mesh.RetardRBLinearVelocity(vector(Rotation), 1.0);
			PinPawn.Mesh.SetRBPosition(Location, PinBoneName);

			PinConstraint = Spawn(class'RB_ConstraintActorSpawnable',,,Location);
			PinConstraint.InitConstraint(PinPawn, none, PinBoneName, '');

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
			// set replicated relative loc/rot
			SkelMeshComp.TransformToBoneSpace(BoneName, Location, Rotation, StuckToLocation, StuckToRotation);
		}

		SetBase(StickTo,, SkelMeshComp, BoneName);
		SetRelativeLocation(StuckToLocation);
		SetRelativeRotation(StuckToRotation);
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
}

simulated function Pin(Actor PinTo, int BoneIdx)
{
	if (Role == ROLE_Authority)
	{
		PinActor = PinTo;
		PinBoneIdx = BoneIdx;
	}

	PinPawn = Pawn(PinTo);
	PinBoneName = PinPawn.Mesh.GetBoneName(BoneIdx);

	StuckToActor = none;
	StuckToBoneIdx = INDEX_None;

	SetBase(none);
	SetPhysics(PHYS_Falling);
	Velocity = Speed * vector(Rotation);
}

/** Attempts to retrieve skeletal mesh from actor */
simulated function SkeletalMeshComponent GetActorSkeletalMesh(Actor StickActor)
{
	local Pawn P;
	local SkeletalMeshActor SM;

 	P = Pawn(StickActor);
 	if (P != none)
 	{
 		return P.Mesh;
 	}

 	SM = SkeletalMeshActor(StickActor);
 	if (SM != none)
 	{
 		return SM.SkeletalMeshComponent;
 	}

 	return none;
}

/** Replicates stick to server from client */
function ServerStick(Actor StickTo, int BoneIdx, vector StickLoc, rotator StickRot)
{
	StuckToLocation = StickLoc;
	StuckToRotation = StickRot;
	bForceNetUpdate = true;

	ReplicatedStick(StickTo, BoneIdx);
}

/** Calls "Stick" with replicated info */
simulated function ReplicatedStick(Actor StickTo, int BoneIdx)
{
	StickToActor(StickTo, GetActorSkeletalMesh(StickTo), BoneIdx);
}

/** Gets index for passed-in bone name for different kinds of actors that have differently-named skeletalmeshcomponents */
simulated function int GetBoneIndexFromActor(Actor HitActor, Name BoneName)
{
	local Pawn P;
	local SkeletalMeshActor SM;

 	P = Pawn(HitActor);
 	if (P != none)
 	{
 		return P.Mesh.MatchRefBone(BoneName);
 	}

 	SM = SkeletalMeshActor(HitActor);
 	if (SM != none)
 	{
 		return SM.SkeletalMeshComponent.MatchRefBone(BoneName);
 	}

 	return INDEX_NONE;
}

/** Resets physics/collision vars to defaults */
simulated function UnStick()
{
	PrevStuckToActor = StuckToActor;

	StuckToActor = none;
	StuckToBoneIdx = INDEX_NONE;

	StuckToLocation = vect(0,0,0);
	StuckToRotation = rot(0,0,0);

	SetBase(none);
	SetPhysics(default.Physics);
}

simulated function UnPin()
{
	if (PinConstraint != none)
	{
		PinConstraint.TermConstraint();
	}
	PinConstraint = none;
	PinPawn = none;
}

simulated function Tick()
{
	local int i;
	local Pawn P;
	local KFFracturedMeshActor FracMesh;
	local KFDoorActor Door;
	local KFDestructibleActor Destructible;
	local Actor StuckTo;

	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;
	local Actor HitActor;

	if (PinPawn != none)
	{
		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			// set PinPawn rigid body position and velocity to make it look good,
			// since it's not actually attached to this projectile, just "following" it
			PinPawn.Mesh.SetRBLinearVelocity(Velocity * 0.9);
			PinPawn.Mesh.SetRBPosition(Location, PinBoneName);
		}

		if (Instigator != none && Instigator.IsLocallyControlled())
		{
			// Trace ahead to see if there's something to stick to. Don't rely on collision component,
			// because by the time the collision component collides, PinPawn will be jammed into the
			// collision actor.
			HitActor = Trace(HitLocation, HitNormal, Location, Location + Normal(Velocity) * 35,,, HitInfo, TRACEFLAG_Bullet);
			if (HitActor != none && HitActor != PinActor && GetImpactResult(HitActor, HitInfo.HitComponent))
			{
				Stick(HitActor, Location, HitNormal, HitInfo);
			}
		}
	}

	StuckTo = StuckToActor;
	if (StuckTo != none)
	{
		// always restart movement if torn off
		if (StuckTo.bTearOff && PinPawn == none)
		{
			UnStick();
			return;
		}

		// if the bone we're stuck to is hidden (just head, probably), detatch
		P = Pawn(StuckTo);
		if (P != none)
		{
			if (P.Mesh.IsBoneHidden(StuckToBoneIdx))
			{
				UnStick();
			}
			return;
		}

		// if the non-pawn actor we're stuck to is going away (could be due to non-relevancy, in which case they will not be torn off), detatch
		if (StuckTo.bDeleteMe || StuckTo.bPendingDelete)
		{
			UnStick();
			return;
		}

		// if the glass we're stuck to is fractured, detatch
		FracMesh = KFFracturedMeshActor(StuckTo);
		if (FracMesh != none && FracMesh.bHasLostChunk)
		{
			UnStick();
			return;
		}

		// if the door we're stuck to is moving, detatch
		// (we can't set our base to doors because they're world geometry, so we won't follow when they move)
		Door = KFDoorActor(StuckTo);
		if (Door != none && (!Door.bDoorMoveCompleted || Door.bIsDestroyed))
		{
			UnStick();
			return;
		}

		if (LastTouchComponent != none)
		{
			// if the replicated destructible we're stuck to is destroyed, detatch
			Destructible = KFDestructibleActor(StuckTo);
			if (Destructible != none)
			{
				for (i = 0; i < Destructible.SubObjects.Length; ++i)
				{
					if (Destructible.SubObjects[i].Mesh == LastTouchComponent && Destructible.SubObjects[i].Health <= 0)
					{
						UnStick();
						return;
					}
				}
			}
		}
	}
}

defaultproperties
{
   Name="Default__KFProjectileStickHelper"
   ObjectArchetype=Object'Core.Default__Object'
}
