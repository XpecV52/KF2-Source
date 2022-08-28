/*******************************************************************************
 * KFSeqEvent_LevelLoaded generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqEvent_LevelLoaded extends SeqEvent_LevelLoaded
    forcescriptorder(true)
    hidecategories(Object);

var bool bWaitingForGRI;

static event int GetObjClassVersion()
{
    return super.GetObjClassVersion() + 0;
}

event RegisterEvent()
{
    local WorldInfo WI;
    local KFGameReplicationInfo KFGRI;
    local array<int> ActivateIndices;

    super(SequenceEvent).RegisterEvent();
    WI = GetWorldInfo();
    if(WI == none)
    {
        return;
    }
    KFGRI = KFGameReplicationInfo(WI.GRI);
    if(KFGRI == none)
    {
        bWaitingForGRI = true;
        return;
    }
    ActivateIndices = KFGRI.GetKFSeqEventLevelLoadedIndices();
    if(ActivateIndices.Length == 0)
    {
        return;
    }
    CheckActivate(WI, none, false, ActivateIndices);
}

simulated function DoActivation();

defaultproperties
{
    OutputLinks(0)=(Links=none,LinkDesc="Loaded and Visible",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Beginning of Level",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(2)=(Links=none,LinkDesc="Level Reset",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(3)=(Links=none,LinkDesc="Loaded and Visible - Short",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(4)=(Links=none,LinkDesc="Loaded and Visible - Medium",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(5)=(Links=none,LinkDesc="Loaded and Visible - Long",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(6)=(Links=none,LinkDesc="Loaded and Visible - Endless",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    ObjCategory="KF"
}