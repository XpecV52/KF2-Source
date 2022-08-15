//=============================================================================
// KFDT_Bludgeon_CrovelHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Crovel extends KFDT_Bludgeon
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=1500
	KDeathUpKick=800
	KDeathVel=400

	KnockdownPower=22
	StunPower=42
	StumblePower=51
	LegStumblePower=51
	MeleeHitPower=50

	AARWeaponID=`AAR_Crovel
	ModifierPerkList(0)=class'KFPerk_Berserker'
}
