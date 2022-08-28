//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AR15 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_AR15"

	BuyPrice=200
	AmmoPricePerMag=20
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AR15"

	EffectiveRange=60

	UpgradePrice[0]=500
	UpgradePrice[1]=600
	UpgradePrice[2]=700
	UpgradePrice[3]=1500

	UpgradeSellPrice[0]=375
	UpgradeSellPrice[1]=825
	UpgradeSellPrice[2]=1350
	UpgradeSellPrice[3]=2475
}
