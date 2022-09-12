//=============================================================================
// KFProj_SonicBlastHalfCharged_HRG_SonicGun
//=============================================================================
// HRG Sonic Gun sonic projectile for default fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFProj_SonicBlastHalfCharged_HRG_SonicGun extends KFProj_Bullet;

var bool bDebugShowProjectile;
var bool bDebugPersistentLines;


/**
 * Initialize the Projectile
 */
function Init(vector Direction)
{
    super(KFProjectile).Init( Direction );
}

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();
	//TODO: Remove. Temporal to see change in FX
	ProjEffects.SetScale( 2.0 );
}

simulated event Tick(float DeltaTime)
{
	//cylinders debug
	//local vector A, B;
	//A = Location;
	//B.X = `SONICBLASTHALFCHARGED_COLLISION;
	//B.Y = `SONICBLASTHALFCHARGED_COLLISION;
	//B.Z = `SONICBLASTHALFCHARGED_COLLISION;
	//DrawDebugBox( A, B, 255, 255, 0, bDebugPersistentLines); // SLOW! Use for debugging only!
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	super.ProcessTouch(Other, HitLocation, HitNormal);
	if (PenetrationPower <= 0)
	{
		Shutdown();
	}
}

defaultproperties
{
   bNoReplicationToInstigator=False
   bAlwaysReplicateExplosion=True
   bWarnAIWhenFired=True
   GlassShatterType=FMGS_ShatterAll
   TouchTimeThreshhold=0.200000
   GravityScale=0.000000
   ExtraLineCollisionOffsets(1)=(X=0.000000,Y=-30.000000,Z=0.000000)
   ExtraLineCollisionOffsets(2)=(X=0.000000,Y=30.000000,Z=0.000000)
   ExtraLineCollisionOffsets(3)=(X=0.000000,Y=0.000000,Z=-30.000000)
   ExtraLineCollisionOffsets(4)=(X=0.000000,Y=0.000000,Z=30.000000)
   TerminalVelocity=3600.000000
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_Projectile_AltFire'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HRG_SonicGun_EMIT.FX_Projectile_AltFire'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_SonicGun_ARCH.HRG_SonicGun_Projectile_AltFire_Impacts'
   AssociatedPerkClass=Class'KFGame.KFPerk_Sharpshooter'
   Speed=3600.000000
   MaxSpeed=3600.000000
   bBlockedByInstigator=False
   bIgnoreFoliageTouch=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   bCanBeDamaged=False
   bCollideComplex=False
   NetUpdateFrequency=200.000000
   NetPriority=5.000000
   LifeSpan=1.800000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_SonicBlastHalfCharged_HRG_SonicGun"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
