//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_M79 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_GrenadeLauncher_M79"
   ImagePath="WEP_UI_M79_TEX.UI_WeaponSelect_M79"
   BuyPrice=650
   AmmoPricePerMag=13
   EffectiveRange=100
   Name="Default__KFWeapDef_M79"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
