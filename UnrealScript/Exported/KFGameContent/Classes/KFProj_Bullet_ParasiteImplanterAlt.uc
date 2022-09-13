//=============================================================================
// KFProj_Bullet_ParasiteImplanterAlt
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet_ParasiteImplanterAlt extends KFProjectile;

var float FuseTime;

/** This is the effect indicator that is played for the current user **/
var(Projectile) ParticleSystem ProjIndicatorTemplate;
var ParticleSystemComponent	ProjIndicatorEffects;

var bool IndicatorActive;
var transient bool bShouldEnableIndicator;

var Class<GameExplosionActor> HumanExplosionActorClass;
var KFGameExplosion HumanExplosionTemplate;

var private AKEvent SeedTimerOutEvent;

simulated function TryActivateIndicator()
{
	if(!IndicatorActive && Instigator != None)
	{
		IndicatorActive = true;

		if(WorldInfo.NetMode == NM_Standalone || Instigator.Role == Role_AutonomousProxy ||
		 (Instigator.Role == ROLE_Authority && WorldInfo.NetMode == NM_ListenServer && Instigator.IsLocallyControlled() ))
		{
			if( ProjIndicatorTemplate != None )
			{
			    ProjIndicatorEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjIndicatorTemplate);
			}

			if(ProjIndicatorEffects != None)
			{
				ProjIndicatorEffects.SetAbsolute(false, false, false);
				ProjIndicatorEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
				ProjIndicatorEffects.bUpdateComponentInTick = true;
				AttachComponent(ProjIndicatorEffects);
			}
		}
	}
}

/**
 * Set the initial velocity and cook time
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Role == ROLE_Authority)
	{
	   SetTimer(FuseTime, false, 'Timer_Detonate');
	}

	AdjustCanDisintigrate();
}

/**
 * Explode after a certain amount of time
 */
function Timer_Detonate()
{
	Detonate();
}

/** Called when the owning instigator controller has left a game */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Detonate) );
	}
}

/**
 * Trace down and get the location to spawn the explosion effects and decal
 */
simulated function GetExplodeEffectLocation(out vector HitLocation, out vector HitRotation, out Actor HitActor)
{
    local vector EffectStartTrace, EffectEndTrace;
	local TraceHitInfo HitInfo;

	EffectStartTrace = Location + vect(0,0,1) * 4.f;
	EffectEndTrace = EffectStartTrace - vect(0,0,1) * 32.f;

    // Find where to put the decal
	HitActor = Trace(HitLocation, HitRotation, EffectEndTrace, EffectStartTrace, false,, HitInfo, TRACEFLAG_Bullet);

	// If the locations are zero (probably because this exploded in the air) set defaults
    if (IsZero(HitLocation))
    {
        HitLocation = Location;
    }

	if (IsZero(HitRotation))
    {
        HitRotation = vect(0,0,1);
    }
}

/** Used to check current status of StuckTo actor (to figure out if we should fall) */
simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	StickHelper.Tick(DeltaTime);

	if (!IsZero(Velocity))
	{
		SetRelativeRotation(rotator(Velocity));
	}

	if (bShouldEnableIndicator)
	{
		TryActivateIndicator();
	}
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	StickHelper.UnPin();
	super.Explode(HitLocation, HitNormal);
}

simulated function SyncOriginalLocation()
{
	local Actor HitActor;
	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;

	if (Role < ROLE_Authority && Instigator != none && Instigator.IsLocallyControlled())
	{
		HitActor = Trace(HitLocation, HitNormal, OriginalLocation, Location,,, HitInfo, TRACEFLAG_Bullet);
		if (HitActor != none)
		{
			StickHelper.TryStick(HitNormal, HitLocation, HitActor);
		}
	}
}

simulated protected function StopSimulating()
{
	super.StopSimulating();

	if (ProjIndicatorEffects!=None)
	{
        ProjIndicatorEffects.DeactivateSystem();
	}
}

/** Causes charge to explode */
function Detonate()
{
	local KFPawn_Monster KFPM;
	//@Todo: Some VFX?
	if (StuckToActor != none)
	{
		KFPM = KFPawn_Monster(StuckToActor);
		if (KFPM != none)
		{
			KFPM.ParasiteSeeds.RemoveItem(self);
		}
	}

	StickHelper.UnPin();
    ShutDown();
}

simulated function OnActorSticked(Actor TargetActor)
{
	local KFPawn_Monster KFPM;

	KFPM = KFPawn_Monster(TargetActor);
	if (KFPM != none)
	{
		if (Role == ROLE_Authority)
		{
			KFPM.AddParasiteSeed(self);
        	PlaySoundBase(SeedTimerOutEvent, false, false);
		}

		if (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_StandAlone)
		{
			bShouldEnableIndicator = true;
		}
	}
}

