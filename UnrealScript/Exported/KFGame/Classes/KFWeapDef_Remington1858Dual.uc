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

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Revolver_DualRem1858"
   ImagePath="WEP_UI_DualRemington1858_TEX.UI_WeaponSelect_DualRemington"
   BuyPrice=200
   AmmoPricePerMag=12
   EffectiveRange=50
   Name="Default__KFWeapDef_Remington1858Dual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
