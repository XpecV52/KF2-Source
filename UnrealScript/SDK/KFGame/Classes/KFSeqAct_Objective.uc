//=============================================================================
// KFSeqAct_Objective
//=============================================================================
// A Sequenc action that starts an objective
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFSeqAct_Objective extends SequenceAction
	native;

enum EObjectiveDifficulty
{
	OD_Easy<DisplayName=EASY>,
	OD_Medium<DisplayName=MEDIUM>,
	OD_Hard<DisplayName=HARD>,
};

struct native ObjDifficultySetup
{
	var()               EObjectiveDifficulty    Difficulty;												//Difficulty
	var()				int						TimeLimit<ClampMin = 0>;								//The amount of time players have to complete the objective
	var()				float					SpawnCurveIntensity<ClampMin = 0.0 | ClampMax = 1.0>;   //An override to the games spawning curve to allow spawning intensity control during the objective gameplay
	var()				int						DoshReward<ClampMin = 0>;								//The total amount of dosh the team receives for the objective.
	var()				int						PerkReward<ClampMin = 0>;								//The amount of experience each player receives for completing the objective.
};

var()			array<ObjDifficultySetup>		ObjectiveDifficulties;

var()			class<KFObjective> 				ObjectiveClass;
var()			KFObjectiveVolume				StartVolume;

event InitObj(KFObjective SpawnedObjective)
{
	local byte ObjDifficulty;

	ObjDifficulty = Rand(ObjectiveDifficulties.Length);

	SpawnedObjective.StartVolume 			= StartVolume;
	SpawnedObjective.ObjectiveDifficulty 	= ObjectiveDifficulties[ObjDifficulty].Difficulty;
	SpawnedObjective.TimeLimit				= ObjectiveDifficulties[ObjDifficulty].TimeLimit;
	SpawnedObjective.SpawnCurveIntensity	= ObjectiveDifficulties[ObjDifficulty].SpawnCurveIntensity;
	SpawnedObjective.DoshReward				= ObjectiveDifficulties[ObjDifficulty].DoshReward;
	SpawnedObjective.PerkReward				= ObjectiveDifficulties[ObjDifficulty].PerkReward;
	SpawnedObjective.Initialize();
}

cpptext
{
	virtual void Activated();
}

defaultproperties
{
	ObjName="Enable Objective"
	ObjCategory="Objective"
	InputLinks(0)=(LinkDesc="Enable Objective")
}
