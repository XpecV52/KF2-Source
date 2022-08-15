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
































































































	















#linenumber 15;

defaultproperties
{
   StunPower=54
   KnockdownPower=50
   StumblePower=0
   bShouldSpawnPersistentBlood=True
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_Sacrifice"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
