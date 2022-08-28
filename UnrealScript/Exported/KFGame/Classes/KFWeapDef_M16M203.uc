//=============================================================================
// KFWeapDef_M16M203
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//	-Brooks Butler
//=============================================================================
class KFWeapDef_M16M203 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_M16M203"
   ImagePath="wep_ui_m16_m203_tex.UI_WeaponSelect_M16M203"
   BuyPrice=1200
   AmmoPricePerMag=30
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SecondaryAmmoMagSize=1
   SecondaryAmmoMagPrice=15
   EffectiveRange=68
   Name="Default__KFWeapDef_M16M203"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
