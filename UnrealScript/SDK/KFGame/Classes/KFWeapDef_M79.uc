//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M79 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_GrenadeLauncher_M79"

	BuyPrice=1100
	AmmoPricePerMag=13
	ImagePath="WEP_UI_M79_TEX.UI_WeaponSelect_M79"

	EffectiveRange=100
}
