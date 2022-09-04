//=============================================================================
// KFWeapDef_Nailgun_HRG
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Nailgun_HRG extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_HRG_Nailgun"
   AttachmentArchtypePath="WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_3P"
   ImagePath="WEP_UI_HRG_Nailgun_PDW_TEX.UI_WeaponSelect_HRG_Nailgun_PDW"
   BuyPrice=1100
   AmmoPricePerMag=45
   UpgradePrice(0)=700
   UpgradePrice(1)=1500
   UpgradeSellPrice(0)=525
   UpgradeSellPrice(1)=1650
   EffectiveRange=55
   Name="Default__KFWeapDef_Nailgun_HRG"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
