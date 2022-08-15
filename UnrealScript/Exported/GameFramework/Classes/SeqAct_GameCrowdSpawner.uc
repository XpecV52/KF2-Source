/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*/
class SeqAct_GameCrowdSpawner extends SeqAct_GameCrowdPopulationManagerToggle
	abstract
	native;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 5;
}

defaultproperties
{
   bFillPotentialSpawnPoints=True
   bIndividualSpawner=True
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawn Points",PropertyName="PotentialSpawnPoints")
   ObjName="Game Scripted Crowd Spawner"
   Name="Default__SeqAct_GameCrowdSpawner"
   ObjectArchetype=SeqAct_GameCrowdPopulationManagerToggle'GameFramework.Default__SeqAct_GameCrowdPopulationManagerToggle'
}
