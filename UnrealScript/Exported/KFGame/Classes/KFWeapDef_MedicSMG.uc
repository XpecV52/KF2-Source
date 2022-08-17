//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MedicSMG extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_Medic"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicSMG"
   BuyPrice=650
   AmmoPricePerMag=15
   EffectiveRange=70
   Name="Default__KFWeapDef_MedicSMG"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}