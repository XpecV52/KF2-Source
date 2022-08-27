//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Remington1858 extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Revolver_Rem1858"

	BuyPrice=100
	AmmoPricePerMag=10 //6
	ImagePath="WEP_UI_Remington_1858_TEX.UI_WeaponSelect_Remington"

	EffectiveRange=50
}
