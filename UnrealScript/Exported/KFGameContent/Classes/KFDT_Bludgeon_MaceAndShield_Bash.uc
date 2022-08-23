//=============================================================================
// KFDT_Bludgeon_MaceAndShield_Bash
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_MaceAndShield_Bash extends KFDT_Bludgeon_MaceAndShield
	abstract
	hidedropdown;

defaultproperties
{
   bCanGib=True
   bCanObliterate=True
   bUseHitLocationForGibImpulses=True
   bPointImpulseTowardsOrigin=True
   EffectGroup=FXG_ShieldBash
   GoreDamageGroup=DGT_Explosive
   KnockdownPower=200.000000
   StumblePower=550.000000
   ObliterationDamageThreshold=100
   MaxObliterationGibs=12.000000
   ImpulseOriginScale=100.000000
   ImpulseOriginLift=150.000000
   KDamageImpulse=3200.000000
   KDeathVel=375.000000
   RadialDamageImpulse=8000.000000
   Name="Default__KFDT_Bludgeon_MaceAndShield_Bash"
   ObjectArchetype=KFDT_Bludgeon_MaceAndShield'kfgamecontent.Default__KFDT_Bludgeon_MaceAndShield'
}
