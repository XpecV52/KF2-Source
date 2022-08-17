//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_C4 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Thrown_C4"
   ImagePath="WEP_UI_C4_TEX.UI_WeaponSelect_C4"
   BuyPrice=650
   AmmoPricePerMag=100
   EffectiveRange=10
   Name="Default__KFWeapDef_C4"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}