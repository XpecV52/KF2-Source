//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SCAR extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_SCAR"

	BuyPrice=1100 //1500
	AmmoPricePerMag=28
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	EffectiveRange=70

	UpgradePrice[0]=700
	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1650
}
