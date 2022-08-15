/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * -this is a helper base class which is for filters that are meant to be used in conjunction with NavMshGoal_GenericFilterContainer
 *  these goals should only answer this question "is this a valid final goal or not?" and do nothing else.  
 */
class NavMeshGoal_Filter extends Object
	native(AI)
	abstract;

var bool bShowDebug;


/** Debug var to keep track of how many nodes this goal evaluator has nixed */
var transient int NumNodesThrownOut;
/** Debug var to keep track of how many nodes this goal evaluator has processed */
var transient int NumNodesProcessed;


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

event String GetDumpString()
{
	return String(self);
}

defaultproperties
{
   Name="Default__NavMeshGoal_Filter"
   ObjectArchetype=Object'Core.Default__Object'
}
