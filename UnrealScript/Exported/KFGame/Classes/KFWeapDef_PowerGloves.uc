//=============================================================================
// KFWeapDef_PowerGloves
//=============================================================================
// Weapon definition for power gloves melee weapon.
// This is the Static Strikers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_PowerGloves extends KFWeaponDefinition
    abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Blunt_PowerGloves"
   ImagePath="WEP_UI_Static_Strikers_TEX.UI_WeaponSelect_StaticStrikers"
   BuyPrice=1600
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=2
   Name="Default__KFWeapDef_PowerGloves"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
