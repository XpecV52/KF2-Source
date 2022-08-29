//=============================================================================
// KFWeapDef_MicrowaveRifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MicrowaveRifle extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_Microwave"
   ImagePath="WEP_UI_Microwave_Assault_TEX.UI_WeaponSelect_Microwave_Assault"
   BuyPrice=1500
   AmmoPricePerMag=66
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=70
   Name="Default__KFWeapDef_MicrowaveRifle"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
