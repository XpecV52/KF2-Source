//=============================================================================
// KFWeapDef_AF2011
//=============================================================================
// Weapon definition for the AF2011-A1
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Mine_Reconstructor extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Mine_Reconstructor"
   ImagePath="WEP_UI_Mine_Reconstructor_TEX.UI_WeaponSelect_HMTechMineReconstructor"
   BuyPrice=1200
   AmmoPricePerMag=36
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SharedUnlockId=SCU_MineReconstructor
   EffectiveRange=50
   Name="Default__KFWeapDef_Mine_Reconstructor"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
