/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ActorFactory extends SeqAct_Latent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

enum EPointSelection
{
	/** Try each spawn point in a linear method */
	PS_Normal,
	/** Pick the first available randomly selected point */
	PS_Random,
	/** PS_Normal, but in reverse */
	PS_Reverse,
};

/** Is this factory enabled? */
var() bool bEnabled;

/** Is this factory currently in the process of spawning? */
var bool bIsSpawning;

/** Type of actor factory to use when creating the actor */
var() export editinline ActorFactory Factory;

/** Method of spawn point selection */
var() EPointSelection				PointSelection;

/** Set of points where Objects will be spawned */
var() array<Actor> SpawnPoints;

/** The position where Objects will be spawned, if SpawnPoints is empty */
var() array<vector> SpawnLocations;

/** The orientation of spawned Objects, if SpawnPoints is empty */
var() array<vector> SpawnOrientations;

/** Number of actors to create */
var() int							SpawnCount;

/** Delay applied after creating an actor before creating the next one */
var() float							SpawnDelay;

/** Prevent spawning at locations with bBlockActors */
var() bool							bCheckSpawnCollision;

/** Last index used to spawn at, for PS_Normal/PS_Reverse */
var int LastSpawnIdx;
/** Current index used to spawn at */
var int CurrentSpawnIdx;

/** Number of actors spawned so far */
var int	SpawnedCount;

/** Remaining time before attempting the next spawn */
var float RemainingDelay;


/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 0;
}

defaultproperties
{
   bEnabled=True
   bCheckSpawnCollision=True
   SpawnCount=1
   SpawnDelay=0.500000
   LastSpawnIdx=-1
   CurrentSpawnIdx=-1
   InputLinks(0)=(LinkDesc="Spawn Actor")
   InputLinks(1)=(LinkDesc="Enable")
   InputLinks(2)=(LinkDesc="Disable")
   InputLinks(3)=(LinkDesc="Toggle")
   VariableLinks(0)=(LinkDesc="Spawn Point",PropertyName="SpawnPoints")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Spawned",bWriteable=True,MinVars=0)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Spawn Count",PropertyName="SpawnCount")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Spawn Location",PropertyName="SpawnLocations")
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Spawn Direction",PropertyName="SpawnOrientations")
   ObjName="Actor Factory"
   ObjCategory="Actor"
   Name="Default__SeqAct_ActorFactory"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
