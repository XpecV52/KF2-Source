//=============================================================================
// KFWeapDef_M99
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M99 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Rifle_M99"
   ImagePath="WEP_UI_M99_TEX.UI_WeaponSelect_M99"
   BuyPrice=1100
   AmmoPricePerMag=21
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=100
   Name="Default__KFWeapDef_M99"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
