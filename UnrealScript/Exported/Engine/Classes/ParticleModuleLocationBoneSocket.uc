/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleLocationBoneSocket extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

enum ELocationBoneSocketSource
{
	BONESOCKETSOURCE_Bones,
	BONESOCKETSOURCE_Sockets
};

/**
 *	Whether the module uses Bones or Sockets for locations.
 *
 *	BONESOCKETSOURCE_Bones		- Use Bones as the source locations.
 *	BONESOCKETSOURCE_Sockets	- Use Sockets as the source locations.
 */
var(BoneSocket)	ELocationBoneSocketSource	SourceType;

/** An offset to apply to each bone/socket */
var(BoneSocket)	vector	UniversalOffset;

struct native LocationBoneSocketInfo
{
	/** The name of the bone/socket on the skeletal mesh */
	var()	name	BoneSocketName;
	/** The offset from the bone/socket to use */
	var()	vector	Offset;
};

/** The name(s) of the bone/socket(s) to position at */
var(BoneSocket)	array<LocationBoneSocketInfo>	SourceLocations;

enum ELocationBoneSocketSelectionMethod
{
	BONESOCKETSEL_Sequential,
	BONESOCKETSEL_Random,
	BONESOCKETSEL_RandomExhaustive
};

/**
 *	The method by which to select the bone/socket to spawn at.
 *
 *	SEL_Sequential			- loop through the bone/socket array in order
 *	SEL_Random				- randomly select a bone/socket from the array
 *	SEL_RandomExhaustive	- randomly select a bone/socket, but never the same one twice until all have been used, then reset
 */
var(BoneSocket)	ELocationBoneSocketSelectionMethod	SelectionMethod;

/** If TRUE, update the particle locations each frame with that of the bone/socket */
var(BoneSocket)	bool	bUpdatePositionEachFrame;

/** If TRUE, rotate mesh emitter meshes to orient w/ the socket */
var(BoneSocket)	bool	bOrientMeshEmitters;

/**
 *	The parameter name of the skeletal mesh actor that supplies the SkelMeshComponent for in-game.
 */
var(BoneSocket)	name	SkelMeshActorParamName;

/** The name of the skeletal mesh to use in the editor */
var(BoneSocket)	editoronly	SkeletalMesh	EditorSkelMesh;

/** If TRUE, the spawned particle will have the velocity of the bone or socket at the spawn time. */
var(BoneSocket) bool	bInheritVelocityAtSpawn;

/** Store off the last update time so we can get a delta in spawn. */
var				float	LastUpdateTime;

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

defaultproperties
{
   SourceType=BONESOCKETSOURCE_Sockets
   bOrientMeshEmitters=True
   SkelMeshActorParamName="BoneSocketActor"
   bSpawnModule=True
   bUpdateModule=True
   bFinalUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleLocationBoneSocket"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
