//=============================================================================
// KFWeapDef_MaceAndShield
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MaceAndShield extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Blunt_MaceAndShield"
   ImagePath="WEP_UI_Shield_Melee_TEX.UI_WeaponSelect_MaceShield"
   BuyPrice=1300
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=3
   Name="Default__KFWeapDef_MaceAndShield"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
