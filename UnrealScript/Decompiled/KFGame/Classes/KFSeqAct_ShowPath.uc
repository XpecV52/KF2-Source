/*******************************************************************************
 * KFSeqAct_ShowPath generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSeqAct_ShowPath extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum eVolumeCheckType
{
    VCT_NONE,
    VCT_InVolume,
    VCT_NotInVolume,
    VCT_MAX
};

var transient bool bPathActive;
var transient KFReplicatedShowPathActor ReplicatedPathActor;
/**  
 *Leave at VCT_None to always show the path to all human players.
 * If this is set to VCT_InVolume, it will only show the path to players inside the linked volume.
 * If this is set to VCT_NotInVolume, it will only show the path to players NOT in the linked volume.
 */
var() KFSeqAct_ShowPath.eVolumeCheckType VolumeCheckType;
/** Team number to display path to. 0 = Survivors, 255 = Zeds */
var() byte TeamToDisplayPathTo;
var() ParticleSystem TrailParticleSystem;

event Activated()
{
    local SeqVar_Object ObjVar;
    local Actor Target;
    local Volume Volume;

    if(InputLinks[0].bHasImpulse)
    {
        bPathActive = true;        
    }
    else
    {
        if(InputLinks[1].bHasImpulse)
        {
            bPathActive = false;
            if((ReplicatedPathActor != none) && !ReplicatedPathActor.bDeleteMe)
            {
                ReplicatedPathActor.Destroy();
            }
            ReplicatedPathActor = none;
        }
    }
    if(bPathActive)
    {
        foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "Destination Actor")
        {
            Target = Actor(ObjVar.GetObjectValue());
            break;            
        }        
        if(Target == none)
        {
            bPathActive = false;
            return;
        }
        if(VolumeCheckType != 0)
        {
            foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "Volume")
            {
                Volume = Volume(ObjVar.GetObjectValue());
                break;                
            }            
        }
        ReplicatedPathActor = Class'WorldInfo'.static.GetWorldInfo().Spawn(Class'KFReplicatedShowPathActor', none);
        if(ReplicatedPathActor != none)
        {
            if(TrailParticleSystem != none)
            {
                ReplicatedPathActor.SetEmitterTemplate(TrailParticleSystem);
            }
            ReplicatedPathActor.SetPathTarget(Target, Volume, (((VolumeCheckType != 0) && Volume == none) ? 0 : VolumeCheckType), TeamToDisplayPathTo);            
        }
        else
        {
            bPathActive = false;
        }
    }
}

defaultproperties
{
    bCallHandler=false
    InputLinks(0)=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks(1)=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Destination Actor",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Volume",LinkVar=None,PropertyName=None,bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Display Path To Actor"
    ObjCategory="Killing Floor"
}