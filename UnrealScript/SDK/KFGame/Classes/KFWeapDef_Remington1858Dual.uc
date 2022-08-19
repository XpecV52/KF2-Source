//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Remington1858Dual extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Revolver_DualRem1858"

	BuyPrice=200
	AmmoPricePerMag=12
	ImagePath="WEP_UI_DualRemington1858_TEX.UI_WeaponSelect_DualRemington"

	EffectiveRange=50
}
