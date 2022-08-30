/*******************************************************************************
 * KFSeqAct_RestartScriptedPawn generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_RestartScriptedPawn extends SeqAct_Latent
    forcescriptorder(true)
    hidecategories(Object);

/** Whether pawn should be spawned in an inactive state */
var() bool bSpawnInactivePawn;

event Activated()
{
    local SequenceVariable SeqVar;
    local SeqVar_Object ObjVar;
    local KFScriptedPawnSpawner OldPawnSpawner, NewPawnSpawner;

    if(InputLinks[0].bHasImpulse)
    {
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "Old KF Scripted Pawn Spawner")
        {
            OldPawnSpawner = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
            break;            
        }        
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "New KF Scripted Pawn Spawner")
        {
            NewPawnSpawner = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
            break;            
        }        
        if((OldPawnSpawner == none) || NewPawnSpawner == none)
        {
            return;
        }
        foreach LinkedVariables(Class'SequenceVariable', SeqVar, "Set Initial Health From")
        {
            if(SeqVar_Float(SeqVar) != none)
            {
                NewPawnSpawner.PawnHealth = SeqVar_Float(SeqVar).FloatValue;
                break;
            }
            WarnInternal(string(self) $ "::Activated - 'Set Initial Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
            break;            
        }        
        foreach LinkedVariables(Class'SequenceVariable', SeqVar, "Set Maximum Health From")
        {
            if(SeqVar_Float(SeqVar) != none)
            {
                NewPawnSpawner.PawnHealthMax = SeqVar_Float(SeqVar).FloatValue;
                break;
            }
            WarnInternal(string(self) $ "::Activated - 'Set Maximum Health From' not set to a valid object (Float or KFScriptedPawnSpawner)");
            break;            
        }        
        NewPawnSpawner.StartPawn(bSpawnInactivePawn, OldPawnSpawner.Pawn);
        LatentActors.AddItem(NewPawnSpawner;
        NewPawnSpawner.LatentActions.AddItem(self;
        bAborted = false;
    }
}

function CheckPawnFinished(Pawn P)
{
    local SeqVar_Object ObjVar;
    local KFScriptedPawnSpawner PawnStart;

    foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "New KF Scripted Pawn Spawner")
    {
        PawnStart = KFScriptedPawnSpawner(ObjVar.GetObjectValue());
        break;        
    }    
    if(PawnStart != none)
    {
        if(PawnStart.Pawn == P)
        {
            if(!PawnStart.Pawn.IsAliveAndWell())
            {
                bAborted = true;
            }
            PawnStart.LatentActions.RemoveItem(self;
            LatentActors.RemoveItem(PawnStart;
        }
    }
}

defaultproperties
{
    bCallHandler=false
    bAutoActivateOutputLinks=false
    InputLinks(0)=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks(0)=(Links=none,LinkDesc="Finish",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    OutputLinks(1)=(Links=none,LinkDesc="Fail",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0,bIsActivated=false)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Old KF Scripted Pawn Spawner",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="New KF Scripted Pawn Spawner",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(2)=(ExpectedType=Class'Engine.SequenceVariable',LinkedVariables=none,LinkDesc="Set Initial Health From",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(3)=(ExpectedType=Class'Engine.SequenceVariable',LinkedVariables=none,LinkDesc="Set Maximum Health From",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Restart Existing Scripted Pawn"
    ObjCategory="Killing Floor"
}