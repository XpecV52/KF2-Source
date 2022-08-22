//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MB500 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Shotgun_MB500"

	BuyPrice=200
	AmmoPricePerMag=30 //32
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Mossberg"

	EffectiveRange=20
}
