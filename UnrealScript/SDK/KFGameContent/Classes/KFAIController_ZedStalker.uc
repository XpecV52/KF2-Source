//=============================================================================
// KFAIController_ZedStalker
//=============================================================================
// Stalker Controller class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFAIController_ZedStalker extends KFAIController_Monster;

DefaultProperties
{
	SightCounterInterval=0.5f
	// AI / Navigation
	SprintWithinEnemyRange=(X=600.f,Y=1200.f)
	EvadeGrenadeChance=0.9f

	TeleportCooldown=5.0
	HiddenRelocateTeleportThreshold=5.0
	AIRemainingTeleportThreshold=0
}
