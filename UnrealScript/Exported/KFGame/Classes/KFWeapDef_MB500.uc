//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MB500 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_MB500"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Mossberg"
   BuyPrice=200
   AmmoPricePerMag=30
   UpgradePrice(0)=500
   UpgradePrice(1)=600
   UpgradePrice(2)=700
   UpgradePrice(3)=1500
   UpgradeSellPrice(0)=375
   UpgradeSellPrice(1)=825
   UpgradeSellPrice(2)=1350
   UpgradeSellPrice(3)=2475
   EffectiveRange=20
   Name="Default__KFWeapDef_MB500"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
