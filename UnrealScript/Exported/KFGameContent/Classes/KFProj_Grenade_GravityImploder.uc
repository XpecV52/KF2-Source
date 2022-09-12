//=============================================================================
// KFProj_Grenade_GravityImploder
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFProj_Grenade_GravityImploder extends KFProj_BallisticExplosive
	hidedropdown;

/* Ensure it detonates */
var float DetonationTime;
var float VortexDuration;
var float VortexRadius;
var float VortexImpulseStrength;
var protected transient bool bVortexActive;

simulated state GrenadeState
{
	simulated event BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);

		if (Role == ROLE_Authority)
		{
			SetTimer(DetonationTime, false, nameOf(Timer_Detonate));
		}
	}
}

simulated state VortexState
{
	simulated event BeginState(Name PrevStateName)
	{
		super.BeginState(PrevStateName);
		
		ClearTimer(nameof(Timer_Detonate));
		
		bVortexActive = true;

		if (Role == ROLE_Authority)
		{
			SetTimer(VortexDuration, false, 'Timer_EndVortex');
		}
	}

	simulated event Tick(float DeltaTime)
	{
		local Actor          Victim;
		local TraceHitInfo   HitInfo;
		local FracturedStaticMeshActor FracActor;

		if(bVortexActive && (WorldInfo.NetMode == NM_Client || WorldInfo.NetMode == NM_Standalone))
		{
			foreach CollidingActors(class'Actor', Victim, VortexRadius, Location, true,, HitInfo)
			{
				if (KFPawn_Human(Victim) == none && Victim.CollisionComponent != none && !Victim.bWorldGeometry)
				{
					Victim.CollisionComponent.AddRadialImpulse(Location, VortexRadius, VortexImpulseStrength, RIF_Constant, true);
				}
				
				FracActor = FracturedStaticMeshActor(Victim);
				if (FracActor != none)
				{
					FracActor.BreakOffPartsInRadius(Location, VortexRadius, VortexImpulseStrength, true);
				}
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

	AdjustCanDisintigrate();
	GotoState('GrenadeState');
}

simulated function Timer_Detonate()
{
	Detonate();
}

simulated function Detonate()
{
	Explode(Location, vect(0,0,1) >> Rotation);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	super.Explode(HitLocation, HitNormal);
	GotoState('VortexState');
}

simulated function Timer_EndVortex()
{
	bVortexActive = false;
	DeferredDestroy(0.15);
}


/** Called when the owning instigator controller has left a game */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameOf(Timer_Detonate) );
	}
}

defaultproperties
{
   DetonationTime=5.000000
   VortexDuration=0.500000
   VortexRadius=450.000000
   VortexImpulseStrength=-100.000000
   bWarnAIWhenFired=True
   TouchTimeThreshhold=60.000000
   TerminalVelocity=3200.000000
   Begin Object Class=KFGameExplosion Name=ImploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Gravity_Imploder_ARCH.Yellow_Explosion'
      Damage=320.000000
      DamageRadius=280.000000
      DamageFalloffExponent=0.200000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_GravityImploder'
      KnockDownStrength=0.000000
      MomentumTransferScale=-10000.000000
      ExplosionSound=AkEvent'WW_WEP_Gravity_Imploder.Play_WEP_Gravity_Imploder_Grenade_Yellow_Implosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Grenade_GravityImploder:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ImploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Grenade_GravityImploder:ImploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_Gravity_Imploder_EMIT.FX_Yellow_Projectile'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_Gravity_Imploder_EMIT.FX_Yellow_Projectile_ZEDTIME'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=3200.000000
   MaxSpeed=3200.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=5.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_BallisticExplosive:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Grenade_GravityImploder"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
