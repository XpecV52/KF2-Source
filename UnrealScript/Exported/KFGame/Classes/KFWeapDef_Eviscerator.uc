//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Eviscerator extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Eviscerator"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SawbladeShooter"
   BuyPrice=1600
   AmmoPricePerMag=75
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SecondaryAmmoMagSize=10
   SecondaryAmmoMagPrice=10
   EffectiveRange=25
   Name="Default__KFWeapDef_Eviscerator"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
