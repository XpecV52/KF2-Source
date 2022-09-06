//=============================================================================
// KFWeapDef_Mac10
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Mac10 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_Mac10"
   ImagePath="WEP_UI_MAC10_TEX.UI_WeaponSelect_Mac10"
   BuyPrice=900
   AmmoPricePerMag=32
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=70
   Name="Default__KFWeapDef_Mac10"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
