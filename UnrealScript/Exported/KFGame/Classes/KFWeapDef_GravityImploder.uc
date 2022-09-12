//=============================================================================
// KFWeapDef_GravityImploder
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//=============================================================================

class KFWeapDef_GravityImploder extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_GravityImploder"
   ImagePath="WEP_UI_Gravity_Imploder_TEX.UI_WeaponSelect_Gravity_Imploder"
   BuyPrice=2000
   AmmoPricePerMag=70
   SharedUnlockId=SCU_GravityImploder
   EffectiveRange=95
   Name="Default__KFWeapDef_GravityImploder"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
