/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ImageReflectionShadowPlaneComponent extends PrimitiveComponent
	native(Mesh)
	placeable
	editinlinenew;

/** Whether to render the reflection. */
var() bool bEnabled;

var plane ReflectionPlane;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
* Changes the enabled state of the image reflection component.
* @param bSetEnabled - The new value for bEnabled.
*/
final native function SetEnabled(bool bSetEnabled);

defaultproperties
{
   bEnabled=True
   ReflectionPlane=(W=86.000000,X=0.000000,Y=0.000000,Z=1.000000)
   ReplacementPrimitive=None
   HiddenGame=True
   bAcceptsDynamicDecals=False
   bCastDynamicShadow=False
   bAcceptsDynamicLights=False
   Name="Default__ImageReflectionShadowPlaneComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
