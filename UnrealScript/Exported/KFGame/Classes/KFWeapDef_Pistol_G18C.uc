//=============================================================================
// KFWeapDef_Pistol_G18C
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================
class KFWeapDef_Pistol_G18C extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_G18C"
   ImagePath="WEP_UI_G18C_TEX.UI_WeaponSelect_G18C"
   BuyPrice=750
   AmmoPricePerMag=38
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SharedUnlockId=SCU_G18C
   EffectiveRange=30
   Name="Default__KFWeapDef_Pistol_G18C"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
