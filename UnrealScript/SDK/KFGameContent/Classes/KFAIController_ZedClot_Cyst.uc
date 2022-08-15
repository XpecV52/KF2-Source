//=============================================================================
// KFAIController_ZedClot_Cyst
//=============================================================================
// Cyst clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAIController_ZedClot_Cyst extends KFAIController_ZedClot;

DefaultProperties
{
	// The dumbest clot has poor vision (frequency of SeePlayer evaluations)
	SightCounterInterval=0.5f
	// AI / Navigation
	SprintWithinEnemyRange=(X=600.f,Y=1200.f)
	EvadeGrenadeChance=0.5f
}

