//=============================================================================
// KFDT_Explosive_RPG7BackBlast
//=============================================================================
// Explosive back blast damage type for the RPG rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Explosive_RPG7BackBlast extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_RPG7'
   bShouldSpawnPersistentBlood=True
   KnockdownPower=300.000000
   StumblePower=500.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_RPG7BackBlast"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
