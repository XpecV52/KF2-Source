/*******************************************************************************
 * KFSM_Husk_Suicide generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_Husk_Suicide extends KFSM_PlaySingleAnim;

var protected bool bSuicideAnimFinished;
var export editinline array<export editinline ParticleSystemComponent> AnimFlamePSCs;

protected function bool InternalCanDoSpecialMove()
{
    if(KFPOwner.IsHumanControlled())
    {
        return (KFPOwner.IsAliveAndWell() && !KFPOwner.IsImpaired()) && !KFPOwner.IsIncapacitated();
    }
    if(((AIOwner == none) || AIOwner.MyKFPawn == none) || AIOwner.Enemy == none)
    {
        return false;
    }
    if(!KFPOwner.IsCombatCapable())
    {
        return false;
    }
    return super(KFSpecialMove).InternalCanDoSpecialMove();
}

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    bSuicideAnimFinished = false;
    AnimFlamePSCs.Length = 0;
    super.SpecialMoveStarted(bForced, PrevMove);
}

function OnAnimNotifyParticleSystemSpawned(const AnimNotify_PlayParticleEffect AnimNotifyData, ParticleSystemComponent PSC)
{
    local AnimSequence AnimSeq;

    if(AnimNotifyData.Outer != none)
    {
        AnimSeq = AnimSequence(AnimNotifyData.Outer);
        if(((AnimSeq != none) && string(AnimSeq.SequenceName) ~= string(AnimName)) && InStr(string(PSC.Template.Name), "suicide",, true) != -1)
        {
            AnimFlamePSCs.AddItem(PSC;
        }
    }
}

function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    bSuicideAnimFinished = true;
    super.AnimEndNotify(SeqNode, PlayedTime, ExcessTime);
}

simulated function SpecialMoveEnded(name PrevMove, name NextMove)
{
    local editinline ParticleSystemComponent PSC;

    if(KFPOwner.bLogSpecialMove)
    {
        LogInternal(string(self) $ " SpecialMoveEnded");
    }
    if(bSuicideAnimFinished && !bPendingStopFire)
    {
        KFPawn_ZedHusk(PawnOwner).TriggerExplosion();        
    }
    else
    {
        if(AnimFlamePSCs.Length > 0)
        {
            foreach AnimFlamePSCs(PSC,)
            {
                PSC.SetActive(false);                
            }            
        }
    }
    AnimFlamePSCs.Length = 0;
    super.SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
    AnimName=Atk_Suicide_V1
    bUseRootMotion=true
    bPawnRotationLocked=true
    bShouldDeferToPostTick=true
    Handle=KFSM_HuskSuicide
}