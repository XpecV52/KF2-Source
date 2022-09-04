//=============================================================================
// KFWeapDef_SW500_HRG
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SW500_HRG extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_Revolver_Buckshot"
   ImagePath="WEP_UI_HRG_SW_500_TEX.UI_WeaponSelect_HRG_SW500"
   BuyPrice=550
   AmmoPricePerMag=19
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=15
   Name="Default__KFWeapDef_SW500_HRG"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}