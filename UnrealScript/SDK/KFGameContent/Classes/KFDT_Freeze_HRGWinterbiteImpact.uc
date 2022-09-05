//=============================================================================
// KFDT_Freeze_HRGWinterbiteImpact
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Freeze_HRGWinterbiteImpact extends KFDT_Freeze
	abstract;

defaultproperties
{
	KDamageImpulse=1000
	KDeathUpKick=700
	KDeathVel=350

	FreezePower=10
	StumblePower=50
	GunHitPower=100

	WeaponDef=class'KFWeapDef_HRGWinterbite'

	ModifierPerkList(0)=class'KFPerk_Gunslinger'
}
