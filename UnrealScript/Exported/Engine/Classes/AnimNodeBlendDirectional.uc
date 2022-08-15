/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
// This special blend node will use the LookDir and Acceleration from the Actor that
// owns the SkeletalMeshComponent to blend the four directional animations together.

// TODO: This node could also 'lock' animation rate/phase together for its children (for cadence matching)? Should this be a general blender property?

class AnimNodeBlendDirectional extends AnimNodeBlendBase
	native(Anim)
	hidecategories(Object);

/** Allows control over how quickly the directional blend should be allowed to change. */
var()	float			DirDegreesPerSecond;

/** In radians. Between -PI and PI. 0.0 is running the way we are looking. */
var		float			DirAngle;

/** If the LOD for the mesh is at or above this LOD level, only use a single directional animation instead of blending. */
var()	int				SingleAnimAtOrAboveLOD;

/** Rotational offset to apply */
var		Rotator			RotationOffset;

/** Use acceleration instead of Velocity to determine speed */
var() bool	bUseAcceleration;

// (cpptext)
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
   DirDegreesPerSecond=360.000000
   SingleAnimAtOrAboveLOD=1000
   Children(0)=(Name="Forward",Weight=1.000000)
   Children(1)=(Name="Backward")
   Children(2)=(Name="Left")
   Children(3)=(Name="Right")
   bFixNumChildren=True
   CategoryDesc="Directional"
   Name="Default__AnimNodeBlendDirectional"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
