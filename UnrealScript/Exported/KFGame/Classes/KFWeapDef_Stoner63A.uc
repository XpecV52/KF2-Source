//=============================================================================
// KFWeapDef_Stoner63A
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Stoner63A extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_LMG_Stoner63A"
   ImagePath="wep_ui_stoner63a_tex.UI_WeaponSelect_Stoner"
   BuyPrice=1500
   AmmoPricePerMag=70
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=68
   Name="Default__KFWeapDef_Stoner63A"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
