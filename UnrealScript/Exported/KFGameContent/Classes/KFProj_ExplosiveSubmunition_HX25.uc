//=============================================================================
// KFProj_ExplosiveSubmunition_HX25
//=============================================================================
// Explosive submunition projectile for the HX25
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibso
//=============================================================================

class KFProj_ExplosiveSubmunition_HX25 extends KFProj_BallisticExplosive
	hidedropdown;

/** Cached reference to owner weapon */
var protected KFWeapon OwnerWeapon;

/** Initialize the projectile */
function Init( vector Direction )
{
	super.Init( Direction );

	OwnerWeapon = KFWeapon( Owner );
	if( OwnerWeapon != none )
	{
		OwnerWeapon.LastPelletFireTime = WorldInfo.TimeSeconds;
	}
}

/** Don't allow more than one pellet projectile to perform this check in a single frame */
function bool ShouldWarnAIWhenFired()
{
	return super.ShouldWarnAIWhenFired() && OwnerWeapon != none && OwnerWeapon.LastPelletFireTime < WorldInfo.TimeSeconds;
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;

    super.PrepareExplosionTemplate();
}

simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
    // For some reason on clients up close shots with this projectile
    // get HitWall calls instead of Touch calls. This little hack fixes
    // the problem. TODO: Investigate why this happens - Ramm
    // If we hit a pawn with a HitWall call on a client, do touch instead
    if( WorldInfo.NetMode == NM_Client && Pawn(Wall) != none )
    {
        Touch( Wall, WallComp, Location, HitNormal );
        return;
    }

    Super.HitWall(HitNormal, Wall, WallComp);
}

defaultproperties
{
   bWarnAIWhenFired=True
   AlwaysRelevantDistanceSquared=2250000.000000
   TossZ=150.000000
   GravityScale=0.250000
   TerminalVelocity=5000.000000
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion'
      Damage=30.000000
      DamageRadius=150.000000
      ActorClassToIgnoreForDamage=Class'kfgamecontent.KFProj_ExplosiveSubmunition_HX25'
      MyDamageType=Class'kfgamecontent.KFDT_ExplosiveSubmunition_HX25'
      KnockDownStrength=10.000000
      MomentumTransferScale=1.000000
      ExplosionSound=AkEvent'WW_WEP_SA_HX25.Play_WEP_SA_HX25_Mini_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:ExplosionPointLight'
      ExploLightFadeOutTime=0.300000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Guns.HX25_Submunition_CameraShake'
      CamShakeInnerRadius=150.000000
      CamShakeOuterRadius=300.000000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_ExplosiveSubmunition_HX25:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_HX25_Pistol_ARCH.HX25_Pistol_Submunition_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_HX25_Pistol_EMIT.FX_HX25_Pistol_Projectile_small_ZEDTIME'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_BallisticExplosive:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Speed=5000.000000
   MaxSpeed=5000.000000
   MomentumTransfer=50000.000000
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_ExplosiveSubmunition_HX25"
   ObjectArchetype=KFProj_BallisticExplosive'KFGame.Default__KFProj_BallisticExplosive'
}
