//=============================================================================
// KFWeapDef_Blunderbuss
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFWeapDef_Blunderbuss extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Blunderbuss"
   ImagePath="WEP_UI_Blunderbuss_TEX.UI_WeaponSelect_BlunderBluss"
   BuyPrice=1500
   AmmoPricePerMag=39
   UpgradePrice(0)=1500
   UpgradeSellPrice(0)=1125
   SharedUnlockId=SCU_Blunderbuss
   EffectiveRange=95
   Name="Default__KFWeapDef_Blunderbuss"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
