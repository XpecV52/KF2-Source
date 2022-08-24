//=============================================================================
// KFDT_Freeze_Ground
//=============================================================================
// A damage type for KFProj_GroundIce
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Freeze_Ground extends KFDT_Freeze
	abstract
	hidedropdown;

defaultproperties
{
   DoT_DamageScale=0.500000
   FreezePower=6.250000
   SnarePower=20.000000
   Name="Default__KFDT_Freeze_Ground"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
