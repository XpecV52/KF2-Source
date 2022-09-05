//=============================================================================
// KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGIncendiaryRifle'
   KnockdownPower=125.000000
   StumblePower=340.000000
   GunHitPower=275.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Ballistic_HRGIncendiaryRifleGrenadeImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
