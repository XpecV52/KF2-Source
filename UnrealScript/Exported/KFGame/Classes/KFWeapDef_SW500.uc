//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_SW500 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Revolver_SW500"
   ImagePath="WEP_UI_SW_500_TEX.UI_WeaponSelect_SW500"
   BuyPrice=750
   AmmoPricePerMag=15
   EffectiveRange=50
   Name="Default__KFWeapDef_SW500"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
