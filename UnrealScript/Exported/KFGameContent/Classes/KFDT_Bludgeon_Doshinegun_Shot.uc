//=============================================================================
// KFDT_Bludgeon_Doshinegun_Shot
//=============================================================================
// Bills hit hard
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Doshinegun_Shot extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Doshinegun'
   StunPower=40.000000
   StumblePower=120.000000
   GunHitPower=150.000000
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Bludgeon_Doshinegun_Shot"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
