//=============================================================================
// KFDT_Ballistic_M14EBR
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_M14EBR extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

defaultproperties
{
	KDamageImpulse=600

	StunPower=20
	StumblePower=10
	LegStumblePower=15
	GunHitPower=30
	MeleeHitPower=25

	ModifierPerkList(0)=class'KFPerk_Sharpshooter'
}
