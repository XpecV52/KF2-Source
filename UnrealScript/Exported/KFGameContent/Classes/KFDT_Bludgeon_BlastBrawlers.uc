//=============================================================================
// KFDT_Bludgeon_BlastBrawlers
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_BlastBrawlers extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_BlastBrawlers'
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Support'
   KDamageImpulse=2500.000000
   KDeathVel=400.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Bludgeon_BlastBrawlers"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
