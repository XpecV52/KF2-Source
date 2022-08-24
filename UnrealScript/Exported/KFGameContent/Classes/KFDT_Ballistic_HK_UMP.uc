//=============================================================================
// KFDT_Ballistic_HK_UMP
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HK_UMP extends KFDT_Ballistic_Submachinegun
    abstract
    hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HK_UMP'
   StumblePower=16.000000
   GunHitPower=16.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_HK_UMP"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
