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

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Flame_CaulkBurn"
   ImagePath="WEP_UI_CaulkBurn_TEX.UI_WeaponSelect_CaulkNBurn"
   BuyPrice=200
   AmmoPricePerMag=20
   UpgradePrice(0)=500
   UpgradePrice(1)=600
   UpgradePrice(2)=700
   UpgradePrice(3)=1500
   UpgradeSellPrice(0)=375
   UpgradeSellPrice(1)=825
   UpgradeSellPrice(2)=1350
   UpgradeSellPrice(3)=2475
   EffectiveRange=15
   Name="Default__KFWeapDef_CaulkBurn"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
