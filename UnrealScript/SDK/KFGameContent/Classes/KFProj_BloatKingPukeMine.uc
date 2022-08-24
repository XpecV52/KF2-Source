//=============================================================================
// KFProj_BloatKingPukeMine
//=============================================================================
// Projectile class for bloat king puke mine
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFProj_BloatKingPukeMine extends KFProj_BloatPukeMine;

defaultproperties
{
	ProjFlightTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_BloatKing_projectile_01'
	GroundFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Mine_01'
	Begin Object Name=ExploTemplate0
		ExplosionEffects=KFImpactEffectInfo'ZED_BloatKing_ARCH.Bloatking_Mine_Explosion'
		Damage=18 //45 //30 //15
		DamageRadius=450
		DamageFalloffExponent=0.f
		DamageDelay=0.f
		MyDamageType=class'KFDT_Toxic_BloatPukeMine'
		//bIgnoreInstigator is set to true in PrepareExplosionTemplate
	End Object
}