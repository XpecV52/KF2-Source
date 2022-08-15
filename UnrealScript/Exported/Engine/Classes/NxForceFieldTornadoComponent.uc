/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class NxForceFieldTornadoComponent extends NxForceFieldComponent
	native(ForceField);


/** Strength of the force applied by this actor.*/
var()	interp float	RadialStrength;

/** Rotational strength of the force applied around the cylinder axis.*/
var()	interp float	RotationalStrength;

/** Strength of the force applied along the cylinder axis */
var()	interp float	LiftStrength;

/** Radius of influence of the force at the bottom of the cylinder. */
var()	interp float	ForceRadius;

/** Radius of the force field at the top */
var()	interp float	ForceTopRadius;

/** Lift falloff height, 0-1, lift starts to fall off in a linear way above this height */
var()	interp float	LiftFalloffHeight;

/** Velocity above which the radial force is ignored. */
var()	interp float	EscapeVelocity;

/** Height of force cylinder */
var()	interp float	ForceHeight;

/** Offset from the actor base to the center of the force field */
var()	interp float	HeightOffset;

/**  */
var()	bool BSpecialRadialForceMode;

/** */
var()	interp float	SelfRotationStrength;

/** custom force field kernel */
var const native transient pointer		Kernel{class NxForceFieldKernelTornadoAngular};

// (cpptext)
// (cpptext)
// (cpptext)
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
   LiftStrength=10.000000
   ForceRadius=200.000000
   ForceTopRadius=200.000000
   ForceHeight=200.000000
   Begin Object Class=ForceFieldShapeCapsule Name=Shape0
      Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0 ObjName=DrawCapsule0 Archetype=DrawCapsuleComponent'Engine.Default__ForceFieldShapeCapsule:DrawCapsule0'
         ReplacementPrimitive=None
         Rotation=(Pitch=0,Yaw=0,Roll=16384)
         Name="DrawCapsule0"
         ObjectArchetype=DrawCapsuleComponent'DrawCapsule0'
      End Object
      Shape=DrawCapsuleComponent'Engine.Default__NxForceFieldTornadoComponent:Shape0.DrawCapsule0'
      Name="Shape0"
      ObjectArchetype=ForceFieldShapeCapsule'Engine.Default__ForceFieldShapeCapsule'
   End Object
   Shape=ForceFieldShapeCapsule'Engine.Default__NxForceFieldTornadoComponent:Shape0'
   ReplacementPrimitive=None
   Name="Default__NxForceFieldTornadoComponent"
   ObjectArchetype=NxForceFieldComponent'Engine.Default__NxForceFieldComponent'
}
