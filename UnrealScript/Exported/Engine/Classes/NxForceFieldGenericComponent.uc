/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldGenericComponent extends NxForceFieldComponent
	DependsOn(NxForceFieldGeneric)
	native(ForceField);

/* the Shape's internal 3 directional radii, for level designers to know the rough size of the force field*/
var() float RoughExtentX;
var() float RoughExtentY;
var() float RoughExtentZ;

/** Type of Coordinates to define the force field */
var()	FFG_ForceFieldCoordinates	Coordinates;

/** Constant force vector that is applied inside force volume */
var()	vector	Constant;


/** Rows of matrix that defines force depending on position */
var()	vector	PositionMultiplierX;
var()	vector	PositionMultiplierY;
var()	vector	PositionMultiplierZ;

/** Vector that defines force depending on position */
var()	vector	PositionTarget;


/** Rows of matrix that defines force depending on velocity */
var()	vector	VelocityMultiplierX;
var()	vector	VelocityMultiplierY;
var()	vector	VelocityMultiplierZ;

/** Vector that defines force depending on velocity */
var()	vector	VelocityTarget;

/** Vector that scales random noise added to the force */
var()	vector	Noise;

/** Linear falloff for vector in chosen coordinate system */
var()	vector	FalloffLinear;

/** Quadratic falloff for vector in chosen coordinate system */
var()	vector	FalloffQuadratic;

/** Radius of torus in case toroidal coordinate system is used */
var()	float	TorusRadius;

/** linear force field kernel */
// NVCHANGE_BEGIN: TSC -  making force fields safer & simpler
var const native transient pointer		Kernel{class NxForceFieldLinearKernel};
// NVCHANGE_END: TSC -  making force fields safer & simpler

// (cpptext)
// (cpptext)
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
   RoughExtentX=200.000000
   RoughExtentY=200.000000
   RoughExtentZ=200.000000
   TorusRadius=1.000000
   Begin Object Class=ForceFieldShapeBox Name=Shape0
      Begin Object Class=DrawBoxComponent Name=DrawBox0 ObjName=DrawBox0 Archetype=DrawBoxComponent'Engine.Default__ForceFieldShapeBox:DrawBox0'
         ReplacementPrimitive=None
         Name="DrawBox0"
         ObjectArchetype=DrawBoxComponent'DrawBox0'
      End Object
      Shape=DrawBoxComponent'Engine.Default__NxForceFieldGenericComponent:Shape0.DrawBox0'
      Name="Shape0"
      ObjectArchetype=ForceFieldShapeBox'Engine.Default__ForceFieldShapeBox'
   End Object
   Shape=ForceFieldShapeBox'Engine.Default__NxForceFieldGenericComponent:Shape0'
   ReplacementPrimitive=None
   Name="Default__NxForceFieldGenericComponent"
   ObjectArchetype=NxForceFieldComponent'Engine.Default__NxForceFieldComponent'
}
