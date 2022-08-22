//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MP7 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_MP7"
   ImagePath="WEP_UI_MP7_TEX.UI_WeaponSelect_MP7"
   BuyPrice=200
   AmmoPricePerMag=16
   EffectiveRange=70
   Name="Default__KFWeapDef_MP7"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
