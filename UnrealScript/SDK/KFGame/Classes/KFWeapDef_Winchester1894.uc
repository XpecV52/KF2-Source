//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Winchester1894 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Rifle_Winchester1894"

	BuyPrice=200
	AmmoPricePerMag=32 //30
	ImagePath="wep_ui_winchester_tex.UI_WeaponSelect_Winchester"

	EffectiveRange=70
}
