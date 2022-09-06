//=============================================================================
// KFDT_EMP_TeslauncherEMPGrenade
//=============================================================================
// EMP damage type for EMP grenades in teslauncher weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// FFerrando @ Saber3D
//=============================================================================

class KFDT_EMP_TeslauncherEMPGrenade extends KFDT_EMP
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Berserker'
   MeleeHitPower=100.000000
   KDeathVel=50.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=1000.000000
   Name="Default__KFDT_EMP_TeslauncherEMPGrenade"
   ObjectArchetype=KFDT_EMP'KFGame.Default__KFDT_EMP'
}
