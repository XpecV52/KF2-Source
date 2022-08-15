//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Knife_Demo extends KFweapDef_Knife_Base
	abstract
	hidedropdown;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Knife_Demolitionist"
   ImagePath="WEP_UI_Demo_Knife_TEX.UI_WeaponSelect_DemoKnife"
   Name="Default__KFWeapDef_Knife_Demo"
   ObjectArchetype=KFweapDef_Knife_Base'KFGame.Default__KFweapDef_Knife_Base'
}
