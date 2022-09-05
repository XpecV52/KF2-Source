//=============================================================================
// KFWeapDef_G18
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_G18 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_G18"
   ImagePath="WEP_UI_RiotShield_TEX.UI_WeaponSelect_RiotShield"
   BuyPrice=1500
   AmmoPricePerMag=24
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SharedUnlockId=SCU_G18RiotShield
   EffectiveRange=70
   Name="Default__KFWeapDef_G18"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
