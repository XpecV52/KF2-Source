//=============================================================================
// KFProj_GroundFire
//=============================================================================
// Projectile class for ground fire from flamethrowers, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_GroundFire extends KFProjectile;

var() float BurnDamageInterval;

/** Warns AI that this projectile has been fired */
function WarnAI( vector Direction )
{
	local KFPawn_Monster KFPM;
	local vector DangerPoint;

	DangerPoint = Location;

	foreach VisibleCollidingActors( class'KFPawn_Monster', KFPM, 300.f, Location, true )
	{
        if( KFPM.MyKFAIC != none && KFPM.IsAliveAndWell() )
        {
        	// Scale danger point up to pawn's Z location
        	DangerPoint.Z = KFPM.Location.Z;

	        // Tell the zed to evade away from the DangerPoint
	        KFPM.MyKFAIC.ReceiveLocationalWarning( DangerPoint, Location, self );
	    }
	}
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameof( bHasExploded ) )
	{
		return; // This would trigger another explosion, we don't need to do it for the groundfire.
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	// Checks if we want to swap the explosion effects
	InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( InstigatorPRI != none )
	{
		bAltExploEffects = InstigatorPRI.bSplashActive;
	}

	TriggerExplosion( Location, vector(Rotation), None );

	Super.PostBeginPlay();
}

/*********************************************************************************************
* Collision
********************************************************************************************* */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	//Super(Projectile).Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosionActorLingering KFE_GroundFire;

	KFE_GroundFire = KFExplosionActorLingering( GEA );
	if( KFE_GroundFire != none )
	{
		KFE_GroundFire.Interval = BurnDamageInterval;
	}
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;

	// Swap the ExplosionTemplate's effect if necessary
	if( bAltExploEffects )
	{
		ExplosionTemplate.ExplosionEffects = AltExploEffects;
	}
}

defaultproperties
{
   BurnDamageInterval=0.250000
   bAutoStartAmbientSound=True
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_GroundFire'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Impacts'
      bAllowPerMaterialFX=True
      Damage=15.000000
      DamageRadius=200.000000
      MyDamageType=Class'KFGame.KFDT_Fire_Ground'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_GroundFire:FlamePointLight'
      ExploLightFadeOutTime=0.500000
      ExploLightStartFadeOutTime=1.500000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_GroundFire:ExploTemplate0'
   PostExplosionLifetime=2.500000
   AltExploEffects=KFImpactEffectInfo'WEP_Flamethrower_ARCH.GroundFire_Splash_Impacts'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   RemoteRole=ROLE_None
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_GroundFire"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
