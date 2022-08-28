//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Colt1911 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Colt1911"
   ImagePath="WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt"
   BuyPrice=325
   AmmoPricePerMag=13
   UpgradePrice(0)=600
   UpgradePrice(1)=700
   UpgradePrice(2)=1500
   UpgradeSellPrice(0)=450
   UpgradeSellPrice(1)=975
   UpgradeSellPrice(2)=2100
   EffectiveRange=50
   Name="Default__KFWeapDef_Colt1911"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
