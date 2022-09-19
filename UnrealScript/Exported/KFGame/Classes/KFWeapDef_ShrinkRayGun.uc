//=============================================================================
// KFWeapDef_ShrinkRayGun
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_ShrinkRayGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_ShrinkRayGun"
   ImagePath="WEP_UI_ShrinkRay_Gun_TEX.UI_Weapon_Select_Shrink_Ray_Gun"
   BuyPrice=1200
   AmmoPricePerMag=50
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SharedUnlockId=SCU_ShrinkRayGun
   EffectiveRange=12
   Name="Default__KFWeapDef_ShrinkRayGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
