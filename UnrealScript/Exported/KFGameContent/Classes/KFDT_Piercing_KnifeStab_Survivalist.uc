//=============================================================================
// KFDT_Piercing_Knife_Survivalist
//=============================================================================
// Stabbing damagetype for Survivalist knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_KnifeStab_Survivalist extends KFDT_Piercing_KnifeStab
	abstract
	hidedropdown;

defaultproperties
{
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   Name="Default__KFDT_Piercing_KnifeStab_Survivalist"
   ObjectArchetype=KFDT_Piercing_KnifeStab'kfgamecontent.Default__KFDT_Piercing_KnifeStab'
}
