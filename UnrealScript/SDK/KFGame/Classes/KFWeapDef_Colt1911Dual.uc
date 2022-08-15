//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Colt1911Dual extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Pistol_DualColt1911"

	BuyPrice=650
	AmmoPricePerMag=20
	ImagePath="WEP_UI_Dual_M1911_TEX.UI_WeaponSelect_DualM1911"

	EffectiveRange=50
}
