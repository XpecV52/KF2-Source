//=============================================================================
// KFDT_Explosive_DynamiteGrenade
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// by Jeff Robinson
//=============================================================================

class KFDT_Explosive_DynamiteGrenade extends KFDT_Explosive
	abstract
	hidedropdown;






































	















#linenumber 15;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Demo'
   bShouldSpawnPersistentBlood=True
   StunPower=54
   KnockdownPower=50
   StumblePower=0
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_DynamiteGrenade"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
