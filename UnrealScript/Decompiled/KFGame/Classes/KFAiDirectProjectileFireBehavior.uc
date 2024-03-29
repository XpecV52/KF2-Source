/*******************************************************************************
 * KFAiDirectProjectileFireBehavior generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAiDirectProjectileFireBehavior extends KFAiBaseRangedBehavior within KFAIController
    native(AI);

// Export UKFAiDirectProjectileFireBehavior::execLosTestForAttackLane(FFrame&, void* const)
native static function bool LosTestForAttackLane(Vector From, Vector To, float Radius, optional float Height, optional out Vector HitLoc, const optional out array<Actor> IgnoreActors, const optional out array< class<Actor> > IgnoreActorsClasses, optional out ImpactInfo outImpactInfo);

function bool IsThereClearDirectFireAttackLaneFromGivenLoc(Vector PointToStrikeFrom, Actor TheTarget)
{
    local Vector targetsOffsetForCals, displacementToTarget, pointToCalcLaunchFrom, locationOfBlockage;
    local Quat qRot;
    local array<Actor> losIgnoreActors;
    local array< class<Actor> > losIgnoreActorsClasses;
    local bool bfoundLane;
    local RangedLocValidationData newData;

    targetsOffsetForCals = TheTarget.Location;
    targetsOffsetForCals.Z += 10;
    displacementToTarget = targetsOffsetForCals - PointToStrikeFrom;
    qRot = QuatFromRotator(rotator(displacementToTarget));
    pointToCalcLaunchFrom = QuatRotateVector(qRot, OffsetForCalcOfForStrike);
    pointToCalcLaunchFrom = pointToCalcLaunchFrom + PointToStrikeFrom;
    if(TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement > 0)
    {
        if(StrikeLocValidationInfoList.Length <= TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement)
        {
            StrikeLocValidationInfoList.AddItem(newData;
            SetAllPastStrikeLocValidationInfoToExpired();
        }
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].bCalulatedThisEngagement = true;
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.Length = 0;
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].LogAlgosSegmentEnds.Length = 0;
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].FireLastPointToStrikeFrom = pointToCalcLaunchFrom;
    }
    losIgnoreActors.AddItem(Outer.MyKFPawn;
    losIgnoreActors.AddItem(TheTarget;
    losIgnoreActorsClasses.AddItem(Class'KFPawn_Monster';
    bfoundLane = LosTestForAttackLane(pointToCalcLaunchFrom, targetsOffsetForCals, Outer.BaseShapeOfProjectileForCalc.X, Outer.BaseShapeOfProjectileForCalc.Z, locationOfBlockage, losIgnoreActors, losIgnoreActorsClasses, StrikeLaneBlockageImpactInfo);
    if(TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement > 0)
    {
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].LogAlgosSegmentEnds.AddItem(targetsOffsetForCals;
        StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].FireLastLocOfBlockage = locationOfBlockage;
        if(bfoundLane)
        {
            StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.AddItem(true;
            return true;            
        }
        else
        {
            StrikeLocValidationInfoList[TotalNumOfAttemptsToFindFireStrikeLaneThisEngagement].LogAlgosSegmentValiditys.AddItem(false;
            if(!Class'Engine'.static.GetEngine().bDisableAILogging)
            {
                Outer.AILog_Internal("IsThereClearDirectFireAttackLaneFromGivenLoc - Not a clear Fire lane- Direct Fire point to target loc: " $ string(VSize(pointToCalcLaunchFrom - targetsOffsetForCals)));
            }
            return false;
        }
    }
    return bfoundLane;
}
