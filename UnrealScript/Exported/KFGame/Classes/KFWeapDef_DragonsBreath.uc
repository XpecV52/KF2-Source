//=============================================================================
// KFWeaponDefintion
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients). 
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapDef_DragonsBreath extends KFWeaponDefinition
	abstract;

defaultproperties
{
   WeaponClassPath="KFGameContent.KFWeap_Shotgun_DragonsBreath"
   ImagePath="WEP_UI_DragonsBreath.UI_WeaponSelect_DragonsBreath"
   BuyPrice=650
   AmmoPricePerMag=30
   EffectiveRange=25
   Name="Default__KFWeapDef_DragonsBreath"
   ObjectArchetype=KFWeaponDefinition'KFGame.Default__KFWeaponDefinition'
}
