//=============================================================================
// KFProj_BrokenFlare_HRGScorcherSplash
//=============================================================================
// Projectile class for HRG Scorcher splash.  Handles a few overrides.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFProj_BrokenFlare_HRGScorcherSplash extends KFProj_MolotovSplash;


/** Overridden to adjust particle system for different surface orientations (wall, ceiling),
  * nudge location and change to alternate effects if is Firebug with Splash Skill (Ground Fire)
  */
simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosion_HRGScorcherGroundFire KFEM;
	local vector ExplosionDir;

	super.PrepareExplosionActor( GEA );

	// KFProjectile::Explode gives GEA a "nudged" location of 32 units, but it's too much, so use a smaller nudge
	GEA.SetLocation( Location + vector(GEA.Rotation) * 10 );

	KFEM = KFExplosion_HRGScorcherGroundFire( GEA );
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
        else if(bAltExploEffects)
        {
            KFEM.LoopingParticleEffect = KFEM.default.LoopingParticleEffectAlternate;
        }
		// else floor
	}
}

/** 
* Use alternative explosion effects when Ground Fire Perk is active
*/
simulated function PostBeginPlay()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	if( AltExploEffects != none && Instigator != none )
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( InstigatorPRI != none )
		{
			bAltExploEffects = InstigatorPRI.bSplashActive;
		}
	}
	else
	{
		bAltExploEffects = false;
	}

	super.PostBeginPlay();
}

defaultproperties
{
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_HRGScorcherGroundFire'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      bDirectionalExplosion=True
      Damage=10.000000
      DamageRadius=150.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_Ground_HRGScorcher'
      KnockDownStrength=0.000000
      MomentumTransferScale=1.000000
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_BrokenFlare_HRGScorcherSplash:FlamePointLight'
      ExploLightFadeOutTime=0.300000
      ExploLightStartFadeOutTime=4.200000
      ExploLightFlickerIntensity=5.000000
      ExploLightFlickerInterpSpeed=15.000000
      FractureMeshRadius=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_BrokenFlare_HRGScorcherSplash:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_HRGScorcher_FireDrip'
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
   Name="Default__KFProj_BrokenFlare_HRGScorcherSplash"
   ObjectArchetype=KFProj_MolotovSplash'kfgamecontent.Default__KFProj_MolotovSplash'
}
