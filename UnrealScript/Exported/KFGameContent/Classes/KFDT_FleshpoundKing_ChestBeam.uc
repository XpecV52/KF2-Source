//=============================================================================
// KFDT_FleshpoundKing_ChestBeam
//=============================================================================
// Damagetype for the Fleshpound King's chest beam attack
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_FleshpoundKing_ChestBeam extends KFDT_EMP
	abstract
	hidedropdown;

defaultproperties
{
   KnockdownPower=50.000000
   MeleeHitPower=50.000000
   EMPPower=50.000000
   bArmorStops=True
   KDeathVel=300.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_FleshpoundKing_ChestBeam"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
