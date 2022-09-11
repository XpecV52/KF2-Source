//=============================================================================
// KFWeapDef_MicrowaveRifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HRG_EMP_ArcGenerator extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_EMP_ArcGenerator"
   ImagePath="WEP_UI_HRG_ArcGenerator_TEX.UI_WeaponSelect_HRG_ArcGenerator"
   BuyPrice=1500
   AmmoPricePerMag=110
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=70
   Name="Default__KFWeapDef_HRG_EMP_ArcGenerator"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
