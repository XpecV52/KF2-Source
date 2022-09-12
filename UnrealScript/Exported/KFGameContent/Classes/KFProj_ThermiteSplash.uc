//=============================================================================
// KFProj_ThermiteSplash
//=============================================================================
// Projectile class for the thermite rocket launchers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFProj_ThermiteSplash extends KFProj_MolotovSplash;

/*
simulated function Tick(float Delta)
{
	super.Tick(Delta);

	if (WorldInfo.NetMode != NM_Client && WorldInfo.NetMode != NM_Standalone)
	{
		return;
	}

	// Rotate towards velocity:
	if (VSizeSq(Velocity) > 0)
	{
		SetRotation(rotator(Normal(Velocity)));
	}
}
*/

defaultproperties
{
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_Thermite'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'wep_thermite_arch.Thermite_GroundFire'
      bDirectionalExplosion=True
      Damage=10.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_ThermiteBore'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_ThermiteSplash:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_ThermiteSplash:ExploTemplate0'
   AltExploEffects=KFImpactEffectInfo'wep_thermite_arch.GroundFire_Splash_Impacts'
   ProjFlightTemplate=ParticleSystem'WEP_Thermite_EMIT.FX_Thermite_Spread_01'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFProj_MolotovSplash:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.250000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFProj_MolotovSplash:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovSplash:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFProj_MolotovSplash:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Components(2)=AmbientAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_ThermiteSplash"
   ObjectArchetype=KFProj_MolotovSplash'kfgamecontent.Default__KFProj_MolotovSplash'
}
