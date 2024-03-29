/*=============================================================================
	Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
=============================================================================*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Class Declaration

class SpeedTreeComponent extends PrimitiveComponent 
	native(SpeedTree)
	AutoExpandCategories(Collision,Rendering,Lighting)
	dependson(LightmassPrimitiveSettingsObject)
	hidecategories(Object)
	editinlinenew;
	
/** 
 * Enumerates the types of meshes in a SpeedTreeComponent. 
 * Note: This is mirrored in Lightmass.
 */
enum ESpeedTreeMeshType
{
	// Have to use a min that is one less than the real min, 
	// Since we can't assign enums to other enums in UnrealScript
	STMT_MinMinusOne,
	STMT_Branches1,
	STMT_Branches2,
	STMT_Fronds,
	STMT_LeafCards,
	STMT_LeafMeshes,
	STMT_Billboards,
	STMT_Max
};

/** USpeedTree resource.																				*/
var(SpeedTree)	const	SpeedTree				SpeedTree;

// Flags
/** Whether to draw leaf cards or not.																	*/
var(SpeedTree) 			bool 					bUseLeafCards;
/** Whether to draw leaf meshes or not.																	*/
var(SpeedTree) 			bool 					bUseLeafMeshes;
/** Whether to draw branches or not.																	*/
var(SpeedTree) 			bool 					bUseBranches;		
/** Whether to draw fronds or not.																		*/
var(SpeedTree) 			bool 					bUseFronds;
/** Whether billboards are drawn at the lowest LOD or not.												*/
var(SpeedTree)			bool					bUseBillboards;				

// LOD 
/** The distance for the most detailed tree.															*/
var(SpeedTree)			float					Lod3DStart;
/** The distance for the lowest detail tree.															*/
var(SpeedTree)			float					Lod3DEnd;
/** The distance for the most detailed tree.															*/
var(SpeedTree)			float					LodBillboardStart;
/** The distance for the lowest detail tree.															*/
var(SpeedTree)			float					LodBillboardEnd;
/** the tree will use this LOD level (0.0 - 1.0). If -1.0, the tree will calculate its LOD normally.	*/
var(SpeedTree)			float					LodLevelOverride;

// Material overrides

/** Branch material. */
var(SpeedTree) MaterialInterface		Branch1Material;

/** Cap material. */
var(SpeedTree) MaterialInterface		Branch2Material;

/** Frond material. */
var(SpeedTree) MaterialInterface		FrondMaterial;

/** Leaf card material. */
var(SpeedTree) MaterialInterface		LeafCardMaterial;

/** Leaf mesh material. */
var(SpeedTree) MaterialInterface		LeafMeshMaterial;

/** Billboard material. */
var(SpeedTree) MaterialInterface		BillboardMaterial;

// Internal
/** Icon texture. */
var	editoronly private Texture2D				SpeedTreeIcon;

/** The static lighting for a single light's affect on the component. */
struct native SpeedTreeStaticLight
{
	var private const Guid Guid;
	var private const ShadowMap1D BranchShadowMap;
	var private const ShadowMap1D FrondShadowMap;
	var private const ShadowMap1D LeafMeshShadowMap;
	var private const ShadowMap1D LeafCardShadowMap;
	var private const ShadowMap1D BillboardShadowMap;
};

/** Static lights array. */
var private const array<SpeedTreeStaticLight> StaticLights;

/** The component's branch light-map. */
var native private const LightMapRef BranchLightMap;

/** The component's frond light-map. */
var native private const LightMapRef FrondLightMap;

/** The component's leaf mesh light-map. */
var native private const LightMapRef LeafMeshLightMap;

/** The component's leaf card light-map. */
var native private const LightMapRef LeafCardLightMap;

/** The component's billboard light-map. */
var native private const LightMapRef BillboardLightMap;

/** The component's rotation matrix (for arbitrary rotations with wind) */
var native private const Matrix RotationOnlyMatrix;

/** The Lightmass settings for the entire speedtree. */
var(Lightmass) LightmassPrimitiveSettings LightmassSettings <ScriptOrder=true>;

/** Returns the component's material corresponding to MeshType if it is set, otherwise returns the USpeedTree's material. */
native function MaterialInterface GetMaterial(ESpeedTreeMeshType MeshType) const;

/** Sets the component's material override, and reattaches if necessary. */
native function SetMaterial(ESpeedTreeMeshType MeshType, MaterialInterface Material);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Default Properties

defaultproperties
{
   bUseLeafCards=True
   bUseLeafMeshes=True
   bUseBranches=True
   bUseFronds=True
   bUseBillboards=True
   Lod3DStart=500.000000
   Lod3DEnd=3000.000000
   LodBillboardStart=3500.000000
   LodBillboardEnd=4000.000000
   LodLevelOverride=1.000000
   SpeedTreeIcon=Texture2D'EditorResources.SpeedTreeLogo'
   LightmassSettings=(EmissiveLightFalloffExponent=2.000000,EmissiveBoost=1.000000,DiffuseBoost=1.000000,SpecularBoost=1.000000,FullyOccludedSamplesFraction=1.000000)
   ReplacementPrimitive=None
   bUseAsOccluder=True
   CastShadow=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   Name="Default__SpeedTreeComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
