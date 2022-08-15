//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Zweihander extends KFWeaponDefinition
	abstract;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFWeap_Edged_Zweihander"
	
	BuyPrice=1000	
	ImagePath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander"

	EffectiveRange=3

	SharedUnlockId=SCU_Zweihander
}
