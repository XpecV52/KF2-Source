/**
 * This can have state.  This is the primary difference between GoalEvaluators and PathContraints.
 * 
 * Additionally, once the Goal's EvaluateGoal returns TRUE that path search will end.
 * 
 * A goal is a great place to have EvaluateGoal aggregate all of the possible "goals" that have passed the
 * constraints.  At some point (time based, search space based) EvaluateGoal will return TRUE and then 
 * DetermineFinalGoal will be called which one can then do final evaluation of the valid (from the path constraints) 
 * goals.
 * 
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshPathGoalEvaluator extends Object
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

/** list of goals to search for */
struct native BiasedGoalActor
{
	/** the goal to search for */
	var Actor Goal;
	/** an additional cost (in units) to add to the pathfinding distance to bias against this choice
	 * (e.g. if one choice is enough better than the others that it should be prioritized if it's only a little bit further away)
	 */
	var int ExtraCost;
};

/** Next goal evaluator */
var transient protected NavMeshPathGoalEvaluator NextEvaluator;

/** maximum number of NavigationPoints to test before giving up */
var protected int MaxPathVisits;


/** this bool determines if this evaluator's 'EvaluageGoal' function gets called even after a determination has been made
 *  about the current goal.  E.G. a previous evaluator returned FALSE indicating the search was not complete, but we still want
 *  EvaluateGoal called even when the outcome has already been decided.  This is useful for 
 *  evaluators that need to see all incoming candidates regardless of whether or not another evaluator is throwing htem out
 */
var bool bAlwaysCallEvaluateGoal;

/** Debug var to keep track of how many nodes this goal evaluator has nixed */
var transient int NumNodesThrownOut;
/** Debug var to keep track of how many nodes this goal evaluator has processed */
var transient int NumNodesProcessed;

/** bool indicating whether we should attempt partial A* and restrict the open list size */
var bool bDoPartialAStar;
/** when doing partial Astar, limit open list to this size */
var int MaxOpenListSize;

event Recycle()
{
	NumNodesThrownOut=0;
	NumNodesProcessed=0;
	NextEvaluator=none;
}

event String GetDumpString()
{
	return String(self);
}

defaultproperties
{
   MaxPathVisits=1024
   Name="Default__NavMeshPathGoalEvaluator"
   ObjectArchetype=Object'Core.Default__Object'
}
