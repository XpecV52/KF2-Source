//=============================================================================
// KFDT_Microwave_Beam
//=============================================================================
// Damage caused by the microwave gun primary fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson and Andrew Ladenberger
//=============================================================================

class KFDT_Microwave_Beam extends KFDT_Microwave
	abstract;

/** Test obliterate conditions when taking damage */
static function bool CheckObliterate(Pawn P, int Damage)
{
	return default.bCanObliterate;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MicrowaveGun'
   bCanGib=True
   bCanObliterate=True
   StumblePower=30.000000
   MicrowavePower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   RadialDamageImpulse=750.000000
   Name="Default__KFDT_Microwave_Beam"
   ObjectArchetype=KFDT_Microwave'kfgamecontent.Default__KFDT_Microwave'
}
