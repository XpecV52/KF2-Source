//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Grenade_Demo extends KFWeaponDefinition
	abstract
	hidedropdown;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFProj_DynamiteGrenade"
   ImagePath="WEP_UI_Dynamite_TEX.UI_WeaponSelect_Dynamite"
   Name="Default__KFWeapDef_Grenade_Demo"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
