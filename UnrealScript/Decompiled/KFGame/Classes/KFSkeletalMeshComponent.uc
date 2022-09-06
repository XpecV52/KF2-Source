/*******************************************************************************
 * KFSkeletalMeshComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSkeletalMeshComponent extends SkeletalMeshComponent
    native
    editinlinenew
    hidecategories(Object);

var BoneAtom CachedExtractedRootMotionDelta;
var int bCachedHasRootMotion;
var bool bNeedsProcessRootMotion;
var bool bForceLoadTextures;
var bool bPendingDeferredWork;
/** This changes the FOV used for rendering the skeletal mesh component. A value of 0 means to use the default. */
var() const float FOV;
var float ClearStreamingTime;
/**  
 *If > 0, ensure the DeltaTime does not go above this value.
 * Useful when issuing tick notifies (e.g. Hitbox collision) is critical
 */
var() float MinTickTimeStep;
/** Scale to use when doing line traces against the head bone */
var() float HeadBoneScale;

simulated event PreloadTextures(bool bForcePreload, float ClearTime)
{
    local int Idx;

    bForceLoadTextures = bForcePreload;
    ClearStreamingTime = ClearTime;
    Idx = 0;
    J0x33:

    if(Idx < Materials.Length)
    {
        if(Materials[Idx] != none)
        {
            Materials[Idx].SetForceMipLevelsToBeResident(true, bForcePreload, -1);
        }
        ++ Idx;
        goto J0x33;
    }
}

// Export UKFSkeletalMeshComponent::execSetFOV(FFrame&, void* const)
native final function SetFOV(float NewFOV);

event bool PlayParticleEffect(const AnimNotify_PlayParticleEffect AnimNotifyData)
{
    local editinline KFParticleSystemComponent PSC;

    if(((DepthPriorityGroup == 2) && AnimNotifyData.bAttach) && !AnimNotifyData.bIsExtremeContent)
    {
        PSC = new (self) Class'KFParticleSystemComponent';
        PSC.SetTemplate(AnimNotifyData.PSTemplate);
        PSC.SetDepthPriorityGroup(2);
        PSC.SetFOV(FOV);
        if(AnimNotifyData.bUsePostUpdateWorkTickGroup)
        {
            PSC.SetTickGroup(4);
        }
        if(AnimNotifyData.SocketName != 'None')
        {
            AttachComponentToSocket(PSC, AnimNotifyData.SocketName);            
        }
        else
        {
            if(AnimNotifyData.BoneName != 'None')
            {
                AttachComponent(PSC, AnimNotifyData.BoneName);
            }
        }
        PSC.ActivateSystem(true);
        PSC.__OnSystemFinished__Delegate = SkelMeshCompOnParticleSystemFinished;
        if((PSC != none) && Owner != none)
        {
            Owner.OnAnimNotifyParticleSystemSpawned(AnimNotifyData, PSC);
        }
        return true;
    }
    return super.PlayParticleEffect(AnimNotifyData);
}

final function float GetAnimInterruptTime(name AnimSeqName)
{
    return GetAnimNotifyTime(AnimSeqName, Class'KFAnimNotify_Interrupt');
}

final function float GetReloadAmmoTime(name AnimSeqName)
{
    return GetAnimNotifyTime(AnimSeqName, Class'KFAnimNotify_ReloadAmmo');
}

final function float GetAnimNotifyTime(name AnimSeqName, class<AnimNotify> NotifyClass)
{
    local int I;
    local AnimSequence AnimSeq;

    AnimSeq = FindAnimSequence(AnimSeqName);
    if((AnimSeq == none) || AnimSeq.RateScale <= 0)
    {
        return 0;
    }
    I = 0;
    J0x67:

    if(I < AnimSeq.Notifies.Length)
    {
        if(AnimSeq.Notifies[I].Notify == none)
        {            
        }
        else
        {
            if(ClassIsChildOf(AnimSeq.Notifies[I].Notify.Class, NotifyClass))
            {
                return AnimSeq.Notifies[I].Time / AnimSeq.RateScale;
            }
        }
        ++ I;
        goto J0x67;
    }
    return AnimSeq.SequenceLength / AnimSeq.RateScale;
}

defaultproperties
{
    HeadBoneScale=1
    ReplacementPrimitive=none
}