//=============================================================================
// KFWeapDef_FlareGunDual
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FlareGunDual extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_DualFlare"
   ImagePath="wep_ui_dual_flaregun_tex.UI_WeaponSelect_DualFlaregun"
   BuyPrice=650
   AmmoPricePerMag=26
   UpgradePrice(0)=600
   UpgradePrice(1)=700
   UpgradePrice(2)=1500
   UpgradeSellPrice(0)=450
   UpgradeSellPrice(1)=975
   UpgradeSellPrice(2)=2100
   EffectiveRange=50
   Name="Default__KFWeapDef_FlareGunDual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
