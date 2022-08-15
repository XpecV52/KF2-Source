/*=============================================================================
	ParticleModuleTypeDataMeshPhysX.uc: PhysX Emitter Source.
	Copyright 2007-2008 AGEIA Technologies.
=============================================================================*/

class ParticleModuleTypeDataMeshPhysX extends ParticleModuleTypeDataMesh
	native(Particle)
	dependson(ParticleModuleTypeDataPhysX)
	editinlinenew
	collapsecategories
	hidecategories(Object);

/** Actual wrapper for NxFluid PhsyX SDK object */
var(PhysXEmitter) PhysXParticleSystem PhysXParSys<DisplayName="PhysX Par Sys">;

/** 
Methods for simulating the rotation of small differently 
shaped objects using particles. 
*/ 
enum EPhysXMeshRotationMethod
{
	PMRM_Disabled,
	PMRM_Spherical,
	PMRM_Box,
	PMRM_LongBox,
	PMRM_FlatBox,
	PMRM_Velocity 
};

var(PhysXEmitter) EPhysXMeshRotationMethod PhysXRotationMethod<DisplayName="PhysX Mesh Rotation Method">;
var(PhysXEmitter) float FluidRotationCoefficient;
/** Parameters for Vertical LOD: See ParticleModuleTypeDataPhysX.uc */
var(PhysXEmitter) PhysXEmitterVerticalLodProperties VerticalLod;

/** Offset in Z direction for PhysX instanced mesh particles */
var(PhysXEmitter) float ZOffset;

// (cpptext)
// (cpptext)
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
   PhysXRotationMethod=PMRM_Spherical
   FluidRotationCoefficient=5.000000
   VerticalLod=(WeightForFifo=1.000000,WeightForSpawnLod=1.000000,SpawnLodRateVsLifeBias=1.000000)
   Name="Default__ParticleModuleTypeDataMeshPhysX"
   ObjectArchetype=ParticleModuleTypeDataMesh'Engine.Default__ParticleModuleTypeDataMesh'
}
