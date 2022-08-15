/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleColorByParameter extends ParticleModuleColorBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The name of the parameter to retrieve the color from. */
var(Color) name		ColorParam;
/** The default color to use in the even that the parameter is not set on the emitter. */
var(Color) color	DefaultColor;

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
   DefaultColor=(B=255,G=255,R=255,A=255)
   bSpawnModule=True
   Name="Default__ParticleModuleColorByParameter"
   ObjectArchetype=ParticleModuleColorBase'Engine.Default__ParticleModuleColorBase'
}
