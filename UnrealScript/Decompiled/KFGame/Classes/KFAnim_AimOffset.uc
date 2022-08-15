/*******************************************************************************
 * KFAnim_AimOffset generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnim_AimOffset extends AnimNodeAimOffset
    native(Anim)
    hidecategories(Object,Object,Object,Object);

enum EAimInput
{
    AI_PawnAimOffset,
    AI_VehicleAimOffset,
    AI_BasePawn,
    AI_CustomAimOffset,
    AI_MAX
};

var const transient KFPawn PawnOwner;
var duplicatetransient const KFAnim_TurnInPlace TurnInPlaceNode;
/** Asks to look up the InteractionPawn's aim. Used by hostages. */
var() bool bUseInteractionPawnAim;
/** Only update once when it becomes relevant */
var() bool bOnlyUpdateOnBecomeRelevant;
/** See if we want to shut down that aimoffset when reloading */
var() bool bTurnOffWhenReloadingWeapon;
var const transient bool bDoingWeaponReloadInterp;
var() float ReloadingBlendTime;
var const transient float ReloadingBlendTimeToGo;
var const transient Vector2D LastAimOffset;
var const transient Vector2D LastPostProcessedAimOffset;
var const transient float TurnAroundTimeToGo;
var() float TurnAroundBlendTime;
/** What we are using as our Aim input. */
var() editconst KFAnim_AimOffset.EAimInput AimInput;

defaultproperties
{
    ReloadingBlendTime=0.33
    TurnAroundBlendTime=0.42
}