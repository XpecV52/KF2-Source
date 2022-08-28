//=============================================================================
// KFWeapDef_ElephantGun
// This is the Doomstick
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_ElephantGun extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Shotgun_ElephantGun"

	BuyPrice=1100
	AmmoPricePerMag=25 //10
	ImagePath="WEP_UI_Quad_Barrel_TEX.UI_WeaponSelect_QuadBarrel" //@TODO: Replace

	EffectiveRange=15

	UpgradePrice[0]=700
	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1650
}
