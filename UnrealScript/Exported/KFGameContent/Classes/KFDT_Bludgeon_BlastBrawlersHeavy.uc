//=============================================================================
// KFDT_Bludgeon_BlastBrawlersHeavy
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_BlastBrawlersHeavy extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_BlastBrawlers'
   KnockdownPower=75.000000
   StumblePower=150.000000
   MeleeHitPower=150.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Support'
   KDamageImpulse=3500.000000
   KDeathVel=575.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Bludgeon_BlastBrawlersHeavy"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
