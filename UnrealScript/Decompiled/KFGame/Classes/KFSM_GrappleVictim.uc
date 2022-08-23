/*******************************************************************************
 * KFSM_GrappleVictim generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_GrappleVictim extends KFSM_InteractionPawnFollower;

var transient KFPlayerController OwnerController;
var AkEvent GrabbedSoundModeStartEvent;
var AkEvent GrabbedSoundModeEndEvent;
var float GrabVictimCooldownTime;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFPawn_Human KFPH;
    local KFGameInfo KFGI;

    super.SpecialMoveStarted(bForced, PrevMove);
    OwnerController = KFPlayerController(PawnOwner.Controller);
    if(OwnerController != none)
    {
        SetGrabEffect(OwnerController, true);
        if(OwnerController.IsLocalController())
        {
            OwnerController.PostAkEvent(GrabbedSoundModeStartEvent,,, true);
            if(bDisableLook || !OwnerController.bSkipNonCriticalForceLookAt)
            {
                OwnerController.SetForceLookAtPawn(Leader);
            }
        }
    }
    if(PawnOwner.Role == ROLE_Authority)
    {
        KFPH = KFPawn_Human(PawnOwner);
        if(KFPH != none)
        {
            KFGI = KFGameInfo(KFPH.WorldInfo.Game);
            if((KFGI != none) && KFGI.DialogManager != none)
            {
                KFGI.DialogManager.PlayPlayerGrabbedDialog(KFPH);
            }
        }
    }
    KFPOwner.ShouldCrouch(false);
    if(KFPOwner.bIsCrouched)
    {
        KFPOwner.ForceUnCrouch();
    }
    KFPOwner.bCanCrouch = false;
    KFPOwner.bCanJump = false;
    KFPOwner.bJumpCapable = false;
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    if(OwnerController != none)
    {
        OwnerController.SetForceLookAtPawn(none);
        SetGrabEffect(OwnerController, false);
        if(OwnerController.IsLocalController())
        {
            OwnerController.PostAkEvent(GrabbedSoundModeEndEvent);
        }
    }
    if(PawnOwner.Role == ROLE_Authority)
    {
        KFPOwner.SetWeakGrabCoolDown(GrabVictimCooldownTime);
    }
    KFPOwner.bCanCrouch = KFPOwner.default.bCanCrouch;
    KFPOwner.bCanJump = KFPOwner.default.bCanJump;
    KFPOwner.bJumpCapable = KFPOwner.default.bJumpCapable;
}

function SetGrabEffect(KFPlayerController KFPC, bool bValue)
{
    KFPC.SetGrabEffect(bValue, (Leader != none) && Leader.IsHumanControlled());
}

defaultproperties
{
    GrabbedSoundModeStartEvent=AkEvent'WW_UI_PlayerCharacter.Play_Grab_Start'
    GrabbedSoundModeEndEvent=AkEvent'WW_UI_PlayerCharacter.Play_Grab_Stop'
    GrabVictimCooldownTime=5
    bAllowThirdPersonWeaponAnims=true
    bDisableMovement=true
    Handle=SM_GrappleVictim
}