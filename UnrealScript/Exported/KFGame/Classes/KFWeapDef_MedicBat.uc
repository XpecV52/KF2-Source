//=============================================================================
// KFWeapDef_MedicBat
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MedicBat extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Blunt_MedicBat"
   ImagePath="WEP_UI_Medic_Bat_TEX.UI_WeaponSelect_MedicBat"
   BuyPrice=1200
   AmmoPricePerMag=75
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=3
   Name="Default__KFWeapDef_MedicBat"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
