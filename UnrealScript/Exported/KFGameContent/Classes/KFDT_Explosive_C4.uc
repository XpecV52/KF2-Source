//=============================================================================
// KFDT_Explosive_C4
//=============================================================================
// Explosive damage type for C4
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Explosive_C4 extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_C4'
   bShouldSpawnPersistentBlood=True
   DoT_Type=DOT_Fire
   EffectGroup=FXG_Fire
   DoT_Duration=3.000000
   DoT_Interval=1.000000
   KnockdownPower=150.000000
   StumblePower=400.000000
   BurnPower=2.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   ObliterationHealthThreshold=-400
   ObliterationDamageThreshold=400
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=2000.000000
   Name="Default__KFDT_Explosive_C4"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
