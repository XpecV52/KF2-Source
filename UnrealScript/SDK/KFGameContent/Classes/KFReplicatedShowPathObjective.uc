//=============================================================================
// KFReplicatedShowPathObjective
//=============================================================================
// Small override to show a trail to a map objective.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFReplicatedShowPathObjective extends KFReplicatedShowPathActor;

defaultproperties
{
	PathClass=class'KFGameContent.KFEmit_ObjectivePath'
}