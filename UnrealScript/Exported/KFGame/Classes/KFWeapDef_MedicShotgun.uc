//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MedicShotgun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_Medic"
   ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicShotgun"
   BuyPrice=1100
   AmmoPricePerMag=30
   EffectiveRange=50
   Name="Default__KFWeapDef_MedicShotgun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
