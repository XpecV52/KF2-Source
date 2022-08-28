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
   BuyPrice=1300
   AmmoPricePerMag=50
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SecondaryAmmoMagSize=10
   SecondaryAmmoMagPrice=10
   EffectiveRange=25
   Name="Default__KFWeapDef_Eviscerator"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
