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
































































































	















#linenumber 14;

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
   AARWeaponID=49
   bCanObliterate=True
   MicrowavePower=0.250000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   RadialDamageImpulse=750.000000
   Name="Default__KFDT_Microwave_Beam"
   ObjectArchetype=KFDT_Microwave'KFGameContent.Default__KFDT_Microwave'
}
