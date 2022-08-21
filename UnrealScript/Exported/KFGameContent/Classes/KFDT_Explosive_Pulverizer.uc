//=============================================================================
// KFDT_Explosive_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_Pulverizer extends KFDT_Explosive
	abstract
	hidedropdown; // remove to edit archetype

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Pulverizer'
   bCanObliterate=False
   GoreDamageGroup=DGT_Obliteration
   KnockdownPower=0.000000
   StumblePower=340.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   Name="Default__KFDT_Explosive_Pulverizer"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
