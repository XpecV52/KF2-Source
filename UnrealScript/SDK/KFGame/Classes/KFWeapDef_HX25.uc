//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HX25 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_GrenadeLauncher_HX25"

	BuyPrice=300
	AmmoPricePerMag=5
	ImagePath="WEP_UI_HX25_Pistol_TEX.UI_WeaponSelect_HX25"

	EffectiveRange=25
}
