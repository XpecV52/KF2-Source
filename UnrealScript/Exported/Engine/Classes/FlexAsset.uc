/*=============================================================================
	FlexAsset.uc: Flex Asset.
	Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
=============================================================================*/

/* A Flex asset contains the particle and constraint data for a shape, such as cloth, rigid body or inflatable, an asset 
   is added to a container by spawning through a particle system or Flex actor */

class FlexAsset extends Object
	native(Physics)
	editinlinenew
	hidecategories(Object);

/** The Flex asset type */
enum EFlexAssetType
{
	FLEX_Cloth,	// a particle/constraint network
	FLEX_Solid,	// solid sampling of the mesh interior for rigid bodies
};

//=============================================================================
//	Flex Container Parameters
//=============================================================================

	/** The asset type, can either be a thin shell (cloth), or a solid (rigid body) */
	var(Common) EFlexAssetType Type;

	// NVCHANGE_BEGIN: HLLU - Add flex container to flex asset
	/** The flex container this asset will use. This container can be overwritten by the FlexActor's container */
	var (Common) notforconsole FlexContainer FlexAssetContainerTemplate;

	/** The phase-id to assign to particles spawned for this mesh. This can be overwritten by the FlexActor's FlexComponentPhaseId */
	var (Common) notforconsole int FlexAssetPhaseId;

	/** If true then the particles will be auto-assigned a positive phase-id. This bool can be overwritten by the FlexActor's bFlexComponentAutoAssignPhase */
	var (Common) notforconsole bool bFlexAssetAutoAssignPhase;
	// NVCHANGE_END: HLLU - Add flex container to flex asset

	/** The per-particle mass to use for the particles, for clothing this value be multiplied by 0-1 dependent on the vertex color */
	var(Common) float Mass;

	/** How much the cloth resists stretching */
	var(Cloth) float StretchStiffness;

	/** How much the cloth resists bending */
	var(Cloth) float BendStiffness;

	/** How strong tethers resist stretching */
	var(Cloth) float TetherStiffness;

	/** How much tethers have to stretch past their rest-length before becoming enabled, 0.1=10% elongation */
	var(Cloth) float TetherGive;

	/** Can be enabled for closed meshes, a volume conserving constraint will be added to the simulation */
	var(Inflatable) bool bEnableInflatable;

	/** The inflatable pressure, a value of 1.0 corresponds to the rest volume, 0.5 corressponds to being deflated by half, and values > 1.0 correspond to over-inflation */
	var(Inflatable) float OverPressure;
	
	/** The rigid body stiffness */
	var(Rigid) float RigidStiffness;

	/** The spacing to use when sampling solid shapes with particles, this should be close to radius of the container this asset will be spawned in */
	var(Rigid) float RigidSamplingDistance;

	/** Store the rigid body center of mass, not editable */
	var vector RigidCenter;
	
	var float InflatableStiffness;
	var float InflatableVolume;

	// the particles and constraints created from the mesh
	var array<Vector4> Particles;
	var array<INT> Phases;
	
	var array<INT> SpringIndices;	
	var array<float> SpringCoefficients;
	var array<float> SpringRestLengths;

	// faces for cloth
	var array<INT> Triangles;
	var array<INT> VertexToParticleMap;

	var notforconsole transient native const pointer Object {struct FlexExtObject};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bFlexAssetAutoAssignPhase=True
   Mass=1.000000
   StretchStiffness=1.000000
   BendStiffness=1.000000
   TetherStiffness=1.000000
   TetherGive=0.100000
   OverPressure=1.000000
   RigidSamplingDistance=40.000000
   InflatableStiffness=1.000000
   Name="Default__FlexAsset"
   ObjectArchetype=Object'Core.Default__Object'
}
