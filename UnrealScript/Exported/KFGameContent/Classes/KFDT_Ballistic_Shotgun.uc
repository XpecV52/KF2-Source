//=============================================================================
// KFDT_Ballistic_Shotgun
//=============================================================================
// Container class for shotgun damage types
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 11/22/2013
//=============================================================================

class KFDT_Ballistic_Shotgun extends KFDT_Ballistic
	abstract
	hidedropdown;

defaultproperties
{
   HeadDestructionDamageScale=7.000000
   HeadDestructionImpulseForceScale=7.000000
   GoreDamageGroup=DGT_Shotgun
   ModifierPerkList(0)=Class'KFGame.KFPerk_Support'
   Name="Default__KFDT_Ballistic_Shotgun"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
