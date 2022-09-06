/*******************************************************************************
 * KFWeapAttach_CompoundBow generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_CompoundBow extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

const WeaponIdleAnim = 'Idle_master';
const WeaponIronIdleAnim = 'Idle_Iron_V1';
const WeaponFireLoopStartAnim = 'ShootLoop_Start';
const WeaponFireLoopAnim = 'ShootLoop';
const WeaponFireLoopIronAnim = 'ShootLoop_Sight';
const WeaponFireEndLoopAnim = 'ShootLoop_End';
const CH_WeapondleAnim = 'Idle_CH_V1';
const CH_WeaponFireStartAnim = 'ShootLoop_Start_CH';
const CH_WeaponFireLoopAnim = 'ShootLoop_CH';
const CH_WeaponFireLoopIronAnim = 'ShootLoop_Sight_CH';
const CH_WeaponFireEndLoopAnim = 'ShootLoop_End_CH';
const ArrowSocketName = 'RW_Weapon';

/** The static mesh for arrow */
var() export editinline StaticMeshComponent ArrowSMC;
var ParticleSystem CryoProjectileEffectOn;
var ParticleSystem CryoProjectileEffectOff;
var() export editinline ParticleSystemComponent CryoProjectilePSC;
var bool bCharging;

simulated function StartFire()
{
    local KFPawn_Human P;
    local name WeaponLoopAnimName;

    P = KFPawn_Human(Owner);
    bCharging = true;
    WeaponLoopAnimName = GetWeaponFireLoopAnim(P);
    if(P.bIsCrouched)
    {
        StartLoopingAnim(P, WeaponLoopAnimName, 'ShootLoop_Start_CH', 'None', true);        
    }
    else
    {
        StartLoopingAnim(P, WeaponLoopAnimName, 'ShootLoop_Start', 'None', true);
    }
}

simulated function PlayWeaponFireAnim()
{
    local float Duration;

    if(Instigator.bIsCrouched)
    {
        Duration = WeapMesh.GetAnimLength('ShootLoop_End_CH');
        WeapMesh.PlayAnim('ShootLoop_End_CH', Duration / ThirdPersonAnimRate,, true);        
    }
    else
    {
        Duration = WeapMesh.GetAnimLength('ShootLoop_End');
        WeapMesh.PlayAnim('ShootLoop_End', Duration / ThirdPersonAnimRate,, true);
    }
}

simulated function PlayShoot(KFPawn P)
{
    PlayPawnFireAnim(P, 3);
    if(P.bIsCrouched)
    {
        P.PlayBodyAnim('ShootLoop_End_CH', 4, ThirdPersonAnimRate, ShootBlendInTime, ShootBlendOutTime);        
    }
    else
    {
        P.PlayBodyAnim('ShootLoop_End', 1, ThirdPersonAnimRate, ShootBlendInTime, ShootBlendOutTime);
    }
}

simulated function PlayReloadMagazineAnim(KFGame.KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    super.PlayReloadMagazineAnim(NewWeaponState, P);
    SetTimer(0.15, false, 'ShowArrowOnReload');
}

simulated function ShowArrowOnReload()
{
    SetArrowVisbility(true);
}

simulated function UpdateThirdPersonWeaponAction(KFGame.KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P, byte ThirdPersonAnimRateByte)
{
    local KFPawn_Human PHuman;

    PHuman = KFPawn_Human(P);
    super.UpdateThirdPersonWeaponAction(NewWeaponState, P, ThirdPersonAnimRateByte);
    switch(NewWeaponState)
    {
        case 28:
            SetArrowVisbility(false);
            break;
        case 26:
        case 0:
            if(P.IsLocallyControlled())
            {
                ToggleShowHideArrow(P);                
            }
            else
            {
                SetArrowVisbility(true);
            }
            if(PHuman != none)
            {
                if(PHuman.bUsingAltFireMode)
                {
                    ToggleCryoFX(true);
                }
            }
            break;
        default:
            break;
            break;
    }
}

simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P, byte ThirdPersonAnimRateByte)
{
    bCharging = false;
    SpawnTracer(GetMuzzleLocation(), HitLocation);
    if(!ActorEffectIsRelevant(P, false, MaxFireEffectDistance))
    {
        return false;
    }
    DecodeThirdPersonAnimRate(ThirdPersonAnimRateByte);
    if((P.FiringMode == 0) || P.FiringMode == 1)
    {
        SetArrowVisbility(false);
    }
    PlayWeaponFireAnim();
    if(!P.IsDoingSpecialMove())
    {
        PlayShoot(P);
        if(__OnWeaponStateChanged__Delegate != none)
        {
            OnWeaponStateChanged(true);
        }
    }
    CauseMuzzleFlash(P.FiringMode);
    return true;
}

simulated function ToggleShowHideArrow(KFPawn P)
{
    if(P.MyKFWeapon != none)
    {
        if(P.MyKFWeapon.AmmoCount[0] > 0)
        {
            SetArrowVisbility(true);            
        }
        else
        {
            SetArrowVisbility(false);
        }
    }
}

simulated function SetArrowVisbility(bool bVisible)
{
    WeapMesh.HideBoneByName('RW_Weapon', 0);
    if(bVisible)
    {
        ArrowSMC.SetHidden(false);
        CryoProjectilePSC.SetHidden(false);        
    }
    else
    {
        ArrowSMC.SetHidden(true);
        CryoProjectilePSC.SetHidden(true);
    }
}

simulated function StartPawnCrouch()
{
    if(KFPawn_Human(Owner) != none)
    {
        ResetAnimationState(KFPawn_Human(Owner));
    }
}

