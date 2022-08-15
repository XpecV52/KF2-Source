//=============================================================================
// KFGameExplosion
//=============================================================================
// Explosion Template
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 9/16/2013
//=============================================================================

class KFGameExplosion extends GameExplosion;

/** When this projectile explodes, this is the shard to spawn, if any **/
var() class<Projectile> ShardClass;
/** If the projectile is going to explode with shards, this is number of shards to spawn **/
var() int NumShards;

/** Impact info (decal, vfx, etc.), so that each explosion type on various surfaces can have different effects if desired. Doesn't do anything with the sound */
var() KFImpactEffectInfo    ExplosionEffects;

defaultproperties
{
   bOrientCameraShakeTowardsEpicenter=True
   Damage=200.000000
   DamageRadius=500.000000
   DamageFalloffExponent=1.000000
   MyDamageType=Class'KFGame.KFDT_Explosive'
   KnockDownStrength=100.000000
   MomentumTransferScale=50000.000000
   FractureMeshRadius=200.000000
   FracturePartVel=500.000000
   CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Default_Misc'
   CamShakeInnerRadius=450.000000
   CamShakeOuterRadius=900.000000
   CamShakeFalloff=1.000000
   Name="Default__KFGameExplosion"
   ObjectArchetype=GameExplosion'GameFramework.Default__GameExplosion'
}
