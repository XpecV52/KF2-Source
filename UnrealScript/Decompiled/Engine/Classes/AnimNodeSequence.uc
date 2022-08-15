/*******************************************************************************
 * AnimNodeSequence generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AnimNodeSequence extends AnimNode
    native(Anim)
    hidecategories(Object,Object,Object);

enum ERootBoneAxis
{
    RBA_Default,
    RBA_Discard,
    RBA_Translate,
    RBA_MAX
};

enum ERootRotationOption
{
    RRO_Default,
    RRO_Discard,
    RRO_Extract,
    RRO_MAX
};

/** This name will be looked for in all AnimSet's specified in the AnimSets array in the SkeletalMeshComponent. */
var() const name AnimSeqName;
/** Speed at which the animation will be played back. Multiplied by the RateScale in the AnimSequence. Default is 1.0 */
var() float Rate;
/** Whether this animation is currently playing ie. if the CurrentTime will be advanced when Tick is called. */
var() bool bPlaying;
/** If animation is looping. If false, animation will stop when it reaches end, otherwise will continue from beginning. */
var() bool bLooping;
/** Should this node call the OnAnimEnd event on its parent Actor when it reaches the end and stops. */
var() bool bCauseActorAnimEnd;
/** Should this node call the OnAnimPlay event on its parent Actor when PlayAnim is called on it. */
var() bool bCauseActorAnimPlay;
/** Always return a zero rotation (unit quaternion) for the root bone of this animation. */
var() bool bZeroRootRotation;
/** Always return root bone translation at the origin. */
var() bool bZeroRootTranslation;
/** if TRUE, don't display a warning when animation is not found. */
var() bool bDisableWarningWhenAnimNotFound;
/** Whether any notifies in the animation sequence should be executed for this node. */
var() bool bNoNotifies;
/** Forces the skeletal mesh into the ref pose by setting bForceRespose on the skelmesh comp when not playing. (Optimization) */
var() bool bForceRefposeWhenNotPlaying;
var bool bIsIssuingNotifies;
/** If TRUE, this node can never be a synchronization master node, always slave. */
var(Group) bool bForceAlwaysSlave;
/**  
 *TRUE by default. This node can be synchronized with others, when part of a SynchGroup. 
 * Set to FALSE if node shouldn't be synchronized, but still part of notification group.
 */
var(Group) const bool bSynchronize;
/** Reverse synchronization. Go in opposite direction. */
var(Group) const bool bReverseSync;
/** Display time line slider */
var(Display) bool bShowTimeLineSlider;
/** True to loop the CameraAnim, false for a one-off. */
var(Camera) bool bLoopCameraAnim;
/** True to randomize the CameraAnims start position, so it doesn't look the same every time.  Ignored if bLoopCameraAnim is false. */
var(Camera) bool bRandomizeCameraAnimLoopStartTime;
var const bool bEditorOnlyAddRefPoseToAdditiveAnimation;
var transient bool bCheckForFinishAnimEarly;
var transient bool bBlendingOut;
/** Current position (in seconds) */
var() const float CurrentTime;
var const transient float PreviousTime;
var const transient float EndTime;
var const transient AnimSequence AnimSeq;
var const transient int AnimLinkupIndex;
/**  
 *Total weight that this node must be at in the final blend for notifies to be executed.
 * This is ignored when the node is part of a group.
 */
var() float NotifyWeightThreshold;
/** name of group this node belongs to */
var(Group) const name SynchGroupName;
/** Relative position offset. */
var(Group) float SynchPosOffset;
/** Reference to the CameraAnim to play in conjunction with this animation. */
var(Camera) CameraAnim CameraAnim;
var transient CameraAnimInst ActiveCameraAnimInstance;
/** "Intensity" multiplier applied to the camera anim. */
var(Camera) float CameraAnimScale;
/** How fast to playback the camera anim. */
var(Camera) float CameraAnimPlayRate;
/** How long to blend in the camera anim. */
var(Camera) float CameraAnimBlendInTime;
/** How long to blend out the camera anim. */
var(Camera) float CameraAnimBlendOutTime;
/** Root Motion Rotation. */
var() const AnimNodeSequence.ERootBoneAxis RootBoneOption[3];
/**  
 *EDITOR ONLY
 * Add Ref Pose to Additive Animation, so it can be viewed fully into the AnimSetViewer.
 */
var() const AnimNodeSequence.ERootRotationOption RootRotationOption[3];
var const transient array<SkelControlBase> MetaDataSkelControlList;

// Export UAnimNodeSequence::execSetAnim(FFrame&, void* const)
native function SetAnim(name Sequence);

// Export UAnimNodeSequence::execPlayAnim(FFrame&, void* const)
native function PlayAnim(optional bool bLoop, optional float InRate, optional float StartTime)
{
    bLoop = false;
    InRate = 1;
    StartTime = 0;                    
}

// Export UAnimNodeSequence::execStopAnim(FFrame&, void* const)
native function StopAnim();

// Export UAnimNodeSequence::execReplayAnim(FFrame&, void* const)
native function ReplayAnim();

// Export UAnimNodeSequence::execSetPosition(FFrame&, void* const)
native function SetPosition(float NewTime, bool bFireNotifies);

// Export UAnimNodeSequence::execGetNormalizedPosition(FFrame&, void* const)
native function float GetNormalizedPosition();

// Export UAnimNodeSequence::execFindGroupRelativePosition(FFrame&, void* const)
native function float FindGroupRelativePosition(float GroupRelativePosition);

// Export UAnimNodeSequence::execFindGroupPosition(FFrame&, void* const)
native function float FindGroupPosition(float GroupRelativePosition);

// Export UAnimNodeSequence::execGetGroupRelativePosition(FFrame&, void* const)
native function float GetGroupRelativePosition();

// Export UAnimNodeSequence::execGetGlobalPlayRate(FFrame&, void* const)
native function float GetGlobalPlayRate();

// Export UAnimNodeSequence::execGetAnimPlaybackLength(FFrame&, void* const)
native function float GetAnimPlaybackLength();

// Export UAnimNodeSequence::execGetTimeLeft(FFrame&, void* const)
native function float GetTimeLeft();

// Export UAnimNodeSequence::execSetRootBoneAxisOption(FFrame&, void* const)
native final function SetRootBoneAxisOption(optional AnimNodeSequence.ERootBoneAxis AxisX, optional AnimNodeSequence.ERootBoneAxis AxisY, optional AnimNodeSequence.ERootBoneAxis AxisZ)
{
    AxisX = 0;
    AxisY = 0;
    AxisZ = 0;                    
}

// Export UAnimNodeSequence::execSetRootBoneRotationOption(FFrame&, void* const)
native final function SetRootBoneRotationOption(optional AnimNodeSequence.ERootRotationOption AxisX, optional AnimNodeSequence.ERootRotationOption AxisY, optional AnimNodeSequence.ERootRotationOption AxisZ)
{
    AxisX = 0;
    AxisY = 0;
    AxisZ = 0;                    
}

defaultproperties
{
    Rate=1
    bSynchronize=true
    CameraAnimScale=1
    CameraAnimPlayRate=1
    CameraAnimBlendInTime=0.2
    CameraAnimBlendOutTime=0.2
}