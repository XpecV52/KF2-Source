/*******************************************************************************
 * KFAnim_Movement generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFAnim_Movement extends AnimNodeBlendBySpeed
    native(Anim)
    hidecategories(Object,Object,Object,Object);

/** Scale Animations Play Rate using Constraints as base speed */
var() bool bScaleAnimPlayRateBySpeed;
/** When moving the slider, keep nodes with same property in sync. */
var() bool bSynchronizeNodesInEditor;
/** If set, calculate speed from owner's base instead of owner */
var() bool bUseOwnersBase;
/** If set, ignore z-axis velocity/acceleration */
var() bool bUse2DMovement;
/** Position of the movement cycle when starting to move */
var() float MoveCycleFirstStepStartPosition;
var const transient AnimTree RootNode;
var() name SynchGroupName;

// Export UKFAnim_Movement::execSetActiveChild(FFrame&, void* const)
native function SetActiveChild(int ChildIndex, float BlendTime);

defaultproperties
{
    bSynchronizeNodesInEditor=true
    bUse2DMovement=true
    MoveCycleFirstStepStartPosition=0.3
    SynchGroupName=RunWalk
    BlendUpTime=0.3
    BlendDownTime=0.3
    Constraints=/* Array type was not detected. */
    Children=/* Array type was not detected. */
}