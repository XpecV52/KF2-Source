/*=============================================================================
	ApexStaticDestructibleComponent.uc: PhysX APEX integration. Destructible component
	Copyright 2008-2009 NVIDIA Corporation.
=============================================================================*/

/***
* This is the base class for static destructible components
*/
class ApexStaticDestructibleComponent extends ApexStaticComponent
	native(Mesh);

/** Increasing this value will cause fracture chunks to be put to sleep more quickly. */
var(Physics)	float SleepEnergyThreshold<ClampMin=0.0>;

/** Increasing this value will cause fracture chunks to be gradually slowed down before putting them to sleep. */
var(Physics)	float SleepDamping<ClampMin=0.0>;

/** The APEX destructible actor (instantiated destructible asset) (duplicatetransients to avoid a pointer copy) */
var native duplicatetransient pointer ApexDestructibleActor   { physx::apex::NxDestructibleActor   };
/** The APEX preview class which can render a preview of a destructible asset */
var native duplicatetransient pointer ApexDestructiblePreview { physx::apex::NxDestructiblePreview };

/** If this component is being used for a thumbnail render */
var native bool bIsThumbnailComponent;


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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   SleepEnergyThreshold=1250.000000
   SleepDamping=0.200000
   ReplacementPrimitive=None
   bUsePrecomputedShadows=False
   Name="Default__ApexStaticDestructibleComponent"
   ObjectArchetype=ApexStaticComponent'Engine.Default__ApexStaticComponent'
}
