//=============================================================================
// KFWeapDef_HRGTeslauncher
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//	-Brooks Butler
//=============================================================================
class KFWeapDef_HRGTeslauncher extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_HRGTeslauncher"
   ImagePath="WEP_UI_HRG_Teslauncher_TEX.UI_WeaponSelect_HRG_Teslauncher"
   BuyPrice=1500
   AmmoPricePerMag=62
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SecondaryAmmoMagSize=1
   SecondaryAmmoMagPrice=15
   EffectiveRange=68
   Name="Default__KFWeapDef_HRGTeslauncher"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
