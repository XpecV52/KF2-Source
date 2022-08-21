//=============================================================================
// KFDT_Explosive_CrawlerSuicide
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Explosive_CrawlerSuicide extends KFDT_Explosive
	abstract
	hidedropdown;

static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	return true;
}

defaultproperties
{
   bConsideredIndirectOrAoE=True
   bAnyPerk=True
   bShouldSpawnPersistentBlood=True
   KDamageImpulse=1500.000000
   KDeathVel=700.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Explosive_CrawlerSuicide"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
