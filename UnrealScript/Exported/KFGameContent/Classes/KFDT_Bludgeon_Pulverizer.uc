//=============================================================================
// KFDT_Bludgeon_Pulverizer
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_Pulverizer extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Pulverizer'
   KnockdownPower=100.000000
   StumblePower=50.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=3000.000000
   KDeathVel=375.000000
   Name="Default__KFDT_Bludgeon_Pulverizer"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
