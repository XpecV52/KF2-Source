/*******************************************************************************
 * NavMeshPathGoalEvaluator generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NavMeshPathGoalEvaluator extends Object
    native(AI);

struct native BiasedGoalActor
{
    var Actor Goal;
    var int ExtraCost;

    structdefaultproperties
    {
        Goal=none
        ExtraCost=0
    }
};

var protected transient NavMeshPathGoalEvaluator NextEvaluator;
var protected int MaxPathVisits;
var bool bAlwaysCallEvaluateGoal;
var bool bDoPartialAStar;
var transient int NumNodesThrownOut;
var transient int NumNodesProcessed;
var int MaxOpenListSize;

event Recycle()
{
    NumNodesThrownOut = 0;
    NumNodesProcessed = 0;
    NextEvaluator = none;
}

event string GetDumpString()
{
    return string(self);
}

defaultproperties
{
    MaxPathVisits=1024
}