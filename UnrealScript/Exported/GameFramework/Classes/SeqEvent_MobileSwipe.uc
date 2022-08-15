/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileSwipe extends SeqEvent_MobileRawInput
	native;

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


/** How much tolerance should we give the weak axis in order to consider it a swipe */
var (swipe) float Tolerance;

/** How far does the touch need to travel in order to be consider a swipe */
var (swipe) float MinDistance;

var vector2D InitialTouch;

/** A list of actors that were passed over when the swipe occured */
var (Results) array<actor> TouchedActors;

/** How far should this object track out to hit something */
var(mobile) float TraceDistance;

defaultproperties
{
   Tolerance=100.000000
   MinDistance=5.000000
   TraceDistance=20480.000000
   OutputLinks(0)=(LinkDesc="Swipe Left")
   OutputLinks(1)=(LinkDesc="Swipe Right")
   OutputLinks(2)=(LinkDesc="Swipe Up")
   OutputLinks(3)=(LinkDesc="Swipe Down")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkDesc="Touched Actors List",PropertyName=,bWriteable=True)
   ObjName="Mobile Simple Swipes"
   Name="Default__SeqEvent_MobileSwipe"
   ObjectArchetype=SeqEvent_MobileRawInput'GameFramework.Default__SeqEvent_MobileRawInput'
}
