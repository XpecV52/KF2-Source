//=============================================================================
// KFWeapDef_Grenade_SWAT
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================
class KFWeapDef_Grenade_SWAT extends KFWeaponDefinition
	abstract
	hidedropdown;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFProj_FlashBangGrenade"
   ImagePath="WEP_UI_M84_TEX.UI_WeaponSelect_M84Grenade"
   Name="Default__KFWeapDef_Grenade_SWAT"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
