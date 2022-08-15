/*******************************************************************************
 * NavMeshGoal_PolyEncompassesAI generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NavMeshGoal_PolyEncompassesAI extends NavMeshPathGoalEvaluator
    native(AI);

var transient Vector OverrideExtentToCheck;

static function bool MakeSureAIFits(NavigationHandle NavHandle, const optional Vector InOverrideExtentToCheck)
{
    local NavMeshGoal_PolyEncompassesAI Eval;

    if(NavHandle != none)
    {
        Eval = NavMeshGoal_PolyEncompassesAI(NavHandle.CreatePathGoalEvaluator(default.Class));
        if(Eval != none)
        {
            Eval.OverrideExtentToCheck = InOverrideExtentToCheck;
            NavHandle.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
}

function Recycle()
{
    super.Recycle();
}

defaultproperties
{
    MaxPathVisits=64
}