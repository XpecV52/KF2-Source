//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M4 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_M4"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Benelli"
   BuyPrice=1100
   AmmoPricePerMag=40
   EffectiveRange=35
   Name="Default__KFWeapDef_M4"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}