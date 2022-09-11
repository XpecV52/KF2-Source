//=============================================================================
// KFDT_Slashing_FireAxeHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_FireAxeHeavy extends KFDT_Slashing_FireAxe
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
	if (super.CanDismemberHitZone(InHitZoneName))
	{
		return true;
	}

	switch (InHitZoneName)
	{
	case 'lupperarm':
	case 'rupperarm':
		return true;
	}

	return false;
}

defaultproperties
{
   StunPower=100.000000
   StumblePower=75.000000
   MeleeHitPower=100.000000
   KDamageImpulse=2500.000000
   KDeathVel=700.000000
   KDeathUpKick=700.000000
   Name="Default__KFDT_Slashing_FireAxeHeavy"
   ObjectArchetype=KFDT_Slashing_FireAxe'kfgamecontent.Default__KFDT_Slashing_FireAxe'
}
