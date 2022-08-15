//=============================================================================
// KFProj_MicrowaveImpact
//=============================================================================
// Projectile class for ground impact from the microwave gun
// Really only here for decal effects for now
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_MicrowaveImpact extends KFProjectile;

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	TriggerExplosion(Location,vector(Rotation), None);
}

/*********************************************************************************************
* Collision
********************************************************************************************* */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	Super(Projectile).Touch(Other, OtherComp, HitLocation, HitNormal);
}

/**
 * Force the fire not to burn the instigator, since setti ng it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;
}

defaultproperties
{
   bAutoStartAmbientSound=True
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_GroundFire'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Microwave_Gun_ARCH.Beam_Impacts'
      bAllowPerMaterialFX=True
      Damage=0.000000
      DamageRadius=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Microwave_Beam'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_MicrowaveImpact:ExploTemplate0'
   PostExplosionLifetime=1.500000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MicrowaveImpact"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
