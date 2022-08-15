/*******************************************************************************
 * SequenceEvent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SequenceEvent extends SequenceOp
    abstract
    native(Sequence)
    hidecategories(Object);

var array<SequenceEvent> DuplicateEvts;
var Actor Originator;
var Actor Instigator;
var float ActivationTime;
var int TriggerCount;
/** How many times can this event be activated, 0 for infinite */
var() int MaxTriggerCount;
/** Delay between allowed activations */
var() float ReTriggerDelay;
/** Is this event currently enabled? */
var() bool bEnabled;
/** Require this event to be activated by a player? */
var() bool bPlayerOnly;
var transient bool bRegistered;
/**  
 *if true, this event (and therefore all linked actions) is triggered on the client instead of the server
 * use for events that don't affect gameplay
 * @note: direct references to level placed actors used by client side events/actions require that the actors have
 * bStatic or bNoDelete set; otherwise the reference will be NULL on the client
 */
var() const bool bClientSideOnly;
/** Used by event managers (such as DialogueManager) to help filter out events that occur at same time */
var() byte Priority;
var int MaxWidth;

event RegisterEvent();

// Export USequenceEvent::execCheckActivate(FFrame&, void* const)
native final function bool CheckActivate(Actor InOriginator, Actor InInstigator, optional bool bTest, const optional out array<int> ActivateIndices, optional bool bPushTop);

function Reset()
{
    ActivationTime = 0;
    TriggerCount = 0;
    Instigator = none;
}

event Toggled();

defaultproperties
{
    MaxTriggerCount=1
    bEnabled=true
    bPlayerOnly=true
    bAutoActivateOutputLinks=false
    InputLinks=none
    VariableLinks(0)=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjColor=(B=0,G=0,R=255,A=255)
}