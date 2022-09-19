//=============================================================================
// KFDT_Poison_HRG_CranialPopper
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Poison_HRG_CranialPopper extends KFDT_Toxic
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_CranialPopper'
   bStackDoT=True
   DoT_Type=DOT_None
   DoT_Duration=5.000000
   Name="Default__KFDT_Poison_HRG_CranialPopper"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
