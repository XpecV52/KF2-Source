/*******************************************************************************
 * KFAfflictionAdvanced generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAfflictionAdvanced extends KFAfflictionBase
    abstract;

var float Duration;
var bool bIsActive;
var protected name EffectSocketName;

function Init(KFPawn P, KFAfflictionManager.EAfflictionType Type, KFPerk InstigatorPerk)
{
    super.Init(P, Type, InstigatorPerk);
    Duration = P.IncapSettings[Type].Duration;
}

function Activate()
{
    if(!bIsActive)
    {
        super.Activate();
        PawnOwner.SetTimer(Duration, false, 'DeActivate', self);
        bIsActive = true;
    }
}

function DeActivate()
{
    bIsActive = false;
    if(bDebug)
    {
        LogInternal(string(self) @ "was deactivaed");
    }
}

function ShutDown()
{
    if(bIsActive)
    {
        DeActivate();
        PawnOwner.ClearTimer('DeActivate', self);
        if(bDebug)
        {
            LogInternal(string(self) @ "shutdown on owner death");
        }
    }
}

defaultproperties
{
    EffectSocketName=hips
}