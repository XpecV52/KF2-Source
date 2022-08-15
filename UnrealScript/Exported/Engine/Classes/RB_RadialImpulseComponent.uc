/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class RB_RadialImpulseComponent extends PrimitiveComponent
	hidecategories(Object)
	native(Physics);

var()	ERadialImpulseFalloff	ImpulseFalloff;
var()	float					ImpulseStrength;
var()	float					ImpulseRadius;
var()	bool					bVelChange;

/** If true, will cause any FracturedStaticMeshActor pieces within expolsion to break. */
var()	bool					bCauseFracture;

var		DrawSphereComponent		PreviewSphere;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function FireImpulse( Vector Origin );

defaultproperties
{
   ImpulseStrength=900.000000
   ImpulseRadius=200.000000
   ReplacementPrimitive=None
   TickGroup=TG_PreAsyncWork
   Name="Default__RB_RadialImpulseComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
