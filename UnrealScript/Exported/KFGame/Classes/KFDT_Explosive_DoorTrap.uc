//=============================================================================
// KFDT_Explosive_DoorTrap
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// by Jeff Robinson
//=============================================================================

class KFDT_Explosive_DoorTrap extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   bShouldSpawnPersistentBlood=True
   KnockdownPower=300.000000
   StumblePower=500.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_DoorTrap"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
