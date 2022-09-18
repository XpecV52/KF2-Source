/*******************************************************************************
 * KFSeqCond_IsWeeklyEvent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqCond_IsWeeklyEvent extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

var() int WeeklyIndex;

function Activated()
{
    local KFGameInfo KFGI;

    KFGI = KFGameInfo(GetWorldInfo().Game);
    if(KFGI != none)
    {
        if(((KFGI.MyKFGRI != none) && KFGI.MyKFGRI.bIsWeeklyMode) && Class'KFGameEngine'.static.GetWeeklyEventIndexMod() == WeeklyIndex)
        {
            OutputLinks[0].bHasImpulse = true;            
        }
        else
        {
            OutputLinks[1].bHasImpulse = true;
        }
    }
}

defaultproperties
{
    OutputLinks(0)=(Links=none,LinkDesc="True",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="False",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    ObjName="IsWeeklyEvent"
    ObjColor=(B=255,G=0,R=255,A=255)
}