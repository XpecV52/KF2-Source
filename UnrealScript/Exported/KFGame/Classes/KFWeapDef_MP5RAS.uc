//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MP5RAS extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_SMG_MP5RAS"
   ImagePath="WEP_UI_MP5RAS_TEX.UI_WeaponSelect_MP5RAS"
   BuyPrice=650
   AmmoPricePerMag=22
   EffectiveRange=70
   Name="Default__KFWeapDef_MP5RAS"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}