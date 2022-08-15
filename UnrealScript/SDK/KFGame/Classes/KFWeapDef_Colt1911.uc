//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Colt1911 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Pistol_Colt1911"

	BuyPrice=325
	AmmoPricePerMag=10
	ImagePath="WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt"

	EffectiveRange=50
}
