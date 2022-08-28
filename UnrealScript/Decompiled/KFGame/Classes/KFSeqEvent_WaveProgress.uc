/*******************************************************************************
 * KFSeqEvent_WaveProgress generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqEvent_WaveProgress extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

/** How many zeds must be killed to trigger a "Zeds Killed" event */
var() const int ZedsKilledTrigger;
/** How many zeds must be remaining to trigger a "Zeds Remaining" event */
var() const int ZedsRemainingTrigger;
/** What percentage of zeds must be killed to trigger a "Wave Progress Pct" event */
var() const float WaveProgressPctTrigger;

function SetWaveProgress(int ZedsRemaining, int TotalZeds, Actor InOriginator)
{
    local int ZedsKilled;
    local float OldPct, NewPct;
    local array<int> OutputLinksToActivate;

    ZedsKilled = TotalZeds - ZedsRemaining;
    if(ZedsKilled == ZedsKilledTrigger)
    {
        OutputLinksToActivate.AddItem(0;
    }
    if(ZedsRemaining == ZedsRemainingTrigger)
    {
        OutputLinksToActivate.AddItem(1;
    }
    OldPct = 100 * (float(ZedsKilled - 1) / float(TotalZeds));
    NewPct = 100 * (float(ZedsKilled) / float(TotalZeds));
    if((OldPct < WaveProgressPctTrigger) && NewPct >= WaveProgressPctTrigger)
    {
        OutputLinksToActivate.AddItem(2;
    }
    if(OutputLinksToActivate.Length > 0)
    {
        CheckActivate(InOriginator, InOriginator,, OutputLinksToActivate);
    }
}

defaultproperties
{
    bPlayerOnly=false
    OutputLinks(0)=(Links=none,LinkDesc="Zeds Killed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Zeds Remaining",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(2)=(Links=none,LinkDesc="Wave Progress Pct",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    ObjName="Wave Progress Event"
}