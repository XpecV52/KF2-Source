//=============================================================================
// KFDT_Explosive_M79
//=============================================================================
// Explosive damage type for the M79 Grenade launcher grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_M79 extends KFDT_Explosive
	abstract
	hidedropdown;
































































































	















#linenumber 15;

defaultproperties
{
   AARWeaponID=17
   KnockdownPower=45
   StumblePower=42
   LegStumblePower=42
   bShouldSpawnPersistentBlood=True
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_M79"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
