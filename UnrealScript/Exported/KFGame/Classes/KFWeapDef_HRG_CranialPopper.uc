//=============================================================================
// KFWeapDef_HRG_CranialPopper
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HRG_CranialPopper extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_CranialPopper"
   ImagePath="wep_ui_hrg_cranialpopper_tex.UI_WeaponSelect_HRG_CranialPopper"
   BuyPrice=1100
   AmmoPricePerMag=40
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=90
   Name="Default__KFWeapDef_HRG_CranialPopper"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
