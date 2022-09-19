//=============================================================================
// KFDT_Ballistic_AutoTurret
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_AutoTurret extends KFDT_Ballistic_AssaultRifle
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_AutoTurret'
   StumblePower=5.000000
   GunHitPower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Commando'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_AutoTurret"
   ObjectArchetype=KFDT_Ballistic_AssaultRifle'kfgamecontent.Default__KFDT_Ballistic_AssaultRifle'
}
