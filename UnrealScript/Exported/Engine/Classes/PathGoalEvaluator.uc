/**
* Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
*/
class PathGoalEvaluator extends Object
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Next goal evaluator */
var protected PathGoalEvaluator NextEvaluator;

/** Goal that was reached */
var protected NavigationPoint GeneratedGoal;

/** maximum number of NavigationPoints to test before giving up */
var protected int MaxPathVisits;

// index into the goaleval cache for this class' pool
var const int CacheIdx;


var bool bDebug;


event Recycle()
{
	GeneratedGoal=none;
	NextEvaluator=none;
}

event String GetDumpString()
{
	return String(self);
}

defaultproperties
{
   MaxPathVisits=2048
   CacheIdx=-1
   Name="Default__PathGoalEvaluator"
   ObjectArchetype=Object'Core.Default__Object'
}
