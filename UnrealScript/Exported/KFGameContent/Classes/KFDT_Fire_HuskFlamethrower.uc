//=============================================================================
// KFDT_Fire_HuskFlamethrower
//=============================================================================
// A damage type for the husk flame SprayActor
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Fire_HuskFlamethrower extends KFDT_Fire
	abstract; // no hidedropdown, for archetype

defaultproperties
{
   DoT_DamageScale=0.500000
   KDamageImpulse=400.000000
   KDeathVel=75.000000
   KDeathUpKick=50.000000
   Name="Default__KFDT_Fire_HuskFlamethrower"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
