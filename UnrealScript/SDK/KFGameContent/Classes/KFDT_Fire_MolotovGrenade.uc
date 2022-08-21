//=============================================================================
// KFDT_Fire_MolotovGrenade
//=============================================================================
// Damage type class for molotov grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Fire_MolotovGrenade extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=false

	// physics impact
	RadialDamageImpulse=0
	KDeathUpKick=0
	KDeathVel=0

	KnockdownPower=0
	StumblePower=100
	BurnPower=10

	// DOT
	DoT_DamageScale=0.2
	bIgnoreSelfInflictedScale=false

	WeaponDef=class'KFWeapDef_Grenade_Firebug'
}
