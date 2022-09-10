//=============================================================================
// KFWeapDef_HRGIncendiaryRifle
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================
class KFWeapDef_HRGIncendiaryRifle extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_HRGIncendiaryRifle"
   ImagePath="WEP_UI_HRG_IncendiaryRifle_TEX.UI_WeaponSelect_HRG_IncendiaryRifle"
   BuyPrice=1200
   AmmoPricePerMag=30
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SecondaryAmmoMagSize=1
   SecondaryAmmoMagPrice=15
   EffectiveRange=68
   Name="Default__KFWeapDef_HRGIncendiaryRifle"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}