//=============================================================================
// KFDT_Bludgeon_MaceAndShield_ShieldLight
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_MaceAndShield_ShieldLight extends KFDT_Bludgeon_MaceAndShield
	abstract
	hidedropdown;

defaultproperties
{
   bCanGib=True
   bCanObliterate=True
   bUseHitLocationForGibImpulses=True
   EffectGroup=FXG_ShieldBash
   GoreDamageGroup=DGT_Explosive
   KnockdownPower=100.000000
   StumblePower=400.000000
   ObliterationHealthThreshold=-30
   ObliterationDamageThreshold=50
   MaxObliterationGibs=12.000000
   KDamageImpulse=3500.000000
   KDeathVel=375.000000
   RadialDamageImpulse=6000.000000
   Name="Default__KFDT_Bludgeon_MaceAndShield_ShieldLight"
   ObjectArchetype=KFDT_Bludgeon_MaceAndShield'kfgamecontent.Default__KFDT_Bludgeon_MaceAndShield'
}
