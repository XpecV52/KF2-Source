//=============================================================================
// KFWeapDef_BladedPistol
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_BladedPistol extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Bladed"
   ImagePath="WEP_UI_BladedPistol_TEX.UI_WeaponSelect_BladedPistol"
   BuyPrice=600
   AmmoPricePerMag=38
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=550
   UpgradeSellPrice(1)=1650
   SharedUnlockId=SCU_BladedPistol
   EffectiveRange=25
   Name="Default__KFWeapDef_BladedPistol"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
