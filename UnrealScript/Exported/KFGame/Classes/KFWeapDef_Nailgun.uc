//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Nailgun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_Nailgun"
   AttachmentArchtypePath="WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_3P"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_NailShotgun"
   BuyPrice=600
   AmmoPricePerMag=25
   EffectiveRange=20
   Name="Default__KFWeapDef_Nailgun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}