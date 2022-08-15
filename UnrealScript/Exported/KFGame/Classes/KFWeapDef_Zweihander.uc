//=============================================================================
// KFWeapDef_Crovel
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Zweihander extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Edged_Zweihander"
   ImagePath="WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander"
   BuyPrice=1000
   SharedUnlockId=SCU_Zweihander
   EffectiveRange=3
   Name="Default__KFWeapDef_Zweihander"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
