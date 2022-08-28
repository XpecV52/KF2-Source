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

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Revolver_Rem1858"
   ImagePath="WEP_UI_Remington_1858_TEX.UI_WeaponSelect_Remington"
   BuyPrice=100
   AmmoPricePerMag=10
   UpgradePrice(0)=500
   UpgradePrice(1)=600
   UpgradePrice(2)=700
   UpgradePrice(3)=1500
   UpgradeSellPrice(0)=95
   UpgradeSellPrice(1)=175
   UpgradeSellPrice(2)=275
   UpgradeSellPrice(3)=490
   EffectiveRange=50
   Name="Default__KFWeapDef_Remington1858"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
