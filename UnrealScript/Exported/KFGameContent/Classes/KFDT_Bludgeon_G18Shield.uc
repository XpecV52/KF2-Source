//=============================================================================
// KFDT_Bludgeon_G18Shield
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_G18Shield extends KFDT_Bludgeon
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_G18'
   MeleeHitPower=100.000000
   ModifierPerkList(0)=None
   ModifierPerkList(1)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=2000.000000
   KDeathVel=500.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Bludgeon_G18Shield"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
