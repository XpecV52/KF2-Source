//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Grenade_Firebug extends KFWeaponDefinition
	abstract
	hidedropdown;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFProj_MolotovGrenade"
   ImagePath="WEP_UI_Molotov_TEX.UI_WeaponSelect_MolotovCocktail"
   Name="Default__KFWeapDef_Grenade_Firebug"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}