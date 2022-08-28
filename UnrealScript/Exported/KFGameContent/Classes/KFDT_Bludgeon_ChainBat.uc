//=============================================================================
// KFDT_Bludgeon_ChainBat
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_ChainBat extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ChainBat'
   EffectGroup=FXG_Bludgeon_Chains
   StumblePower=30.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1500.000000
   KDeathVel=400.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Bludgeon_ChainBat"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
