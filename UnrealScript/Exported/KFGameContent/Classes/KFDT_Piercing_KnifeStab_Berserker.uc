//=============================================================================
// KFDT_Piercing_Knife_Berserker
//=============================================================================
// Stabbing damagetype for Berserker knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KnifeStab_Berserker extends KFDT_Piercing_KnifeStab
	abstract
	hidedropdown;

defaultproperties
{
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   Name="Default__KFDT_Piercing_KnifeStab_Berserker"
   ObjectArchetype=KFDT_Piercing_KnifeStab'KFGameContent.Default__KFDT_Piercing_KnifeStab'
}
