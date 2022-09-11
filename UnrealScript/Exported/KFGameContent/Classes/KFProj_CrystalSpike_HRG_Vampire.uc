//=============================================================================
// KFProj_CrystalSpike_HRG_Vampire
//=============================================================================
// Bullet class for the HRG Vampire crystal spikes.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//
//=============================================================================

class KFProj_CrystalSpike_HRG_Vampire extends KFProj_Bullet
	hidedropdown;


simulated function ProcessBulletTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	super.ProcessBulletTouch(Other, HitLocation, HitNormal);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if ( Other.IsA('Pawn') && Other.bCanBeDamaged)
		{
			WorldInfo.MyEmitterPool.SpawnEmitter(ImpactEffects.DefaultImpactEffect.ParticleTemplate, HitLocation, rotator(HitNormal), Other);
			PlaySoundBase(ImpactEffects.DefaultImpactEffect.Sound, true,,, HitLocation);
		}
	}
}

defaultproperties
{
   bNoReplicationToInstigator=False
   bWarnAIWhenFired=True
   TerminalVelocity=12000.000000
   ProjFlightTemplate=ParticleSystem'WEP_HRG_Vampire_EMIT.FX_HRG_Vampire_Projectile_ALT'
   AmbientSoundPlayEvent=None
   AmbientSoundStopEvent=None
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_HRG_Vampire_Arch.HRG_Vampire_SpikeFireImpacts'
   AssociatedPerkClass=Class'KFGame.KFPerk_FieldMedic'
   Speed=12000.000000
   MaxSpeed=12000.000000
   bBlockedByInstigator=False
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bNoEncroachCheck=True
   LifeSpan=10.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_CrystalSpike_HRG_Vampire"
   ObjectArchetype=KFProj_Bullet'KFGame.Default__KFProj_Bullet'
}
