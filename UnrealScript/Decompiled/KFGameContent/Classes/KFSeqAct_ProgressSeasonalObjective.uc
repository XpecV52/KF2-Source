/*******************************************************************************
 * KFSeqAct_ProgressSeasonalObjective generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_ProgressSeasonalObjective extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

/** Objective index for the event this is tied to */
var() int ObjectiveIndex;
/** Index of the event this is tied to */
var() int EventIndex;
/** Increment progress for all players? */
var() bool bAllPlayersAffected;

event Activated()
{
    local KFPlayerController KFPC;
    local bool bIsObjectiveDataValid;

    bIsObjectiveDataValid = (((ObjectiveIndex >= 0) && ObjectiveIndex < 5) && EventIndex > 0) && EventIndex < 5;
    if(bAllPlayersAffected)
    {
        foreach GetWorldInfo().AllControllers(Class'KFPlayerController', KFPC)
        {
            if(bIsObjectiveDataValid)
            {
                KFPC.ClientOnTryCompleteObjective(ObjectiveIndex, EventIndex);
            }            
        }                
    }
    else
    {
        KFPC = KFPlayerController(GetWorldInfo().GetALocalPlayerController());
        if(bIsObjectiveDataValid)
        {
            KFPC.ClientOnTryCompleteObjective(ObjectiveIndex, EventIndex);
        }
    }
}

defaultproperties
{
    ObjectiveIndex=-1
    EventIndex=-1
    bAllPlayersAffected=true
    ObjName="Progress Seasonal Objective"
    ObjCategory="Killing Floor"
}