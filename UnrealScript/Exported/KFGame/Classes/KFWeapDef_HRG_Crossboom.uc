//=============================================================================
// KFWeapDef_HRG_Crossboom
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFWeapDef_HRG_Crossboom extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_Crossboom"
   ImagePath="WEP_UI_HRG_Crossboom_TEX.UI_WeaponSelect_Crossboom"
   BuyPrice=900
   AmmoPricePerMag=14
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=80
   Name="Default__KFWeapDef_HRG_Crossboom"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
