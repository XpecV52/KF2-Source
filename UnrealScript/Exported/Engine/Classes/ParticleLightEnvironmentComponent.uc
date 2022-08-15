/**
 * Light environment class used by particle systems.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class ParticleLightEnvironmentComponent extends DynamicLightEnvironmentComponent
	native(Light);

/** Reference count used to know when this light environment can be detached and cleaned up since it may be shared by multiple particle system components. */
var transient protected{protected} const int ReferenceCount;

/** Number of different particle components this particle light environment has been used by. */
var transient const int NumPooledReuses;

/** Lit particle components created from the emitter pool will only share particle DLE's if they have matching SharedInstigator's. */
var transient const Actor SharedInstigator;

/** Lit particle components created from the emitter pool will only share particle DLE's if they have matching SharedParticleSystem's. */
var transient const ParticleSystem SharedParticleSystem;

/** Whether this DLE can be shared by particle components of the same actor. */
var bool bAllowDLESharing;

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
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bAllowDLESharing=True
   InvisibleUpdateTime=10.000000
   MinTimeBetweenFullUpdates=3.000000
   bForceCompositeAllLights=True
   bAffectedBySmallDynamicLights=False
   BoundsMethod=DLEB_ActiveComponents
   Name="Default__ParticleLightEnvironmentComponent"
   ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
}
