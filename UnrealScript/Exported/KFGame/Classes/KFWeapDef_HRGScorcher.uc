//=============================================================================
// KFWeapDef_HRGScorcher
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// - Roberto Moreno (Saber Interactive)
//=============================================================================
class KFWeapDef_HRGScorcher extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_HRGScorcher"
   ImagePath="WEP_UI_HRGScorcher_Pistol_TEX.UI_WeaponSelect_HRGScorcher"
   BuyPrice=1000
   AmmoPricePerMag=12
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=100
   Name="Default__KFWeapDef_HRGScorcher"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
