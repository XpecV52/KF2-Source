//=============================================================================
// KFDT_Slashing_Knife_Survivalist
//=============================================================================
// Slashing damagetype for Survivalist knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_Knife_Survivalist extends KFDT_Slashing_Knife
	abstract
	hidedropdown;

defaultproperties
{
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   Name="Default__KFDT_Slashing_Knife_Survivalist"
   ObjectArchetype=KFDT_Slashing_Knife'kfgamecontent.Default__KFDT_Slashing_Knife'
}
