/*******************************************************************************
 * KFSeqAct_DrawCountText generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_DrawCountText extends SequenceAction
    native
    forcescriptorder(true)
    hidecategories(Object);

var(Message) string Message;
var() class<KFKismetMapLocalization> MapLocalizationClass;
var() float DisplayTimeSeconds;
var() Vector2D MessageFontScale;
var() Vector2D MessageOffset;
var() Color MessageColor;
var bool bDisplayOnObject;
var KismetDrawTextInfo DrawTextInfo;

static event int GetObjClassVersion()
{
    return super(SequenceObject).GetObjClassVersion() + 2;
}

event Initialize()
{
    DrawTextInfo.MessageText = Message;
    DrawTextInfo.MessageFont = GetFontText();
    DrawTextInfo.MessageFontScale = MessageFontScale;
    DrawTextInfo.MessageOffset = MessageOffset;
    DrawTextInfo.MessageColor = MessageColor;
}

simulated function Font GetFontText()
{
    return MapLocalizationClass.static.GetFont();
}

defaultproperties
{
    DisplayTimeSeconds=-1
    MessageFontScale=(X=1,Y=1)
    MessageColor=(B=255,G=255,R=255,A=255)
    bLatentExecution=true
    bAutoActivateOutputLinks=false
    InputLinks(0)=(LinkDesc="Show",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Hide",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar=None,PropertyName=Targets,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkedVariables=none,LinkDesc="String",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=true,MinVars=0,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Draw Count Text"
    ObjCategory="Killing Floor"
}