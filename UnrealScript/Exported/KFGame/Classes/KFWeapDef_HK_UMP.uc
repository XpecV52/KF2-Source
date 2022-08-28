//=============================================================================
// KFWeapDef_HK_UMP
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HK_UMP extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_HK_UMP"
   ImagePath="WEP_UI_HK_UMP_TEX.UI_WeaponSelect_UMP"
   BuyPrice=1200
   AmmoPricePerMag=36
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=70
   Name="Default__KFWeapDef_HK_UMP"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
