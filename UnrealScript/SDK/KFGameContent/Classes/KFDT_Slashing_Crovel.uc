//=============================================================================
// KFDT_Bludgeon_Crovel
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_Crovel extends KFDT_Slashing
	abstract
	hidedropdown;

`include(KFGame\KFMatchStats.uci);

defaultproperties
{
	KDamageImpulse=1250
	KDeathUpKick=500
	KDeathVel=250

	MeleeHitPower=30
	StunPower=42
	StumblePower=43
	LegStumblePower=43

	WeaponDef=class'KFWeapDef_Crovel'
	ModifierPerkList(0)=class'KFPerk_Berserker'	
}
