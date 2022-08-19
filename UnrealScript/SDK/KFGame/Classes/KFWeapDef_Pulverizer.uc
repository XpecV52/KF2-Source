//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Pulverizer extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Blunt_Pulverizer"
	
	BuyPrice=1200
	AmmoPricePerMag=85
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Pulverizer"

	EffectiveRange=3
}
