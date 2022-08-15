/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqVar_Object extends SequenceVariable
	native(Sequence);

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

var() protected Object ObjValue;

/** Local copy of the actor location, used as a dummy when treating an Actor as a vector, to prevent accidental writes to the Actor location */
var transient vector ActorLocation;

var const array<class<Object> > SupportedClasses;

/** returns the object this variable is currently pointing to
 * if this variable represents a list of objects, only returns the first one
 */
function Object GetObjectValue()
{
	return ObjValue;
}

/** sets the object this variable points to */
function SetObjectValue(Object NewValue)
{
	ObjValue = NewValue;
}

defaultproperties
{
   SupportedClasses(0)=Class'Core.Object'
   ObjName="Object"
   ObjCategory="Object"
   ObjColor=(B=255,G=0,R=255,A=255)
   Name="Default__SeqVar_Object"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
