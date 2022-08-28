//=============================================================================
// KFWeapDef_AF2011Dual
//=============================================================================
// Weapon definition for the AF2011-A1
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AF2011Dual extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_DualAF2011"
   ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"
   BuyPrice=1100
   AmmoPricePerMag=46
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=50
   Name="Default__KFWeapDef_AF2011Dual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
