//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Knife_Survivalist extends KFweapDef_Knife_Base
	abstract
	hidedropdown;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Knife_Survivalist"
   ImagePath="Wep_UI_Survival_Knife_TEX.UI_WeaponSelect_SurvivalistKnife"
   Name="Default__KFWeapDef_Knife_Survivalist"
   ObjectArchetype=KFweapDef_Knife_Base'KFGame.Default__KFweapDef_Knife_Base'
}
