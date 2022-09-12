//=============================================================================
// KFDT_Freeze_Ground_FreezeThrower
//=============================================================================
// A damage type for KFProj_FreezeThrower_IceShards
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Freeze_FreezeThrower_IceShards extends KFDT_Ballistic_Shotgun
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FreezeThrower'
   StumblePower=25.000000
   KDamageImpulse=500.000000
   KDeathVel=350.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Freeze_FreezeThrower_IceShards"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
