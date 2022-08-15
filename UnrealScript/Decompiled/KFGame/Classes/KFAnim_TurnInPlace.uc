/*******************************************************************************
 * KFAnim_TurnInPlace generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnim_TurnInPlace extends AnimNodeBlend
    native(Anim)
    hidecategories(Object,Object,Object,Object);

struct native RotTransitionInfo
{
    var() float RotationOffset;
    var() name TransName;

    structdefaultproperties
    {
        RotationOffset=0
        TransName=None
    }
};

var const transient bool bInitialized;
/**  
 *If TRUE, this node will try to delay his parent from blending to another child,
 * So the turn in place animation can play fully.
 */
var() bool bDelayBlendOutToPlayAnim;
var const bool bPlayingTurnTransition;
var const transient int LastPawnYaw;
var const transient float PawnRotationRate;
/** Current Yaw offset between camera and Pawn */
var() transient int YawOffset;
var const transient KFPawn PawnOwner;
var const transient Actor CachedBase;
var() array<RotTransitionInfo> RotTransitions;
var() float TransitionBlendInTime;
var const int CurrentTransitionIndex;
var() float TransitionThresholdAngle;
var duplicatetransient array<KFAnimSeq_TurnInPlace> PlayerNodes;

// Export UKFAnim_TurnInPlace::execResetRotation(FFrame&, void* const)
native simulated function ResetRotation();

defaultproperties
{
    RotTransitions(0)=(RotationOffset=16384,TransName=Rt_90)
    RotTransitions(1)=(RotationOffset=32768,TransName=Rt_180)
    RotTransitions(2)=(RotationOffset=-16384,TransName=Lt_90)
    RotTransitions(3)=(RotationOffset=-32768,TransName=Lt_180)
    TransitionBlendInTime=0.15
    TransitionThresholdAngle=4096
    Children=/* Array type was not detected. */
    BlendType=AlphaBlendType.ABT_Cubic
    CategoryDesc="TurnInPlace"
}