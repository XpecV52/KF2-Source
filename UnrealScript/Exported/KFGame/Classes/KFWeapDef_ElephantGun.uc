//=============================================================================
// KFWeapDef_ElephantGun
// This is the Doomstick
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_ElephantGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_ElephantGun"
   ImagePath="WEP_UI_Quad_Barrel_TEX.UI_WeaponSelect_QuadBarrel"
   BuyPrice=1100
   AmmoPricePerMag=25
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=15
   Name="Default__KFWeapDef_ElephantGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
