/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshPathConstraint extends Object
	native(AI);

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

/** Next constraint in the list */
var NavMeshPathConstraint NextConstraint;

/** >> Debugging vars - keep track of stats about what we threw out, etc.. */

/** number of nodes this constraint has processed */
var int NumNodesProcessed;
/** number of nodes this constraint has returned FALSE for */
var int NumThrownOutNodes;
/** total cost added by this constraint to the saved *real* cost of nodes */
var float AddedDirectCost;
/** total cost added by this constraint to the heuristic cost of nodes */
var float AddedHeuristicCost;

// called when this object is about to be re-used from the cache
event Recycle()
{
	NextConstraint = None;
	
	NumThrownOutNodes=0;
	AddedDirectCost=0;
	AddedHeuristicCost=0;
	NumNodesProcessed=0;
}

event String GetDumpString()
{
	return String(self);
}

defaultproperties
{
   Name="Default__NavMeshPathConstraint"
   ObjectArchetype=Object'Core.Default__Object'
}
