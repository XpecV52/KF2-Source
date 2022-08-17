//=============================================================================
// KFDT_Bludgeon_ZedJump
//=============================================================================
// Bludgeon damage for jump attacks
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Bludgeon_ZedJump extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   bExtraMomentumZ=True
   KDamageImpulse=1000.000000
   KDeathVel=950.000000
   KDeathUpKick=300.000000
   Name="Default__KFDT_Bludgeon_ZedJump"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
