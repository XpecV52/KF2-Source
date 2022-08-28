//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SW500Dual extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Revolver_DualSW500"
   ImagePath="WEP_UI_Dual_SW_500_TEX.UI_WeaponSelect_DualSW500"
   BuyPrice=1500
   AmmoPricePerMag=50
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=390
   EffectiveRange=50
   Name="Default__KFWeapDef_SW500Dual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
