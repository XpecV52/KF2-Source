/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*/
class PathConstraint extends Object
	native(AI);

// index into the constraint cache for this class' pool
var const int CacheIdx;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Next constraint in the list */
var PathConstraint NextConstraint;

// called when this object is about to be re-used from the cache
event Recycle()
{
	NextConstraint = None;
}

event String GetDumpString()
{
	return String(self);
}

defaultproperties
{
   CacheIdx=-1
   Name="Default__PathConstraint"
   ObjectArchetype=Object'Core.Default__Object'
}
