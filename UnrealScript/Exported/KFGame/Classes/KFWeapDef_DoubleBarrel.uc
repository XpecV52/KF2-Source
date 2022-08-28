//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DoubleBarrel extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_DoubleBarrel"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_DBShotgun"
   BuyPrice=750
   AmmoPricePerMag=13
   UpgradePrice(0)=600
   UpgradePrice(1)=700
   UpgradePrice(2)=1500
   UpgradeSellPrice(0)=450
   UpgradeSellPrice(1)=975
   UpgradeSellPrice(2)=2100
   EffectiveRange=15
   Name="Default__KFWeapDef_DoubleBarrel"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
