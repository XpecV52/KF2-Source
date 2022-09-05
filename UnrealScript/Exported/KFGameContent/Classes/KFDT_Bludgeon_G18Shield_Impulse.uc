//=============================================================================
// KFDT_Bludgeon_G18Shield
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_G18Shield_Impulse extends KFDT_Bludgeon
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_G18'
   StumblePower=350.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=1500.000000
   KDeathVel=450.000000
   KDeathUpKick=600.000000
   Name="Default__KFDT_Bludgeon_G18Shield_Impulse"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
