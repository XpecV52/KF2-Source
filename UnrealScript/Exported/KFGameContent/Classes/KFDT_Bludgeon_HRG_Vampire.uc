//=============================================================================
// KFDT_Bludgeon_HRG_Vampire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_HRG_Vampire extends KFDT_Bludgeon_RifleButt
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Vampire'
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Bludgeon_HRG_Vampire"
   ObjectArchetype=KFDT_Bludgeon_RifleButt'kfgamecontent.Default__KFDT_Bludgeon_RifleButt'
}
