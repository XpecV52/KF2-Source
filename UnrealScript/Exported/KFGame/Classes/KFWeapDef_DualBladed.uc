//=============================================================================
// KFWeapDef_DualBladed
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DualBladed extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_DualBladed"
   ImagePath="WEP_UI_Dual_BladedPistol_TEX.UI_WeaponSelect_Dual_BladedPistol"
   BuyPrice=1200
   AmmoPricePerMag=76
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   SharedUnlockId=SCU_BladedPistol
   EffectiveRange=50
   Name="Default__KFWeapDef_DualBladed"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
