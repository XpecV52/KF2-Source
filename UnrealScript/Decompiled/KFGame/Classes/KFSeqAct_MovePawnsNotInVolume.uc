/*******************************************************************************
 * KFSeqAct_MovePawnsNotInVolume generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_MovePawnsNotInVolume extends SequenceAction
    native(Sequence)
    forcescriptorder(true)
    hidecategories(Object);

/** If TRUE, will only process living players from an input object list containing players */
var() bool bOnlyLivingPlayers;
/** If TRUE, picks a random destination actor if there are multiple object inputs */
var() bool bRandomizeDestination;
/** If TRUE, checks to see if there is another pawn overlapping the actor before choosing it */
var() bool bCheckOverlap<EditCondition=!bRandomizeDestination>;
/** If TRUE, will set the pawn's rotation to the destination actor's rotation */
var() bool bSetRotation;
/** Should we fade in after teleporting? */
var(FadeIn) bool bFadeIn;
/** Should audio be faded as well */
var(FadeIn) bool bFadeAudio<EditCondition=bFadeIn>;
/** Color used to fade */
var(FadeIn) Color FadeColor<EditCondition=bFadeIn>;
/** The opacity that the camera will fade to */
var(FadeIn) float EndFadeOpacity<ClampMin=0.0|ClampMax=1.0|EditCondition=bFadeIn>;
/** How long to fade to FadeOpacity from the camera's current fade opacity */
var(FadeIn) float FadeTime<ClampMin=0.0|EditCondition=bFadeIn>;
var native transient Vector2D FadeAlpha;

defaultproperties
{
    bOnlyLivingPlayers=true
    bCheckOverlap=true
    bSetRotation=true
    bFadeIn=true
    FadeColor=(B=255,G=255,R=255,A=255)
    FadeTime=1
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Pawn",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Volume",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Destination Actor",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Move Pawns Not In Volume"
    ObjCategory="Pawn"
}