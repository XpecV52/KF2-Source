/**
* A IsInObjectList Action is used to test whether an object is in the referenced
* object list or not.
*
* The default is to check for all objects in the list.  If the CheckForAllObjects is
* unchecked then if ANY of the objects attached to Object(s)ToTest are found, then we will
* set "In List" to hot
*
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_IsInObjectList extends SequenceAction
	native(Sequence);

/** Determines whether or not we check for ALL or ANY objects referenced via Object(s)ToTest **/
var() bool bCheckForAllObjects;

var private transient bool bObjectFound;

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
   bCheckForAllObjects=True
   InputLinks(0)=(LinkDesc="Test if in List")
   OutputLinks(0)=(LinkDesc="In List")
   OutputLinks(1)=(LinkDesc="Not in List")
   VariableLinks(0)=(LinkDesc="Object(s)ToTest",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkDesc="ObjectListVar",bWriteable=True)
   ObjName="IsIn ObjectList"
   ObjCategory="Object List"
   Name="Default__SeqAct_IsInObjectList"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
