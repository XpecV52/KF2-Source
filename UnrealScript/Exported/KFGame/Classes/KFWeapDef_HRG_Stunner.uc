//=============================================================================
// KFWeaponDefintion
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HRG_Stunner extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_Stunner"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AA12"
   BuyPrice=1500
   AmmoPricePerMag=36
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   EffectiveRange=70
   Name="Default__KFWeapDef_HRG_Stunner"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
