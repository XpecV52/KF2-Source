//=============================================================================
// KFWeapDef_ThermiteBore
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFWeapDef_ThermiteBore extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_RocketLauncher_ThermiteBore"
   ImagePath="WEP_UI_Thermite_TEX.UI_WeaponSelect_Thermite"
   BuyPrice=1500
   AmmoPricePerMag=78
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SharedUnlockId=SCU_Thermite
   EffectiveRange=78
   Name="Default__KFWeapDef_ThermiteBore"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
