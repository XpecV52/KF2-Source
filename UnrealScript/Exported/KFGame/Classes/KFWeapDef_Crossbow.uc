//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Crossbow extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Bow_Crossbow"
   ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"
   BuyPrice=650
   AmmoPricePerMag=10
   EffectiveRange=80
   Name="Default__KFWeapDef_Crossbow"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
