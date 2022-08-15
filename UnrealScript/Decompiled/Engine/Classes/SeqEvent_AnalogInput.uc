/*******************************************************************************
 * SeqEvent_AnalogInput generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SeqEvent_AnalogInput extends SequenceEvent
    native(Sequence)
    hidecategories(Object);

/** Should the input be eaten by the event, or allowed to propagate to gameplay? */
var() bool bTrapInput;
/** -1 for any player, or an index of a specific player to restrict to */
var() int AllowedPlayerIndex;
/** The binding to listen to - this can be something like MouseX, XboxTypeS_LeftX, Tilt  - NOT aStrafe, aBaseX, etc */
var() array<name> InputNames;

defaultproperties
{
    bTrapInput=true
    AllowedPlayerIndex=-1
    MaxTriggerCount=0
    OutputLinks(0)=(Links=none,LinkDesc="Output",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'SeqVar_String',LinkedVariables=none,LinkDesc="Input Name",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(2)=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Float Value",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(3)=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Vector Value",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Analog Input"
    ObjCategory="Input"
}