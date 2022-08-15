/*******************************************************************************
 * NavMeshGoal_At generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NavMeshGoal_At extends NavMeshPathGoalEvaluator
    native(AI);

var Vector Goal;
var float GoalDist;
var bool bKeepPartial;
var bool bWeightPartialByDist;
var bool bGoalInSamePolyAsAnchor;
var float PartialDistSq;
var private native Pointer GoalPoly;
var private native Pointer PartialGoal;

// Export UNavMeshGoal_At::execRecycleNative(FFrame&, void* const)
native function RecycleNative();

static function bool AtActor(NavigationHandle NavHandle, Actor GoalActor, optional float Dist, optional bool bReturnPartial, optional bool bInWeightPartialByDist)
{
    local Controller GoalController, MyController;
    local Vector TargetLoc;

    if(NavHandle != none)
    {
        GoalController = Controller(GoalActor);
        if(GoalController != none)
        {
            GoalActor = GoalController.Pawn;
        }
        if(GoalActor != none)
        {
            MyController = Controller(NavHandle.Outer);
            NavHandle.PopulatePathfindingParamCache();
            TargetLoc = GoalActor.GetDestination(MyController);
            return AtLocation(NavHandle, TargetLoc, Dist, bReturnPartial);
        }
    }
    return false;
}

static function bool AtLocation(NavigationHandle NavHandle, Vector GoalLocation, optional float Dist, optional bool bReturnPartial, optional bool bInWeightPartialByDist)
{
    local NavMeshGoal_At Eval;

    if(NavHandle != none)
    {
        Eval = NavMeshGoal_At(NavHandle.CreatePathGoalEvaluator(default.Class));
        if(Eval != none)
        {
            Eval.Goal = GoalLocation;
            Eval.GoalDist = Dist;
            Eval.bKeepPartial = bReturnPartial;
            Eval.bWeightPartialByDist = bInWeightPartialByDist;
            NavHandle.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
}

function Recycle()
{
    Goal = vect(0, 0, 0);
    GoalDist = default.GoalDist;
    bKeepPartial = default.bKeepPartial;
    bWeightPartialByDist = default.bWeightPartialByDist;
    PartialDistSq = default.PartialDistSq;
    RecycleNative();
    super.Recycle();
}

defaultproperties
{
    PartialDistSq=1E+12
    bDoPartialAStar=true
    MaxOpenListSize=2048
}