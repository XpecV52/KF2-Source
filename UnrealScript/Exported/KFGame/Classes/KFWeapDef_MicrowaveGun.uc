//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_MicrowaveGun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Beam_Microwave"
   ImagePath="WEP_UI_Microwave_Gun_TEX.UI_WeaponSelect_MicrowaveGun"
   BuyPrice=1500
   AmmoPricePerMag=100
   EffectiveRange=12
   Name="Default__KFWeapDef_MicrowaveGun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
