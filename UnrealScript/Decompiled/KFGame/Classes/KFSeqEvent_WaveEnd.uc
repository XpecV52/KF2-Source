/*******************************************************************************
 * KFSeqEvent_WaveEnd generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqEvent_WaveEnd extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

function SetWaveNum(int WaveNum, int WaveMax)
{
    local SeqVar_Int SeqInt;
    local SeqVar_Float SeqFloat;

    foreach LinkedVariables(Class'SeqVar_Int', SeqInt, "Wave Number")
    {
        SeqInt.IntValue = WaveNum;        
    }    
    foreach LinkedVariables(Class'SeqVar_Int', SeqInt, "Wave Max")
    {
        SeqInt.IntValue = WaveMax;        
    }    
    foreach LinkedVariables(Class'SeqVar_Float', SeqFloat, "Wave Pct Complete")
    {
        SeqFloat.FloatValue = 100 * (float(WaveNum) / float(WaveMax));        
    }    
}

defaultproperties
{
    bPlayerOnly=false
    OutputLinks(0)=(Links=none,LinkDesc="Normal Wave",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Boss Wave",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Wave Number",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Wave Max",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Wave Pct Complete",LinkVar=None,PropertyName=None,bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Wave Ended Event"
}