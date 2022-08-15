/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class DecalComponent extends PrimitiveComponent
	native(Decal)
	editinlinenew
	hidecategories(Collision,Object,Physics,PrimitiveComponent);

/** Decal material. */
var(Decal) private{private} const MaterialInterface	DecalMaterial;

/** Decal world space width. */
var(Decal) float Width;

/** Decal world space height. */
var(Decal) float Height;

/** Decal tiling along the tangent. */
var(Decal) float TileX;

/** Decal tiling along the binormal. */
var(Decal) float TileY;

/** Decal offset along the tangent. */
var(Decal) float OffsetX;

/** Decal offset along the binormal. */
var(Decal) float OffsetY;

/** Decal in-plane rotation, in degrees. */
var(Decal) float DecalRotation;

/** Horizontal field of view. */
var float FieldOfView;

/** Near plane clip distance. */
var(Decal) float NearPlane;

/** Far plane clip distance. */
var(Decal) float FarPlane;

/** Decal's frustum location, set in code or copied from DecalActor in UnrealEd. */
var transient vector Location;

/** Decal's frustum orientation, set in code or copied from DecalActor in UnrealEd. */
var transient rotator Orientation;

/** Decal's impact location, as computed by eg weapon trace. */
var vector		HitLocation;

/** Decal's impact normal, as computed by eg weapon trace.*/
var vector		HitNormal;

/** Decal's impact tangent, as computed by eg weapon trace.*/
var vector		HitTangent;

/** Decal's impact binormal, as computed by eg weapon trace.*/
var vector		HitBinormal;

/**
 * If FALSE (the default), use precise clipping to compute the decal geometry.
 * If TRUE, decal geometry generation is faster, but the decal material will have
 * to use clamped texture coordinates.
 */
var(Decal) bool bNoClip;

/**
 * TRUE for decals created in the editor, FALSE for decals created at runtime.
 */
var const bool bStaticDecal;

/**
 * If non-NULL, consider HitComponent only when computing receivers.
 */
var transient PrimitiveComponent HitComponent;

/**
 * The name of hit bone.
 */
var transient name HitBone;

/** If not -1, specifies the index of the BSP node that was hit. */
var transient int HitNodeIndex;

/** If not -1, specifies the level into the world's level array of the BSP node that was hit. */
var transient int HitLevelIndex;

/** If not -1, specifies the index of the FracturedStaticMeshComponent we hit */
var transient int FracturedStaticMeshComponentIndex;

/** Used to pass information of which BSP nodes where hit */
var private const transient array<int> HitNodeIndices;

/**
 * A decal receiver and its associated render data.
 */
struct native DecalReceiver
{
	var const PrimitiveComponent Component;
	var native const pointer RenderData{class FDecalRenderData};
};

/** List of receivers to which this decal is attached. */
var private noimport duplicatetransient const array<DecalReceiver> DecalReceivers;

/** List of receivers for static decals.  Empty if the decal has bStaticDecal=FALSE.*/
var native private noimport transient duplicatetransient const array<pointer> StaticReceivers{class FStaticReceiverData};

/** Command fence used to shut down properly. */
var native const transient duplicatetransient pointer		ReleaseResourcesFence{FRenderCommandFence};

/** Ortho planes. */
var private transient array<Plane> Planes;

var(DecalRender) float DepthBias;
var(DecalRender) float SlopeScaleDepthBias;

//@zombie_ps4_begin - TODO - Orbis has a different depth bias. We need a cleaner solution for this.
var(DecalRender) float OrbisDepthBias;
var(DecalRender) float OrbisSlopeScaleDepthBias;
//@zombie_ps4_end
/** Controls the order in which decal elements are rendered.  Higher values draw later (on top). */
var(DecalRender) int	SortOrder;

/** Dot product of the minimum angle that surfaces can make with the decal normal to be considered backfacing. */
var(DecalRender) float	BackfaceAngle;

/** Start/End blend range specified as an angle in degrees. Controls where to start blending out the decal on a surface */
var(DecalRender) Vector2D	BlendRange;

/**
 * Allows artists to adjust the distance where textures using UV 0 are streamed in/out.
 * 1.0 is the default, whereas a higher value increases the streamed-in resolution.
 */
var(DecalRender) const float StreamingDistanceMultiplier;