simulated function ExplodeOnHuman(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local vector NudgedHitLocation, ExplosionDirection;

	if (HumanExplosionTemplate != None)
	{
		StopSimulating();

		// using a hit location slightly away from the impact point is nice for certain things
		NudgedHitLocation = HitLocation + (HitNormal * 32.f);

		ExplosionActor = Spawn(HumanExplosionActorClass, self,, NudgedHitLocation, rotator(HitNormal));
		if (ExplosionActor != None)
		{
			ExplosionActor.Instigator = Instigator;
			ExplosionActor.InstigatorController = InstigatorController;

			PrepareExplosionTemplate();

			// If the locations are zero (probably because this exploded in the air) set defaults
			if( IsZero(HitLocation) )
			{
				HitLocation = Location;
			}

			if( IsZero(HitNormal) )
			{
				HitNormal = vect(0,0,1);
			}

			// these are needed for the decal tracing later in GameExplosionActor.Explode()
			HumanExplosionTemplate.HitLocation = HitLocation;// NudgedHitLocation
			HumanExplosionTemplate.HitNormal = HitNormal;

			// If desired, attach to mover if we hit one
			if(bAttachExplosionToHitMover && InterpActor(HitActor) != None)
			{
				ExplosionActor.Attachee = HitActor;
				HumanExplosionTemplate.bAttachExplosionEmitterToAttachee = TRUE;
				ExplosionActor.SetBase(HitActor);
			}

			// directional?
			if (HumanExplosionTemplate.bDirectionalExplosion)
			{
				ExplosionDirection = GetExplosionDirection(HitNormal);
				//DrawDebugLine(ExplosionActor.Location, ExplosionActor.Location+ExplosionDirection*64, 255, 255, 0, TRUE);
			}

			// @todo: make this function responsible for setting explosion instance parameters, and take instance parameters
			// out of GearExplosion (e.g. Attachee)
			PrepareExplosionActor(ExplosionActor);

			ExplosionActor.Explode(HumanExplosionTemplate, ExplosionDirection);		// go bewm
		}

		// done with it
		if (!bPendingDelete && !bDeleteMe)
		{
			// defer destruction so any replication of explosion stuff can happen if necessary
			DeferredDestroy(PostExplosionLifetime);
		}
	}
}


simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if (KFPawn_Human(Other) != none && Other != Instigator)
	{
		ExplodeOnHuman(HitLocation, HitNormal, Other);
	}
	else
	{
		super.ProcessTouch(Other, HitLocation, HitNormal);
	}
}

defaultproperties
{
   FuseTime=6.000000
   ProjIndicatorTemplate=ParticleSystem'WEP_ParasiteImplanter_EMIT.FX_Seed_Projectile_Indicator'
   HumanExplosionActorClass=Class'kfgamecontent.KFExplosion_ParasiteSeedHuman'
   HumanExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Bullet_ParasiteImplanterAlt:ExploTemplate1'
   SeedTimerOutEvent=AkEvent'WW_WEP_ParasiteImplanter.Play_WEP_ParasiteImplanter_Seed_Timer_Out'
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bUseClientSideHitDetection=True
   bAlwaysReplicateExplosion=True
   bCanDisintegrate=True
   bWarnAIWhenFired=True
   bCanStick=True
   bCanPin=True
   GlassShatterType=FMGS_ShatterAll
   GravityScale=0.000000
   TerminalVelocity=15000.000000
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_ParasiteSeed'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      Damage=400.000000
      DamageRadius=450.000000
      DamageFalloffExponent=0.500000
      MyDamageType=Class'kfgamecontent.KFDT_Toxic_ParasiteSeedExplosion'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_Medic_GrenadeLauncher.Play_WEP_Medic_GrenadeLauncher_Grenade_Explosion'
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      CamShakeInnerRadius=0.000000
      CamShakeOuterRadius=0.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Bullet_ParasiteImplanterAlt:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_ParasiteImplanter_EMIT.FX_Seed_Projectile'
   ImpactEffects=KFImpactEffectInfo'WEP_ParasiteImplanter_ARCH.Wep_Parasite_Impact_Alt'
   Begin Object Class=KFProjectileStickHelper_ParasiteImplanter Name=StickHelper0
      Name="StickHelper0"
      ObjectArchetype=KFProjectileStickHelper_ParasiteImplanter'kfgamecontent.Default__KFProjectileStickHelper_ParasiteImplanter'
   End Object
   StickHelper=KFProjectileStickHelper_ParasiteImplanter'kfgamecontent.Default__KFProj_Bullet_ParasiteImplanterAlt:StickHelper0'
   Speed=15000.000000
   MaxSpeed=15000.000000
   bBlockedByInstigator=False
   bIgnoreFoliageTouch=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Falling
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   bCollideComplex=True
   NetUpdateFrequency=200.000000
   NetPriority=5.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet_ParasiteImplanterAlt"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
