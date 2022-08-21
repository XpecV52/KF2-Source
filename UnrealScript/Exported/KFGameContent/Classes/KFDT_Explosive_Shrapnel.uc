//=============================================================================
// KFDT_Explosive_Shrapnel
//=============================================================================
// Explosive damage with similar values to frag grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_Shrapnel extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bShouldSpawnPersistentBlood=True
   KnockdownPower=500.000000
   StumblePower=500.000000
   MeleeHitPower=500.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   KDeathVel=200.000000
   KDeathUpKick=900.000000
   RadialDamageImpulse=500.000000
   Name="Default__KFDT_Explosive_Shrapnel"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
