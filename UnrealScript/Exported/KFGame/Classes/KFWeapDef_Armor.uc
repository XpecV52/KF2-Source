//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Armor extends KFWeaponDefinition
	abstract
	hidedropdown;

static function string GetItemLocalization(string KeyName)
{
	return Localize("Armor", KeyName, "KFGameContent");	
}

defaultproperties
{
   ImagePath="UI_TraderMenu_TEX.UI_WeaponSelect_Armor"
   AmmoPricePerMag=3
   Name="Default__KFWeapDef_Armor"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
