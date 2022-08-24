/*******************************************************************************
 * KFSM_PlayerSiren_VortexVictim generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSM_PlayerSiren_VortexVictim extends KFSM_GrappleVictim;

/** Animation to play */
var() name AnimName;
var const localized string VortexGrabTeamWarningMsg;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
    local KFPlayerController KFPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    KFPOwner.PlayBodyAnim(AnimName, 0, 1, 0.33, 0.33, true);
    if(KFPOwner.WorldInfo.NetMode != NM_DedicatedServer)
    {
        KFPC = KFPlayerController(KFPOwner.WorldInfo.GetALocalPlayerController());
        if(((KFPC != none) && KFPC.Pawn != none) && KFPC.Pawn.IsAliveAndWell())
        {
            KFPC.myGfxHUD.ShowNonCriticalMessage(Repl(VortexGrabTeamWarningMsg, "%x%", KFPOwner.PlayerReplicationInfo.PlayerName));
        }
    }
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
    KFPOwner.StopBodyAnim(0, 0.33);
    KFPOwner.ExclusiveTargetingController = none;
}

function SetGrabEffect(KFPlayerController KFPC, bool bValue)
{
    KFPC.SetGrabEffect(bValue, true, true);
}

defaultproperties
{
    AnimName=Grabbed_LifeDrain_V1
    VortexGrabTeamWarningMsg="%x% is trapped by a Siren!"
    bAllowThirdPersonWeaponAnims=false
    bLockPawnRotation=true
    bDisableLook=true
    bDisableWeaponInteraction=true
    Handle=KFSM_PlayerSiren_VortexVictim
}