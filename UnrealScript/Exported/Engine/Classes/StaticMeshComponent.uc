/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshComponent extends MeshComponent
	native(Mesh)
	noexport
	hidecategories(Object)
	dependson(LightmassPrimitiveSettingsObject)
	editinlinenew;


/** If 0, auto-select LOD level. if >0, force to (ForcedLodModel-1). */
var() int		ForcedLodModel;
var int			PreviousLODLevel; // Previous LOD level

var() const StaticMesh StaticMesh;
var() Color WireframeColor;

/**
 *	Ignore this instance of this static mesh when calculating streaming information.
 *	This can be useful when doing things like applying character textures to static geometry,
 *	to avoid them using distance-based streaming.
 */
var()	bool	bIgnoreInstanceForTextureStreaming;

/** Deprecated. Replaced by 'bOverrideLightMapRes'. */
var deprecated const bool bOverrideLightMapResolution;


/** Auto-generated lightmap resolution based on mesh bounds */
var() const editconst int LightMapRes;


/** Whether to override the lightmap resolution defined in the static mesh. */
var() const bool bOverrideLightMapRes;

/** Deprecated. Replaced by 'OverriddenLightMapRes'. */
var deprecated const int OverriddenLightMapResolution;

/** Light map resolution used if bOverrideLightMapRes is TRUE */
var() const int	 OverriddenLightMapRes;


/** Auto-generated splattermap resolution based on mesh bounds */
var(PersistentSplats) const editconst int	 SplatterMapRes;
/** Whether to override the auto-generated splattermap resolution */
var(PersistentSplats) const bool bOverrideSplatterMapRes;
/** Light map resolution used if bOverrideSplatterMapRes is TRUE */
var(PersistentSplats) const int	 OverriddenSplatterMapRes;


/** With the default value of 0, the LODMaxRange from the UStaticMesh will be used to control LOD transitions, otherwise this value overrides. */
var() float OverriddenLODMaxRange;

/**
 * Allows adjusting the desired streaming distance of streaming textures that uses UV 0.
 * 1.0 is the default, whereas a higher value makes the textures stream in sooner from far away.
 * A lower value (0.0-1.0) makes the textures stream in later (you have to be closer).
 */
var()	float	StreamingDistanceMultiplier;

/** Subdivision step size for static vertex lighting.				*/
var const int	SubDivisionStepSize;
/** Whether to use subdivisions or just the triangle's vertices.	*/
var const bool bUseSubDivisions;
/** if True then decals will always use the fast path and will be treated as static wrt this mesh */
var const transient bool bForceStaticDecals;
/** Whether or not we can highlight selected sections - this should really only be done in the editor */
var transient bool bCanHighlightSelectedSections;

/** Whether or not to use the optional simple lightmap modification texture */
var(MobileSettings) bool bUseSimpleLightmapModifications;

enum ELightmapModificationFunction
{
	/** Lightmap.RGB * Modification.RGB */
	MLMF_Modulate,
	/** Lightmap.RGB * (Modification.RGB * Modification.A) */
	MLMF_ModulateAlpha,
};

/** The texture to use when modifying the simple lightmap texture */
var(MobileSettings) editoronly texture SimpleLightmapModificationTexture <EditCondition=bUseSimpleLightmapModifications>;

/** The function to use when modifying the simple lightmap texture */
var(MobileSettings) ELightmapModificationFunction SimpleLightmapModificationFunction <EditCondition=bUseSimpleLightmapModifications>;

/** Never become dynamic, even if my mesh has bCanBecomeDynamic=true */
var(Physics) bool bNeverBecomeDynamic;


/** (Advanded) Overrides StaticMesh's 'IgnoreForVisibilityCollision' flag and respects RBCollideWithChannels. */
var(Collision) const bool bOverrideVisibilityCollision<DisplayName=ForceVisibilityCollision>;


var const array<Guid>	IrrelevantLights;

/** Cached vertex information at the time the mesh was painted. */
struct PaintedVertex
{
	var vector Position;
	var packednormal Normal;
	var color Color;
};

struct StaticMeshComponentLODInfo
{
	var private const array<ShadowMap2D> ShadowMaps;
	var private const array<Object> ShadowVertexBuffers;
	var native private const pointer LightMap{FLightMap};

	/** Vertex colors to use for this mesh LOD */
	var private native const pointer OverrideVertexColors{FColorVertexBuffer_Mirror};

	/** Vertex data cached at the time this LOD was painted, if any */
	var private const array<PaintedVertex> PaintedVertices;


	/** Splatter map data to use for this mesh LOD */
	var private const TWSplatterMap2D SplatterMap;

};

/** Static mesh LOD data.  Contains static lighting data along with instanced mesh vertex colors. */
var native serializetext private const array<StaticMeshComponentLODInfo> LODData;

/** Incremented any time the position of vertices from the source mesh change, used to determine if an update from the source static mesh is required */
var private const int VertexPositionVersionNumber;

/** The Lightmass settings for this object. */
var(Lightmass) LightmassPrimitiveSettings	LightmassSettings <ScriptOrder=true>;

/** Change the StaticMesh used by this instance. */
simulated native function bool SetStaticMesh( StaticMesh NewMesh, optional bool bForce );

/** Disables physics collision between a specific pair of primitive components. */
simulated native function DisableRBCollisionWithSMC( PrimitiveComponent OtherSMC, bool bDisabled );

/**
 * Changes the value of bForceStaticDecals.
 * @param bInForceStaticDecals - The value to assign to bForceStaticDecals.
 */
native final function SetForceStaticDecals(bool bInForceStaticDecals);

/**
 * @RETURNS true if this mesh can become dynamic
 */
native function bool CanBecomeDynamic();

defaultproperties
{
   WireframeColor=(B=255,G=255,R=0,A=255)
   OverriddenLightMapRes=64
   StreamingDistanceMultiplier=1.000000
   SubDivisionStepSize=32
   bUseSubDivisions=True
   LightmassSettings=(EmissiveLightFalloffExponent=2.000000,EmissiveBoost=1.000000,DiffuseBoost=1.000000,SpecularBoost=1.000000,FullyOccludedSamplesFraction=1.000000)
   ReplacementPrimitive=None
   bAcceptsStaticDecals=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
   bAllowPreshadows=False
   bAllowPersistentSplatters=True
   TickGroup=TG_PreAsyncWork
   Name="Default__StaticMeshComponent"
   ObjectArchetype=MeshComponent'Engine.Default__MeshComponent'
}
