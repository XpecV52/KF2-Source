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

`include(KFGame\KFMatchStats.uci);

/** Test obliterate conditions when taking damage */
static function bool CheckObliterate(Pawn P, int Damage)
{
	local KFPawn_Monster MP;

	if ( default.bCanObliterate )
	{
		MP = KFPawn_Monster(P);
		if ( MP != None )
		{
			return (MP.RepInflateMatParam > 1);
		}
	}

	return false;
}

defaultproperties
{
	WeaponDef=class'KFWeapDef_MicrowaveGun'

	// physics impact
	RadialDamageImpulse=750
	KDeathUpKick=750
	KDeathVel=350
    KDamageImpulse=2000

	MicrowavePower=0.25

	EffectGroup=255 //None
	bCanObliterate=true
	ModifierPerkList(0)=class'KFPerk_Firebug'
}

