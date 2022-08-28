//=============================================================================
// KFWeapDef_M99
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M99 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Rifle_M99"

	BuyPrice = 1100
	AmmoPricePerMag = 21 //40
	ImagePath="WEP_UI_M99_TEX.UI_WeaponSelect_M99"

	EffectiveRange = 100

	UpgradePrice[0]=700
	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1650
}
