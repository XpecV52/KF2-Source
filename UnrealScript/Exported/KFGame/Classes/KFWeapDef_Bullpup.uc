//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Bullpup extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_AssaultRifle_Bullpup"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Bullpup"
   BuyPrice=650
   AmmoPricePerMag=24
   EffectiveRange=68
   Name="Default__KFWeapDef_Bullpup"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
