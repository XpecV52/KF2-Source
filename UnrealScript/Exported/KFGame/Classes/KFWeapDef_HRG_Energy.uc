//=============================================================================
// KFWeapDef_HRG_Energy
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HRG_Energy extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_Energy"
   ImagePath="WEP_UI_HRG_Energy_TEX.UI_WeaponSelect_HRG_Energy"
   BuyPrice=1500
   AmmoPricePerMag=70
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=50
   Name="Default__KFWeapDef_HRG_Energy"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
