/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleLocationStaticVertSurface extends ParticleModuleLocationBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

enum ELocationStaticVertSurfaceSource
{
	VERTSTATICSURFACESOURCE_Vert,
	VERTSTATICSURFACESOURCE_Surface
};

/**
 *	Whether the module uses Verts or Surfaces for locations.
 *
 *	VERTSURFACESOURCE_Vert		- Use Verts as the source locations.
 *	VERTSURFACESOURCE_Surface	- Use Surfaces as the source locations.
 */
var(VertSurface)	ELocationStaticVertSurfaceSource	SourceType;

/** An offset to apply to each vert/surface */
var(VertSurface)	vector	UniversalOffset;

/** If TRUE, update the particle locations each frame with that of the vert/surface */
var(VertSurface)	bool	bUpdatePositionEachFrame;

/** If TRUE, rotate mesh emitter meshes to orient w/ the vert/surface */
var(VertSurface)	bool	bOrientMeshEmitters;

/**
 *	The parameter name of the static mesh actor that supplies the StaticMeshComponent for in-game.
 */
var(VertSurface)	name	StaticMeshActorParamName;

/** The name of the static mesh to use in the editor */
var(VertSurface)	editoronly	StaticMesh	EditorStaticMesh;

/** When TRUE use the RestrictToNormal and NormalTolerance values to check surface normals */
var(VertSurface)	bool	bEnforceNormalCheck;

/** Use this normal to restrict spawning locations */
var(VertSurface)	vector	NormalToCompare;

/** Normal tolerance.  0 degrees means it must be an exact match, 180 degrees means it can be any angle. */
var(VertSurface)	float			NormalCheckToleranceDegrees;

/** Normal tolerance.  Value between 1.0 and -1.0 with 1.0 being exact match, 0.0 being everything up to
    perpendicular and -1.0 being any direction or don't restrict at all. */
var					float	NormalCheckTolerance;

/**
 *	Array of material indices that are valid materials to spawn from.
 *	If empty, any material will be considered valid
 */
var(VertSurface)	array<int>	ValidMaterialIndices;

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
   bOrientMeshEmitters=True
   StaticMeshActorParamName="VertSurfaceActor"
   bSpawnModule=True
   bUpdateModule=True
   bFinalUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleLocationStaticVertSurface"
   ObjectArchetype=ParticleModuleLocationBase'Engine.Default__ParticleModuleLocationBase'
}
