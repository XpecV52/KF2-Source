//=============================================================================
// KFDT_Explosive_Sacrifice
//=============================================================================
// Explosive damage type used for Demolitionist Sacrifice skill
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// by Jeff Robinson
//=============================================================================

class KFDT_Explosive_Sacrifice extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bAnyPerk=True
   bShouldSpawnPersistentBlood=True
   StunPower=21.000000
   KnockdownPower=20.000000
   StumblePower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_Sacrifice"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
