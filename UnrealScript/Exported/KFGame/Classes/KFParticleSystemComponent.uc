//=============================================================================
// KFParticleSystemComponent
//=============================================================================
// Special Particle system component that can handle rendering at a different FOV than the the world.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Based on UDKParticleSystemComponent Copyright 1998-2012 Epic Games, Inc.
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFParticleSystemComponent extends ParticleSystemComponent
	native(Effect);

/** Used when a custom FOV is set to make sure the particles render properly using the custom FOV */
var public{private} const float FOV;
var public{private} const bool bHasSavedScale3D;
var public{private} const vector SavedScale3D;


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


/** This changes the FOV used for rendering the particle system component. A value of 0 means to use the default. */
native final function SetFOV(float NewFOV);

defaultproperties
{
   bOverrideLODMethod=True
   LODMethod=PARTICLESYSTEMLODMETHOD_DirectSet
   ReplacementPrimitive=None
   Name="Default__KFParticleSystemComponent"
   ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
}
