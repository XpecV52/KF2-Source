//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MedicRifle extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_Medic"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicAssault"
   BuyPrice=1100
   AmmoPricePerMag=35
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=70
   Name="Default__KFWeapDef_MedicRifle"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
