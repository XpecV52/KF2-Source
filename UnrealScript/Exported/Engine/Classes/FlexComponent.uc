/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class FlexComponent extends StaticMeshComponent
	native(Mesh);

struct transient native FlexParticleAttachment
{
	var PrimitiveComponent Primitive;
	var int ShapeIndex;
	var int ParticleIndex;
	var float OldMass;
	var Vector LocalPos;
};


/** The simulation container to spawn any flex data contained in the static mesh into. If the static mesh has Flex data then it will be spawned into this simulation container. */
var (FlexComponent) notforconsole FlexContainer FlexComponentContainerTemplate;

/** The phase-id to assign to particles spawned for this mesh */
var (FlexComponent) notforconsole int FlexComponentPhaseId;

/** If true then the particles will be auto-assigned a positive phase-id */
var (FlexComponent) notforconsole bool bFlexComponentAutoAssignPhase;

/** If true then the particles will be attached to any overlapping shapes on spawn*/
var (FlexComponent) notforconsole bool bFlexComponentAttachToRigids;

/** Instance of a FlexAsset referencing particles and constraints in a solver */
var notforconsole transient native const pointer FlexComponentAssetInstance {struct FlexExtInstance};
/* The simulation container the instance belongs to */
var notforconsole transient native const pointer FlexComponentContainerInstance {class FFlexContainerInstance};
/* Pre-simulated particle positions  */
var notforconsole const array<Vector> FlexComponentPreSimPositions;

/* Simulated particle positions  */
var notforconsole transient native const array<Vector4> SimPositions;
/* Simulated particle normals */
var notforconsole transient native const array<Vector> SimNormals;

/* Attachments to rigid bodies */
var notforconsole transient array<FlexParticleAttachment> Attachments;

// (cpptext)
// (cpptext)
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
   bFlexComponentAutoAssignPhase=True
   ReplacementPrimitive=None
   Name="Default__FlexComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
