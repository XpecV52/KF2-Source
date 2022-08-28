//=============================================================================
// KFReplicatedShowPathObjective
//=============================================================================
// Small override to show a trail to a map objective.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFReplicatedShowPathObjective extends KFReplicatedShowPathActor;

var EObjectiveType CurrentObjectiveType;

replication
{
	if (bNetDirty)
	CurrentObjectiveType;
}

simulated function SetObjeciveType(EObjectiveType ObjEnum)
{
	CurrentObjectiveType = ObjEnum;
	bNetDirty = true;
}

simulated function class<KFEmit_Path> GetPathClass()
{
	switch (CurrentObjectiveType)
	{		
	case EObj_Weld:
		return class'KFGameContent.KFEmit_ObjectivePath_Weld';
	case EObj_Trigger:
		return class'KFGameContent.KFEmit_ObjectivePath_ActivateTrigger';
	case EObj_SYG:
		return PathClass;
	default:
		return PathClass; 
	}
	
}


defaultproperties
{
	PathClass=class'KFGameContent.KFEmit_ObjectivePath'
}