//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Bullpup extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_Bullpup"

	BuyPrice=650
	AmmoPricePerMag=30
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Bullpup"

	EffectiveRange=68
}