enum EDecalTransform
{
	/** Location/Orientation are obtained from the owning actor's absolute world coordinates */
	DecalTransform_OwnerAbsolute,
	/** Location/Orientation are transformed relative to the owning actor's coordinates */
	DecalTransform_OwnerRelative,
	/** Location/Orientation are relative to the original spawn point in world coordinates */
	DecalTransform_SpawnRelative
};
/** Determines how the Location/Orientation of the decal are used */
var const EDecalTransform DecalTransform;

/**
 * Specifies how the decal application filter should be interpreted.
 */
enum EFilterMode
{
	/** Filter is ignored. */
	FM_None,
	/** Filter specifies list of components to ignore. */
	FM_Ignore,
	/** Filter specifies list of components to affect.*/
	FM_Affect
};

/** Current filter application mode. */
var(DecalFilter) EFilterMode	FilterMode;

/** Component filter. */
var(DecalFilter) array<Actor>	Filter;

/** @hack: Gears hack to avoid an octree look-up for level-placed decals. To be replaced with receiver serialization after ship.*/
var(DecalFilter) array<PrimitiveComponent>	ReceiverImages;

/** If FALSE (the default), don't project decal onto back-facing polygons. */
var(DecalFilter) bool bProjectOnBackfaces;

/** If FALSE (the default), don't project decal onto hidden receivers. */
var(DecalFilter) bool bProjectOnHidden;

/** If FALSE, don't project decal onto BSP. */
var(DecalFilter) bool bProjectOnBSP;

/** If FALSE, don't project decal onto static meshes. */
var(DecalFilter) bool bProjectOnStaticMeshes;

/** If FALSE, don't project decal onto skeletal meshes. */
var(DecalFilter) bool bProjectOnSkeletalMeshes;

/** If FALSE, don't project decal onto terrain. */
var(DecalFilter) bool bProjectOnTerrain;

/** If TRUE, invert the direction considered to be backfacing receiver triangles.  Set e.g. when decal actors are mirrored. */
var bool bFlipBackfaceDirection;

/** If TRUE, then the decal will recompute its receivers whenever its transform is updated. Allowing for dynamic movable decals */
var bool bMovableDecal;


/** If TRUE, it will recalculate the parent relative transform every tick. 
	PERFORMANCE WARNING 
 */
var bool bTickParentRelativeTransform;


/** TRUE if the decal has already been attached once. Allows for static decals to be reattached */
var private transient bool bHasBeenAttached;

/** Decal location relative to parent transform used with DecalTransform_OwnerRelative mode */
var(DecalRender) vector ParentRelativeLocation;
/** Decal orientation vector relative to parent transform used with DecalTransform_OwnerRelative mode */
var(DecalRender) rotator ParentRelativeOrientation;

/** Decal location/orientation relative to parent transform when first attached */
var const private transient matrix ParentRelLocRotMatrix;

/**
 * So for some DecalComponents (usually residing in GamePlay objects) we set the DecalMaterial from an Archetype or some other default property.
 * For those decals we do not want to MapCheckForErrors on them.
 **/
var() bool bDecalMaterialSetAtRunTime;


/** detaches the component and resets the component's properties to the values of its template */
native final function ResetToDefaults();

/** setting decal material on decal component. This will force the decal to reattach */
native final function SetDecalMaterial(MaterialInterface NewDecalMaterial);
/** Accessor for decal material */
native final function MaterialInterface GetDecalMaterial() const;

/** Needed for proper synchronization of pooled decals */
native final function bool IsWaitingForResetToDefaultsToComplete();

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
   Width=200.000000
   Height=200.000000
   TileX=1.000000
   TileY=1.000000
   FieldOfView=80.000000
   FarPlane=300.000000
   bProjectOnBSP=True
   bProjectOnStaticMeshes=True
   bProjectOnSkeletalMeshes=True
   bProjectOnTerrain=True
   DepthBias=-0.000060
   OrbisDepthBias=-1.600000
   OrbisSlopeScaleDepthBias=50.000000
   BackfaceAngle=0.001000
   BlendRange=(X=89.500000,Y=180.000000)
   StreamingDistanceMultiplier=1.000000
   DecalTransform=DecalTransform_SpawnRelative
   ReplacementPrimitive=None
   bAcceptsDynamicDecals=False
   bCastDynamicShadow=False
   bAcceptsDynamicLights=False
   Name="Default__DecalComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
