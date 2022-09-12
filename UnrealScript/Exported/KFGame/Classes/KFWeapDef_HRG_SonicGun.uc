//=============================================================================
// KFWeapDef_HRG_SonicGun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HRG_SonicGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_SonicGun"
   ImagePath="WEP_UI_HRG_SonicGun_TEX.UI_WeaponSelect_HRG_SonicGun"
   BuyPrice=1100
   AmmoPricePerMag=65
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=70
   Name="Default__KFWeapDef_HRG_SonicGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
