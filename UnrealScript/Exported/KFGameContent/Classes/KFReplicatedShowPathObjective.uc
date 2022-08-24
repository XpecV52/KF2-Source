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
   PathClass=Class'kfgamecontent.KFEmit_ObjectivePath'
   Name="Default__KFReplicatedShowPathObjective"
   ObjectArchetype=KFReplicatedShowPathActor'KFGame.Default__KFReplicatedShowPathActor'
}
