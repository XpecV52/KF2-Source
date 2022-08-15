/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldRadialComponent extends NxForceFieldComponent
	native(ForceField);


/** Render the size of force field */
//var() DrawSphereComponent RenderComponentSphere;

// var() editinline ForceFieldShape Shape;

/** Strength of the force applied by this actor. Positive forces are applied outwards. */
var()	interp float	ForceStrength;

/** Radius of influence of the force. */
var()	interp float	ForceRadius;

/** */
var()	interp float	SelfRotationStrength;

/** Way in which the force falls off as objects are further away from the location. */
var()	PrimitiveComponent.ERadialImpulseFalloff	ForceFalloff;

/** custom force field kernel */
var const native transient pointer		Kernel{class NxForceFieldKernelRadial};


// (cpptext)
// (cpptext)
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
   ForceStrength=200.000000
   ForceRadius=200.000000
   SelfRotationStrength=200.000000
   Begin Object Class=ForceFieldShapeSphere Name=Shape0
      Begin Object Class=DrawSphereComponent Name=DrawSphere0 ObjName=DrawSphere0 Archetype=DrawSphereComponent'Engine.Default__ForceFieldShapeSphere:DrawSphere0'
         SphereRadius=200.000000
         ReplacementPrimitive=None
         Name="DrawSphere0"
         ObjectArchetype=DrawSphereComponent'DrawSphere0'
      End Object
      Shape=DrawSphereComponent'Engine.Default__NxForceFieldRadialComponent:Shape0.DrawSphere0'
      Name="Shape0"
      ObjectArchetype=ForceFieldShapeSphere'Engine.Default__ForceFieldShapeSphere'
   End Object
   Shape=ForceFieldShapeSphere'Engine.Default__NxForceFieldRadialComponent:Shape0'
   ReplacementPrimitive=None
   Name="Default__NxForceFieldRadialComponent"
   ObjectArchetype=NxForceFieldComponent'Engine.Default__NxForceFieldComponent'
}
