//=============================================================================
// KFWeapDef_HuskCannon
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HuskCannon extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HuskCannon"
   ImagePath="WEP_UI_HuskCannon_TEX.UI_WeaponSelect_HuskCannon"
   BuyPrice=1500
   AmmoPricePerMag=50
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=60
   Name="Default__KFWeapDef_HuskCannon"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
