//=============================================================================
// KFWeapDef_FlareGun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FlareGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Flare"
   ImagePath="wep_ui_flaregun_tex.UI_WeaponSelect_Flaregun"
   BuyPrice=325
   AmmoPricePerMag=13
   UpgradePrice(0)=600
   UpgradePrice(1)=700
   UpgradePrice(2)=1500
   UpgradeSellPrice(0)=450
   UpgradeSellPrice(1)=975
   UpgradeSellPrice(2)=2100
   EffectiveRange=50
   Name="Default__KFWeapDef_FlareGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
