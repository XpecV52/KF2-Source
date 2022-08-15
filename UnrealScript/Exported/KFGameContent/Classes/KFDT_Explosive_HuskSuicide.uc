//=============================================================================
// KFDT_Explosive_HuskSuicide
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_HuskSuicide extends KFDT_Explosive
	abstract
	hidedropdown;

static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
}

defaultproperties
{
   bAnyPerk=True
   bShouldSpawnPersistentBlood=True
   KDamageImpulse=1500.000000
   KDeathVel=700.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Explosive_HuskSuicide"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
