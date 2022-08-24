//=============================================================================
// KFWeapDef_FreezeThrower
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_FreezeThrower extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Ice_FreezeThrower"
   ImagePath="wep_ui_cryogun_tex.UI_WeaponSelect_Cryogun"
   BuyPrice=1100
   AmmoPricePerMag=45
   EffectiveRange=17
   Name="Default__KFWeapDef_FreezeThrower"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
