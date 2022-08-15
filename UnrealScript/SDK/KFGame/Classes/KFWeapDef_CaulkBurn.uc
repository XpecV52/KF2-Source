//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_CaulkBurn extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Flame_CaulkBurn"

	BuyPrice=200
	AmmoPricePerMag=15
	ImagePath="WEP_UI_CaulkBurn_TEX.UI_WeaponSelect_CaulkNBurn"

	EffectiveRange=15
}
