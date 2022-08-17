//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DeagleDual extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_DualDeagle"
   ImagePath="WEP_UI_Dual_Deagle_TEX.UI_WeaponSelect_DualDeagle"
   BuyPrice=1100
   AmmoPricePerMag=20
   EffectiveRange=50
   Name="Default__KFWeapDef_DeagleDual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}