/*******************************************************************************
 * SeqAct_Interp generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqAct_Interp extends SeqAct_Latent
    native(Sequence)
    config(Engine)
    hidecategories(Object);

struct native export SavedTransform
{
    var Vector Location;
    var Rotator Rotation;

    structdefaultproperties
    {
        Location=(X=0,Y=0,Z=0)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
    }
};

struct native CameraCutInfo
{
    var Vector Location;
    var float TimeStamp;

    structdefaultproperties
    {
        Location=(X=0,Y=0,Z=0)
        TimeStamp=0
    }
};

var private noimport native const transient map<0, 0> SavedActorTransforms;
var private noimport native const transient map<0, 0> SavedActorVisibilities;
/** Time multiplier for playback. */
var() float PlayRate;
var float Position;
/** Time position to always start at if bForceStartPos is set to TRUE. */
var() float ForceStartPosition;
var bool bIsPlaying;
var bool bPaused;
var transient bool bIsBeingEdited;
/**  
 *If sequence should pop back to beginning when finished.
 *       Note, if true, will never get Completed/Reversed events - sequence must be explicitly Stopped.
 */
var() bool bLooping;
/** If true, sequence will rewind itself back to the start each time the Play input is activated. */
var() bool bRewindOnPlay;
/**  
 *If true, when rewinding this interpolation, reset the 'initial positions' of any RelateToInitial movements to the current location.
 *       This allows the next loop of movement to proceed from the current locations.
 */
var() bool bNoResetOnRewind;
/**  
 *Only used if bRewindOnPlay if true. Defines what should happen if the Play input is activated while currently playing.
 *       If true, hitting Play while currently playing will pop the position back to the start and begin playback over again.
 *       If false, hitting Play while currently playing will do nothing.
 */
var() bool bRewindIfAlreadyPlaying;
var bool bReversePlayback;
/** Whether this action should be initialised and moved to the 'path building time' when building paths. */
var() bool bInterpForPathBuilding;
/** Lets you force the sequence to always start at ForceStartPosition */
var() bool bForceStartPos;
/** If true, disables the realtime radio effect */
var() bool bDisableRadioFilter;
/**  
 *Indicates that this interpolation does not affect gameplay. This means that:
 * -it is not replicated via MatineeActor
 * -it is not ticked if no affected Actors are visible
 * -on dedicated servers, it is completely ignored
 */
var() bool bClientSideOnly;
/** if bClientSideOnly is true, whether this matinee should be completely skipped if none of the affected Actors are visible */
var() bool bSkipUpdateIfNotVisible;
/** Lets you skip the matinee with the CANCELMATINEE exec command. Triggers all events to the end along the way. */
var() bool bIsSkippable;
var transient bool bShouldShowGore;
/** Cover linked to this matinee that should be updated once path building time has been played */
var() array<CoverLink> LinkedCover;
var export InterpData InterpData;
var array<InterpGroupInst> GroupInst;
var const class<MatineeActor> ReplicatedActorClass;
var const transient MatineeActor ReplicatedActor;
/** Preferred local viewport number (when split screen is active) the director track should associate with, or zero for 'all'. */
var() int PreferredSplitScreenNum;
var transient array<CameraCutInfo> CameraCuts;
var float TerminationTime;
/**  
 *Rendering overrides of this matinee, which will be used if the matinee has a director track.
 * Cinematics add a bunch of rendering cost with their lighting and shadowing, so we need to disable some features to make room for that.
 */
var() globalconfig RenderingPerformanceOverrides RenderingOverrides;
/** Constant camera anim to add to matinee, set to 1 (future we could have more) */
var(ConstantCameraAnim) byte ConstantCameraAnim;
var(ConstantCameraAnim) float ConstantCameraAnimRate;

// Export USeqAct_Interp::execSetPosition(FFrame&, void* const)
native final function SetPosition(float NewPosition, optional bool bJump)
{
    bJump = false;                
}

// Export USeqAct_Interp::execStop(FFrame&, void* const)
native final function Stop();

// Export USeqAct_Interp::execAddPlayerToDirectorTracks(FFrame&, void* const)
native final function AddPlayerToDirectorTracks(PlayerController PC);

function Reset()
{
    SetPosition(0, false);
    if(bActive)
    {
        InputLinks[2].bHasImpulse = true;
    }
}

static event int GetObjClassVersion()
{
    return super(SequenceObject).GetObjClassVersion() + 1;
}

defaultproperties
{
    PlayRate=1
    ReplicatedActorClass=Class'MatineeActor'
    RenderingOverrides=(bAllowAmbientOcclusion=false,bAllowDominantWholeSceneDynamicShadows=false,bAllowMotionBlurSkinning=false,bAllowTemporalAA=true,bAllowLightShafts=true)
    ConstantCameraAnimRate=4
    InputLinks(0)=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Reverse",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(2)=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(3)=(LinkDesc="Pause",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(4)=(LinkDesc="Change Dir",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks(0)=(Links=none,LinkDesc="Completed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Reversed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'InterpData',LinkedVariables=none,LinkDesc="Data",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Matinee"
}