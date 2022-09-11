//=============================================================================
// KFWeapDef_Minigun
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_Minigun extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Minigun"
   ImagePath="WEP_UI_Minigun_TEX.UI_WeaponSelect_Minigun"
   BuyPrice=2000
   AmmoPricePerMag=90
   SharedUnlockId=SCU_Minigun
   EffectiveRange=68
   Name="Default__KFWeapDef_Minigun"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
