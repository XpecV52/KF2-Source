//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Winchester1894 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Rifle_Winchester1894"
   ImagePath="wep_ui_winchester_tex.UI_WeaponSelect_Winchester"
   BuyPrice=200
   AmmoPricePerMag=32
   EffectiveRange=70
   Name="Default__KFWeapDef_Winchester1894"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
