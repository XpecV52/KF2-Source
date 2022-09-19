//=============================================================================
// KFWeapDef_AutoTurret
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AutoTurret extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AutoTurret"
   ImagePath="WEP_UI_AutoTurret_TEX.UI_WeaponSelect_AutoTurret"
   BuyPrice=500
   AmmoPricePerMag=60
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SharedUnlockId=SCU_AutoTurret
   EffectiveRange=18
   Name="Default__KFWeapDef_AutoTurret"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
