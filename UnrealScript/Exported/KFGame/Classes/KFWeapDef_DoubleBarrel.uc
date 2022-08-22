//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DoubleBarrel extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_DoubleBarrel"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_DBShotgun"
   BuyPrice=650
   AmmoPricePerMag=11
   EffectiveRange=15
   Name="Default__KFWeapDef_DoubleBarrel"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
