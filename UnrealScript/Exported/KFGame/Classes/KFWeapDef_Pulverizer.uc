//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Pulverizer extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Blunt_Pulverizer"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Pulverizer"
   BuyPrice=1300
   AmmoPricePerMag=85
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=3
   Name="Default__KFWeapDef_Pulverizer"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
