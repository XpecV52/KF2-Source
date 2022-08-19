//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FlameThrower extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Flame_Flamethrower"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Flamethrower"
   BuyPrice=1100
   AmmoPricePerMag=83
   EffectiveRange=17
   Name="Default__KFWeapDef_FlameThrower"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
