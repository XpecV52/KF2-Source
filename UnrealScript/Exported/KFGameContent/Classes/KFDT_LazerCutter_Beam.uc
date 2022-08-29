//=============================================================================
// KFDT_LazerCutter_Beam
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFDT_LazerCutter_Beam extends KFDT_Microwave
	abstract
	hidedropdown;

/** Test obliterate conditions when taking damage */
static function bool CheckObliterate(Pawn P, int Damage)
{
	return default.bCanObliterate;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_LazerCutter'
   bCanGib=True
   bCanObliterate=True
   GunHitPower=150.000000
   EMPPower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDamageImpulse=2000.000000
   KDeathVel=350.000000
   KDeathUpKick=750.000000
   RadialDamageImpulse=750.000000
   Name="Default__KFDT_LazerCutter_Beam"
   ObjectArchetype=KFDT_Microwave'KFGame.Default__KFDT_Microwave'
}
