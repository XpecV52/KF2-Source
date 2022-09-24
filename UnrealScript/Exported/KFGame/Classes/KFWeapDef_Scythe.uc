//=============================================================================
// KFWeapDef_Scythe
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Scythe extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Edged_Scythe"
   ImagePath="WEP_UI_Scythe_TEX.UI_WeaponSelect_Scythe"
   BuyPrice=1500
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SharedUnlockId=SCU_Scythe
   EffectiveRange=5
   Name="Default__KFWeapDef_Scythe"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
