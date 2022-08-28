//=============================================================================
// KFWeapDef_Hemogoblin
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Hemogoblin extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Rifle_Hemogoblin"
   ImagePath="WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder"
   BuyPrice=1100
   AmmoPricePerMag=40
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=90
   Name="Default__KFWeapDef_Hemogoblin"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
