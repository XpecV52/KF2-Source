//=============================================================================
// KFDT_Ballistic_Submachinegun
//=============================================================================
// Container class for submachinegun damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 11/22/2013
//=============================================================================

class KFDT_Ballistic_Submachinegun extends KFDT_Ballistic
	abstract
	hidedropdown;

defaultproperties
{
   GoreDamageGroup=DGT_Submachinegun
   Name="Default__KFDT_Ballistic_Submachinegun"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
