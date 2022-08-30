/*******************************************************************************
 * KFSeqEvent_HoldZoneProgress generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqEvent_HoldZoneProgress extends KFSeqEvent_ObjectiveProgress
    forcescriptorder(true)
    hidecategories(Object);

enum EHoldZoneProgressEvent
{
    EHoldZoneProgressEvent_ZoneDisabled,
    EHoldZoneProgressEvent_ZoneEnabled,
    EHoldZoneProgressEvent_MAX
};

defaultproperties
{
    OutputLinkText="Progress Pct"
    ProgressOutputStartIndex=2
    OutputLinks(0)=(Links=none,LinkDesc="Zone Disabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Zone Enabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    ObjName="Hold Zone Progress"
}