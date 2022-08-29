//=============================================================================
// KFWeapDef_AbominationAxe
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_AbominationAxe extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Edged_AbominationAxe"
   ImagePath="WEP_UI_KrampusAxe_TEX.UI_WeaponSelect_KrampusAxe"
   BuyPrice=2000
   SharedUnlockId=SCU_AbominationAxe
   EffectiveRange=5
   Name="Default__KFWeapDef_AbominationAxe"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
