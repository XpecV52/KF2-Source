//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Grenade_Sharpshooter extends KFWeaponDefinition
	abstract
	hidedropdown;

DefaultProperties
{
	WeaponClassPath="KFGameContent.KFProj_FreezeGrenade"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Grenade"
}
