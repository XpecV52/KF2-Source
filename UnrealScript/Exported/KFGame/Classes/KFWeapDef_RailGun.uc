//=============================================================================
// KFWeapDef_RailGun
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_RailGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Rifle_RailGun"
   ImagePath="WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun"
   BuyPrice=1500
   AmmoPricePerMag=25
   EffectiveRange=100
   Name="Default__KFWeapDef_RailGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}