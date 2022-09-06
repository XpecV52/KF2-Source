//=============================================================================
// KFProj_Flame_HRGIncendiaryRifle
//=============================================================================
// Projectile class for the residual flames from the rifle's grenade.
// It behaves like the molotov residual flames.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Flame_HRGIncendiaryRifle extends KFProj_MolotovSplash;

/** Overridden to adjust particle system for different surface orientations (wall, ceiling)
  * and nudge location
  */
simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosion_HRGIncendiaryRifleGroundFire KFEM;
	local vector ExplosionDir;

	super.PrepareExplosionActor( GEA );

	// KFProjectile::Explode gives GEA a "nudged" location of 32 units, but it's too much, so use a smaller nudge
	GEA.SetLocation( Location + vector(GEA.Rotation) * 10 );

	KFEM = KFExplosion_HRGIncendiaryRifleGroundFire( GEA );
	if( KFEM != none )
	{
		ExplosionDir = vector( KFEM.Rotation );

		if( ExplosionDir.Z < -0.95 )
		{
			// ceiling
			KFEM.LoopingParticleEffect = KFEM.default.LoopingParticleEffectCeiling;
		}
		else if( ExplosionDir.Z < 0.05 )
		{
			// wall
			KFEM.LoopingParticleEffect = KFEM.default.LoopingParticleEffectWall;
		}
		// else floor
	}
}

	

defaultproperties
{
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_HRGIncendiaryRifleGroundFire'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0 Archetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
      ExplosionEffects=KFImpactEffectInfo'wep_molotov_arch.Molotov_GroundFire'
      bDirectionalExplosion=True
      Damage=4.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_HRGIncendiaryRifle'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_Flame_HRGIncendiaryRifle:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'kfgamecontent.Default__KFProj_MolotovSplash:ExploTemplate0'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_Flame_HRGIncendiaryRifle:ExploTemplate0'
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Flame_HRGIncendiaryRifle"
   ObjectArchetype=KFProj_MolotovSplash'kfgamecontent.Default__KFProj_MolotovSplash'
}
