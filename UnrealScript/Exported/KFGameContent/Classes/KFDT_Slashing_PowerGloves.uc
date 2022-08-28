//=============================================================================
// KFDT_Slashing_PowerGloves
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_PowerGloves extends KFDT_Slashing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_PowerGloves'
   StumblePower=150.000000
   MeleeHitPower=200.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=2500.000000
   KDeathVel=400.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Slashing_PowerGloves"
   ObjectArchetype=KFDT_Slashing'KFGame.Default__KFDT_Slashing'
}
