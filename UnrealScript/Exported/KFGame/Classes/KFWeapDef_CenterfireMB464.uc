//=============================================================================
// KFWeapDef_CenterfireMB464
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_CenterfireMB464 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Rifle_CenterfireMB464"
   ImagePath="WEP_UI_Centerfire_TEX.UI_WeaponSelect_Centerfire"
   BuyPrice=650
   AmmoPricePerMag=50
   EffectiveRange=70
   Name="Default__KFWeapDef_CenterfireMB464"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
