//=============================================================================
// KFDT_Ballistic_Rem1858
//=============================================================================
// Remington 1858 damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_Rem1858 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=2500
	KDeathUpKick=-500
	KDeathVel=200

	KnockdownPower=30
	StumblePower=45
	LegStumblePower=45
	GunHitPower=35

	WeaponDef=class'KFWeapDef_Remington1858'

	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}
