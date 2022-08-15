//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Deagle extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Deagle"
   ImagePath="WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle"
   BuyPrice=550
   AmmoPricePerMag=10
   EffectiveRange=50
   Name="Default__KFWeapDef_Deagle"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
