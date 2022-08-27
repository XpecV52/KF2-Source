//=============================================================================
// KFWeapDef_Seeker6
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Seeker6 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_RocketLauncher_Seeker6"
   ImagePath="WEP_UI_SeekerSix_TEX.UI_WeaponSelect_SeekerSix"
   BuyPrice=1500
   AmmoPricePerMag=40
   EffectiveRange=100
   Name="Default__KFWeapDef_Seeker6"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}