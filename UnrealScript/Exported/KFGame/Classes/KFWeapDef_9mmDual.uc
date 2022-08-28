//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_9mmDual extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Dual9mm"
   ImagePath="WEP_UI_Dual_9MM_TEX.UI_WeaponSelect_Dual9mm"
   BuyPrice=300
   AmmoPricePerMag=24
   UpgradePrice(0)=200
   UpgradePrice(1)=500
   UpgradePrice(2)=600
   UpgradePrice(3)=700
   UpgradePrice(4)=1500
   UpgradeSellPrice(0)=0
   UpgradeSellPrice(1)=0
   UpgradeSellPrice(2)=0
   UpgradeSellPrice(3)=0
   UpgradeSellPrice(4)=0
   EffectiveRange=50
   Name="Default__KFWeapDef_9mmDual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
