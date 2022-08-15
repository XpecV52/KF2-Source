/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

/**
 *  Audio component used by AmbientSoundSpline. It finds position of sound source (virtual speaker) based on poredefined points list, and listener's position.
 */

class SplineAudioComponent extends AudioComponent
	native
	collapsecategories
	hidecategories(Object,ActorComponent)
	editinlinenew;

struct InterpPointOnSpline
{
	var() vector Position;
	var() float InVal;
	var() float Length;
};

/** The scope of listener. How far points are included while virtual speaker eveluation. */
var(SplineAudioComponent)   float ListenerScopeRadius;

/** While virtual speaker position evaluation, the clolest point index is stored in this field. It is used to Calculate the distance, needed to eval the attenuation. */
var                         int ClosestPointOnSplineIndex;


/** Points used to find virtual speaker's position. They are placed on spline automatically, while spline editing. */
var init                    array< InterpPointOnSpline > Points;

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
   ListenerScopeRadius=1200.000000
   Name="Default__SplineAudioComponent"
   ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
}
