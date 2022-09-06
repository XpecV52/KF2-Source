//=============================================================================
// KFWeapDef_HRG_Kaboomstick
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFWeapDef_HRG_Kaboomstick extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_HRG_Kaboomstick"
   ImagePath="WEP_UI_HRG_Kaboomstick_TEX.UI_WeaponSelect_HRG_Kaboomstick"
   BuyPrice=1100
   AmmoPricePerMag=15
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=40
   Name="Default__KFWeapDef_HRG_Kaboomstick"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
