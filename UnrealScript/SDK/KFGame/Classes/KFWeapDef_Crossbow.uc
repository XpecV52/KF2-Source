//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Crossbow extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Bow_Crossbow"

	BuyPrice=650
	AmmoPricePerMag=11
	ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"

	EffectiveRange=80
}
