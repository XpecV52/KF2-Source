//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_9mmDual extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Pistol_Dual9mm"
   ImagePath="WEP_UI_Dual_9MM_TEX.UI_WeaponSelect_Dual9mm"
   BuyPrice=300
   AmmoPricePerMag=20
   EffectiveRange=50
   Name="Default__KFWeapDef_9mmDual"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
