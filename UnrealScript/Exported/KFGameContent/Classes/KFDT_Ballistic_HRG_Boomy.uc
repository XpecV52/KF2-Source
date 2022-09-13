//=============================================================================
// KFDT_Ballistic_HRG_Boomy
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Boomy extends KFDT_Ballistic_Submachinegun
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Boomy'
   StumblePower=35.000000
   GunHitPower=25.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=900.000000
   KDeathVel=100.000000
   KDeathUpKick=-300.000000
   Name="Default__KFDT_Ballistic_HRG_Boomy"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
