//=============================================================================
// KFDT_Bludgeon_PowerGlovesHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_PowerGlovesHeavy extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_PowerGloves'
   KnockdownPower=90.000000
   StumblePower=150.000000
   MeleeHitPower=100.000000
   EMPPower=45.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   OverrideImpactEffect=ParticleSystem'WEP_Static_Strikers_EMIT.FX_Static_Strikers_Impact'
   KDamageImpulse=3500.000000
   KDeathVel=575.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Bludgeon_PowerGlovesHeavy"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
