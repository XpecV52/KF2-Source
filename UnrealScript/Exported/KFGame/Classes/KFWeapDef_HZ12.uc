//=============================================================================
// KFWeapDef_HZ12
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_HZ12 extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_HZ12"
   ImagePath="WEP_UI_HZ12_TEX.UI_WeaponSelect_HZ12"
   BuyPrice=750
   AmmoPricePerMag=64
   EffectiveRange=20
   Name="Default__KFWeapDef_HZ12"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
