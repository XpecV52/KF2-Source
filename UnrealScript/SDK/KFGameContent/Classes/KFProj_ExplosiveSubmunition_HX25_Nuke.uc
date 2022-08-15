//=============================================================================
// KFProj_ExplosiveSubmunition_HX25_Nuke
//=============================================================================
// Explosive submunition projectile for the HX25 when the demo's nuke skill is 
// active
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFProj_ExplosiveSubmunition_HX25_Nuke extends KFProj_ExplosiveSubmunition_HX25
	hidedropdown;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
	ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
	ExplosionTemplate.Damage = default.ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
    ExplosionTemplate.DamageRadius = default.ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
    ExplosionTemplate.DamageFalloffExponent = default.ExplosionTemplate.DamageFalloffExponent;     
}

defaultproperties
{
}