simulated function EndPawnCrouch()
{
    if(KFPawn_Human(Owner) != none)
    {
        ResetAnimationState(KFPawn_Human(Owner));
    }
}

simulated function SetWeaponUsingIronSights(bool bUsingIronSights)
{
    if(KFPawn_Human(Owner) != none)
    {
        ResetAnimationState(KFPawn_Human(Owner));
    }
}

simulated function SetWeaponAltFireMode(bool bUsingAltFireMode)
{
    ToggleCryoFX(bUsingAltFireMode);
}

simulated function ResetAnimationState(KFPawn_Human P)
{
    PlayCharacterMeshAnim(P, GetCharacterAnimationName(P), true, true);
}

simulated function ToggleCryoFX(bool bEnable)
{
    if(bEnable)
    {
        CryoProjectilePSC.DeactivateSystem();
        CryoProjectilePSC.SetTemplate(CryoProjectileEffectOn);
        CryoProjectilePSC.ActivateSystem();        
    }
    else
    {
        CryoProjectilePSC.DeactivateSystem();
        CryoProjectilePSC.SetTemplate(CryoProjectileEffectOff);
        CryoProjectilePSC.ActivateSystem();
    }
}

simulated function name GetWeaponFireLoopAnim(KFPawn_Human P)
{
    if(P.bIsCrouched && P.bUsingIronSights)
    {
        return 'ShootLoop_Sight_CH';
    }
    if(P.bIsCrouched)
    {
        return 'ShootLoop_CH';
    }
    if(P.bUsingIronSights)
    {
        return 'ShootLoop_Sight';
    }
    return 'ShootLoop';
}

simulated function name GetCharacterAnimationName(KFPawn_Human P)
{
    if(bCharging)
    {
        return GetWeaponFireLoopAnim(P);
    }
    if(P.bUsingIronSights && P.bIsCrouched)
    {
        return 'ShootLoop_Sight_CH';
    }
    if(P.bUsingIronSights)
    {
        return 'Idle_Iron_V1';
    }
    if(P.bIsCrouched)
    {
        return 'Idle_CH_V1';
    }
    return 'Idle_master';
}

simulated function AttachTo(KFPawn P)
{
    local byte WeaponAnimSetIdx;

    if(WeapMesh != none)
    {
        WeapMesh.SetShadowParent(P.Mesh);
        P.Mesh.AttachComponent(WeapMesh, 'LW_Weapon');
        WeapMesh.HideBoneByName('RW_Weapon', 0);
    }
    if(CharacterAnimSet != none)
    {
        WeaponAnimSetIdx = byte(P.CharacterArch.GetWeaponAnimSetIdx());
        P.Mesh.AnimSets[WeaponAnimSetIdx] = CharacterAnimSet;
        P.Mesh.UpdateAnimations();
    }
    P.SetAimOffsetNodesProfile(AimOffsetProfileName);
    if((KFPawn_Human(P) != none) && KFPawn_Human(P).WeaponSkinItemId > 0)
    {
        SetWeaponSkin(KFPawn_Human(P).WeaponSkinItemId);
    }
    if(ArrowSMC != none)
    {
        P.Mesh.AttachComponentToSocket(ArrowSMC, 'RW_Weapon');
    }
    if(CryoProjectilePSC != none)
    {
        P.Mesh.AttachComponentToSocket(CryoProjectilePSC, 'RW_Weapon');
    }
    if((P.MyKFWeapon != none) && P.MyKFWeapon.bUseAltFireMode)
    {
        ToggleCryoFX(true);
    }
}

simulated function DetachFrom(KFPawn P)
{
    if(CryoProjectilePSC != none)
    {
        CryoProjectilePSC.DeactivateSystem();
        CryoProjectilePSC.DetachFromAny();
    }
    if(ArrowSMC != none)
    {
        P.DetachComponent(ArrowSMC);
        ArrowSMC.DetachFromAny();
    }
    super.DetachFrom(P);
}

event SetWeaponSkin(int ItemId, optional bool bFinishedLoading)
{
    local array<MaterialInterface> SkinMICs;

    bFinishedLoading = false;
    if(((((WeapMesh != none) && ArrowSMC != none) && ItemId > 0) && WorldInfo.NetMode != NM_DedicatedServer) && !bWaitingForWeaponSkinLoad)
    {
        if(!bFinishedLoading && StartLoadWeaponSkin(ItemId))
        {
            return;
        }
        SkinMICs = Class'KFWeaponSkinList'.static.GetWeaponSkin(ItemId, 1);
        if(SkinMICs.Length > 0)
        {
            WeapMesh.SetMaterial(0, SkinMICs[0]);
            ArrowSMC.SetMaterial(0, SkinMICs[0]);
        }
    }
}

defaultproperties
{
    begin object name=ArrowStaticMeshComp0 class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_CompoundBow_MESH.Wep_3rdP_Compound_Bow_Arrow_Resource'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeapAttach_CompoundBow.ArrowStaticMeshComp0'
    ArrowSMC=ArrowStaticMeshComp0
    CryoProjectileEffectOn=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_Idle_3P'
    CryoProjectileEffectOff=ParticleSystem'WEP_CompoundBow_EMIT.FX_Compound_Bow_Cryo_ToggleOff'
    begin object name=CryoArrowParticleComp0 class=KFParticleSystemComponent
        bAutoActivate=false
        ReplacementPrimitive=none
        TickGroup=ETickingGroup.TG_PostUpdateWork
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeapAttach_CompoundBow.CryoArrowParticleComp0'
    CryoProjectilePSC=CryoArrowParticleComp0
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_CompoundBow.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_CompoundBow.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}