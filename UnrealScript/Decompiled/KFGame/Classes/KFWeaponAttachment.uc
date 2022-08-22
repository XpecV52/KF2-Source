/*******************************************************************************
 * KFWeaponAttachment generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeaponAttachment extends Actor
    native
    notplaceable
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

const BloodParamName = 'Scalar_Blood_Contrast';
const MinBloodParamValue = 0.20f;
const MeleeBasic = 'Melee';
const CH_MeleeBasic = 'Melee_CH';
const MeleeAnim_F = 'Atk_F';
const MeleeAnim_B = 'Atk_B';
const MeleeAnim_L = 'Atk_L';
const MeleeAnim_R = 'Atk_R';
const CH_MeleeAnim_F = 'Atk_F_CH';
const CH_MeleeAnim_B = 'Atk_B_CH';
const CH_MeleeAnim_L = 'Atk_L_CH';
const CH_MeleeAnim_R = 'Atk_R_CH';
const MeleeHeavy_F = 'Atk_H_F';
const MeleeHeavy_B = 'Atk_H_B';
const MeleeHeavy_L = 'Atk_H_L';
const MeleeHeavy_R = 'Atk_H_R';
const CH_MeleeHeavy_F = 'Atk_H_F_CH';
const CH_MeleeHeavy_B = 'Atk_H_B_CH';
const CH_MeleeHeavy_L = 'Atk_H_L_CH';
const CH_MeleeHeavy_R = 'Atk_H_R_CH';
const MeleeLoopAnim = 'Atk_F_Loop';
const MeleeStartAnim = 'Atk_F_In';
const MeleeEndAnim = 'Atk_F_Out';
const CH_MeleeLoopAnim = 'Atk_F_Loop_CH';
const CH_MeleeStartAnim = 'Atk_F_In_CH';
const CH_MeleeEndAnim = 'Atk_F_Out_CH';
const BlockLoopAnim = 'Brace_Loop';
const BlockStartAnim = 'Brace_In';
const BlockEndAnim = 'Brace_Out';
const CH_BlockLoopAnim = 'Brace_Loop_CH';
const CH_BlockStartAnim = 'Brace_In_CH';
const CH_BlockEndAnim = 'Brace_Out_CH';
const CleanWeaponAnim = 'Clean_NoBlood';
const CH_CleanWeaponAnim = 'Clean_NoBlood_CH';
const GrenadeAnim = 'Nade_Throw';
const EquipAnim = 'Equip';
const PutAwayAnim = 'PutAway';
const CH_GrenadeAnim = 'Nade_Throw_CH';
const CH_EquipAnim = 'Equip_CH';
const CH_PutAwayAnim = 'PutAway_CH';
const ReloadEmptyAnim = 'Reload_Empty';
const ReloadHalfAnim = 'Reload_Half';
const ReloadEmptyEliteAnim = 'Reload_Empty_Elite';
const ReloadHalfEliteAnim = 'Reload_Half_Elite';
const CH_ReloadEmptyAnim = 'Reload_Empty_CH';
const CH_ReloadHalfAnim = 'Reload_Half_CH';
const CH_ReloadEmptyEliteAnim = 'Reload_Empty_Elite_CH';
const CH_ReloadHalfEliteAnim = 'Reload_Half_Elite_CH';
const ReloadOpenAnim = 'Reload_Open';
const ReloadInsertAnim = 'Reload_Insert';
const ReloadCloseAnim = 'Reload_Close';
const ReloadOpenEliteAnim = 'Reload_Open_Elite';
const ReloadInsertEliteAnim = 'Reload_Insert_Elite';
const ReloadCloseEliteAnim = 'Reload_Close_Elite';
const ReloadOpenEmptyAnim = 'Reload_Open_Shell';
const ReloadOpenEmptyEliteAnim = 'Reload_Open_Shell_Elite';
const CH_ReloadOpenAnim = 'Reload_Open_CH';
const CH_ReloadInsertAnim = 'Reload_Insert_CH';
const CH_ReloadCloseAnim = 'Reload_Close_CH';
const CH_ReloadOpenEliteAnim = 'Reload_Open_Elite_CH';
const CH_ReloadInsertEliteAnim = 'Reload_Insert_Elite_CH';
const CH_ReloadCloseEliteAnim = 'Reload_Close_Elite_CH';
const CH_ReloadOpenEmptyAnim = 'Reload_Open_Shell_CH';
const CH_ReloadOpenEmptyEliteAnim = 'Reload_Open_Shell_Elite_CH';
const HealSelfAnim = 'Healer_Self';
const HealOtherAnim = 'Healer_F';
const QuickHealAnim = 'Heal_Quick';
const CH_HealSelfAnim = 'Healer_Self_CH';
const CH_HealOtherAnim = 'Healer_F_CH';
const CH_QuickHealAnim = 'Heal_Quick_CH';
const WeldStartAnim = 'Welder_Start';
const WeldLoopAnim = 'Welder_Loop';
const WeldEndAnim = 'Welder_End';
const CH_WeldStartAnim = 'Welder_Start_CH';
const CH_WeldLoopAnim = 'Welder_Loop_CH';
const CH_WeldEndAnim = 'Welder_End_CH';
const ShootAnim = 'ADD_Shoot';
const CrouchShootAnim = 'ADD_CH_Shoot';
const IronShootAnim = 'ADD_Iron_Shoot';
const WeaponFireAnim = 'Shoot';
const WeaponAltFireAnim = 'Shoot';
const WeaponIronFireAnim = 'Iron_Shoot';

enum EWeaponState
{
    WEP_Idle,
    WEP_Reload,
    WEP_ReloadEmpty,
    WEP_Reload_Elite,
    WEP_ReloadEmpty_Elite,
    WEP_ReloadSingle,
    WEP_ReloadSingleEmpty,
    WEP_ReloadSingle_Elite,
    WEP_ReloadSingleEmpty_Elite,
    WEP_ReloadSecondary,
    WEP_ReloadSecondary_Elite,
    WEP_MeleeBasic,
    WEP_MeleeChain,
    WEP_MeleeSustained,
    WEP_Melee_L,
    WEP_Melee_R,
    WEP_Melee_F,
    WEP_Melee_B,
    WEP_MeleeHeavy_L,
    WEP_MeleeHeavy_R,
    WEP_MeleeHeavy_F,
    WEP_MeleeHeavy_B,
    WEP_MeleeBlock,
    WEP_Cleaning,
    WEP_Equipping,
    WEP_PutAway,
    WEP_Grenade,
    WEP_Heal,
    WEP_HealQuick,
    WEP_Weld,
    WEP_Custom0,
    WEP_Custom1,
    WEP_Custom2,
    WEP_Custom3,
    WEP_Custom4,
    WEP_Custom5,
    WEP_Custom6,
    WEP_Custom7,
    WEP_Custom8,
    WEP_Custom9,
    WEP_MAX
};

struct native KFTracerInfo
{
    /** Tracer Effect */
    var() ParticleSystem TracerTemplate;
    /** The velocity the tracer should travel at */
    var() int TracerVelocity;
    /** Show the tracer when the weapon is firing in normal time */
    var() bool bDoTracerDuringNormalTime;
    /** Show the tracer when the weapon is firing in zed time */
    var() bool bDoTracerDuringZedTime;
    var int MinTracerEffectDistanceSquared;
    var Vector VelocityVector;

    structdefaultproperties
    {
        TracerTemplate=none
        TracerVelocity=7000
        bDoTracerDuringNormalTime=true
        bDoTracerDuringZedTime=false
        MinTracerEffectDistanceSquared=40000
        VelocityVector=(X=0,Y=0,Z=0)
    }
};

/** Editable SkeletalMesh set by the archetype */
var() const SkeletalMesh SkelMesh;
/** Extra pawn anim set when weapon is equipped */
var() AnimSet CharacterAnimSet;
/** Anim set to use for 3rd person weapon anims */
var() AnimSet WeaponAnimSet;
var export editinline transient SkeletalMeshComponent WeapMesh;
/** If true this third person weapon is part of the pawn's mesh */
var() bool bWeapMeshIsPawnMesh;
/** @name LaserSight */
var() bool bHasLaserSight;
/** Enable recoile skeletal controls */
var(Anims) bool bPlayIKRecoil;
var transient bool bSynchronizeWeaponAnim;
var transient bool bSyncAnimCheckRelevance;
var transient bool bLoopSynchedWeaponAnim;
var transient bool bIsReloading;
var() const KFLaserSightAttachment LaserSightArchetype;
var transient KFLaserSightAttachment LaserSight;
var KFMuzzleFlash MuzzleFlash;
/** A reference to the muzzle flash template */
var() const KFMuzzleFlash MuzzleFlashTemplate;
var float MaxFireEffectDistance;
/** Tracer effect info per fire mode */
var() array<KFTracerInfo> TracerInfos;
var transient MaterialInstanceConstant WeaponMIC;
var transient float BloodParamValue;
var RecoilDef Recoil_Hand;
var RecoilDef Recoil_Spine;
/** (TEMP) blend settings */
var(Anims) float DefaultBlendInTime;
var(Anims) float DefaultBlendOutTime;
var(Anims) float ShootBlendInTime;
var(Anims) float ShootBlendOutTime;
var transient byte LastMeleeAnimIdx;
var transient AnimNodeSlot SyncPawnNode;
var transient name SyncAnimName;
var transient name LoopingAnim;
var transient name LoopIntroAnim;
var transient name LoopOutroAnim;
var transient AnimNodeSequence WeapAnimNode;
/** Profile name for this weapon */
var(Anims) name AimOffsetProfileName;
var delegate<OnWeaponStateChanged> __OnWeaponStateChanged__Delegate;

// Export UKFWeaponAttachment::execChangeVisibility(FFrame&, void* const)
native function ChangeVisibility(bool bIsVisible);

event PreBeginPlay()
{
    local int I;

    if((WeapMesh != none) && !bWeapMeshIsPawnMesh)
    {
        if(WeaponAnimSet != none)
        {
            WeapMesh.AnimSets[0] = WeaponAnimSet;
        }
        if(SkelMesh != none)
        {
            WeapMesh.SkeletalMesh = SkelMesh;
        }
        WeapAnimNode = AnimNodeSequence(WeapMesh.Animations);
    }
    I = 0;
    J0xCC:

    if(I < TracerInfos.Length)
    {
        TracerInfos[I].VelocityVector = vect(1, 0, 0) * float(TracerInfos[I].TracerVelocity);
        ++ I;
        goto J0xCC;
    }
    super.PreBeginPlay();
}

simulated function AttachTo(KFPawn P)
{
    local byte WeaponAnimSetIdx;

    if(bWeapMeshIsPawnMesh)
    {
        WeapMesh = P.Mesh;        
    }
    else
    {
        if(WeapMesh != none)
        {
            WeapMesh.SetShadowParent(P.Mesh);
            P.Mesh.AttachComponent(WeapMesh, P.WeaponAttachmentSocket);
        }
    }
    if(bHasLaserSight && !P.IsFirstPerson())
    {
        AttachLaserSight();
    }
    if(CharacterAnimSet != none)
    {
        WeaponAnimSetIdx = byte(P.CharacterArch.AnimSets.Length);
        P.Mesh.AnimSets[WeaponAnimSetIdx] = CharacterAnimSet;
        P.Mesh.UpdateAnimations();
    }
    P.SetAimOffsetNodesProfile(AimOffsetProfileName);
}

simulated function DetachFrom(KFPawn P)
{
    if(MuzzleFlash != none)
    {
        MuzzleFlash.DetachMuzzleFlash(WeapMesh);
    }
    if(bWeapMeshIsPawnMesh)
    {
        WeapMesh = none;        
    }
    else
    {
        if(WeapMesh != none)
        {
            WeapMesh.SetShadowParent(none);
            P.Mesh.DetachComponent(WeapMesh);
        }
    }
}

simulated function AttachMuzzleFlash()
{
    if((WeapMesh != none) && MuzzleFlash == none)
    {
        MuzzleFlash = new (self) Class'KFMuzzleFlash' (MuzzleFlashTemplate);
        MuzzleFlash.AttachMuzzleFlash(WeapMesh);
    }
}

simulated function AttachLaserSight()
{
    if(((WeapMesh != none) && LaserSight == none) && LaserSightArchetype != none)
    {
        LaserSight = new (self) Class'KFLaserSightAttachment' (LaserSightArchetype);
        LaserSight.AttachLaserSight(WeapMesh, false);
    }
}

event SetWeaponSkin(int ItemId)
{
    local array<MaterialInterface> SkinMICs;

    if((ItemId > 0) && WorldInfo.NetMode != NM_DedicatedServer)
    {
        SkinMICs = Class'KFWeaponSkinList'.static.GetWeaponSkin(ItemId, 1);
        if(SkinMICs.Length > 0)
        {
            WeapMesh.SetMaterial(0, SkinMICs[0]);
        }
    }
}

simulated function bool ActorEffectIsRelevant(Pawn EffectInstigator, bool bForceDedicated, optional float VisibleCullDistance, optional float HiddenCullDistance)
{
    VisibleCullDistance = 5000;
    HiddenCullDistance = 350;
    if(Instigator != none)
    {
        return Instigator.ActorEffectIsRelevant(EffectInstigator, bForceDedicated, VisibleCullDistance, HiddenCullDistance);
    }
    return false;
}

simulated function FirstPersonFireEffects(Weapon W, Vector HitLocation)
{
    if(W != none)
    {
        SpawnTracer(W.GetMuzzleLoc(), HitLocation);
    }
}

simulated function StopFirstPersonFireEffects(Weapon W)
{
    if(W != none)
    {
        W.StopFireEffects(Pawn(Owner).FiringMode);
    }
}

simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P)
{
    local KFPawn.EAnimSlotStance AnimType;

    SpawnTracer(GetMuzzleLocation(), HitLocation);
    if(!ActorEffectIsRelevant(P, false, MaxFireEffectDistance))
    {
        return false;
    }
    if(!bWeapMeshIsPawnMesh)
    {
        PlayWeaponFireAnim();
    }
    if(P.IsDoingSpecialMove() && P.SpecialMoves[P.SpecialMove].bAllowFireAnims)
    {
        AnimType = 3;        
    }
    else
    {
        AnimType = 0;
    }
    if(!P.IsDoingSpecialMove() || AnimType == 3)
    {
        PlayPawnFireAnim(P, AnimType);
        if(!P.IsDoingSpecialMove())
        {
            P.StopBodyAnim(((P.bIsCrouched) ? 4 : 1), 0.1);
        }
        if(__OnWeaponStateChanged__Delegate != none)
        {
            OnWeaponStateChanged(true);
        }
    }
    CauseMuzzleFlash(P.FiringMode);
    return true;
}

simulated function PlayWeaponFireAnim()
{
    if(Instigator.bIsWalking)
    {
        WeapMesh.PlayAnim('Iron_Shoot',,, true);        
    }
    else
    {
        WeapMesh.PlayAnim('Shoot',,, true);
    }
}

simulated function PlayPawnFireAnim(KFPawn P, KFPawn.EAnimSlotStance AnimType)
{
    if(P.bIsCrouched)
    {
        P.PlayBodyAnim('ADD_CH_Shoot', AnimType, 1, ShootBlendInTime, ShootBlendOutTime);        
    }
    else
    {
        if(P.bIsWalking)
        {
            P.PlayBodyAnim('ADD_Iron_Shoot', AnimType, 1, ShootBlendInTime, ShootBlendOutTime);            
        }
        else
        {
            P.PlayBodyAnim('ADD_Shoot', AnimType, 1, ShootBlendInTime, ShootBlendOutTime);
        }
    }
}

simulated function StopThirdPersonFireEffects()
{
    if(MuzzleFlash != none)
    {
        MuzzleFlash.StopMuzzleFlash();
    }
}

simulated function Vector GetMuzzleLocation(optional byte MuzzleID)
{
    local Vector SocketLocation;

    if(MuzzleFlashTemplate != none)
    {
        WeapMesh.GetSocketWorldLocationAndRotation(MuzzleFlashTemplate.GetSocketName(), SocketLocation);
        return SocketLocation;        
    }
    else
    {
        LogInternal("Missing 3rd person muzzle socket for" @ string(SkelMesh));
        return WeapMesh.Bounds.Origin + (vect(45, 0, 0) >> Instigator.Rotation);
    }
}

simulated function SpawnTracer(Vector EffectLocation, Vector HitLocation)
{
    local editinline ParticleSystemComponent E;
    local Vector Dir;
    local float DistSq, TracerDuration;
    local KFTracerInfo TracerInfo;

    if((Instigator == none) || Instigator.FiringMode >= TracerInfos.Length)
    {
        return;
    }
    TracerInfo = TracerInfos[Instigator.FiringMode];
    if(((!self.WorldInfo.TimeDilation < 1 && TracerInfo.bDoTracerDuringNormalTime) || (self.WorldInfo.TimeDilation < 1) && TracerInfo.bDoTracerDuringZedTime) && TracerInfo.TracerTemplate != none)
    {
        Dir = HitLocation - EffectLocation;
        DistSq = VSizeSq(Dir);
        if(DistSq > float(TracerInfo.MinTracerEffectDistanceSquared))
        {
            TracerDuration = FMin((Sqrt(DistSq) - 100) / float(TracerInfo.TracerVelocity), 1);
            if(TracerDuration > 0)
            {
                E = WorldInfo.MyEmitterPool.SpawnEmitter(TracerInfo.TracerTemplate, EffectLocation, rotator(Dir));
                E.SetVectorParameter('Tracer_Velocity', TracerInfo.VelocityVector);
                E.SetFloatParameter('Tracer_Lifetime', TracerDuration);
            }
        }
    }
}

simulated function CauseMuzzleFlash(byte FiringMode)
{
    if((MuzzleFlash == none) && MuzzleFlashTemplate != none)
    {
        AttachMuzzleFlash();
    }
    if(MuzzleFlash != none)
    {
        MuzzleFlash.CauseMuzzleFlash(FiringMode);
        if(MuzzleFlash.bAutoActivateShellEject)
        {
            MuzzleFlash.CauseShellEject();
        }
    }
}

simulated function ANIMNOTIFY_ShellEject()
{
    if((MuzzleFlash == none) && MuzzleFlashTemplate != none)
    {
        MuzzleFlash = new (self) Class'KFMuzzleFlash' (MuzzleFlashTemplate);
        MuzzleFlash.AttachMuzzleFlash(WeapMesh);
    }
    if(MuzzleFlash != none)
    {
        MuzzleFlash.CauseShellEject();
    }
}

simulated function AddBattleBlood(float InBloodParamIncrementValue)
{
    if(!bWeapMeshIsPawnMesh)
    {
        if((WeaponMIC == none) && WeapMesh != none)
        {
            WeaponMIC = WeapMesh.CreateAndSetMaterialInstanceConstant(0);
        }
        if(WeaponMIC != none)
        {
            BloodParamValue = FMax(BloodParamValue + InBloodParamIncrementValue, 0.2);
            WeaponMIC.SetScalarParameterValue('Scalar_Blood_Contrast', BloodParamValue);
        }
    }
}

delegate OnWeaponStateChanged(optional bool bInterrupted);

simulated function float PlayCharacterMeshAnim(KFPawn P, name AnimName, optional bool bPlaySynchedWeaponAnim, optional bool bLooping)
{
    local float Duration;
    local KFPawn.EAnimSlotStance Stance;

    if(P.IsDoingSpecialMove() && !P.SpecialMoves[P.SpecialMove].bAllowThirdPersonWeaponAnims)
    {
        return 0;
    }
    Stance = ((!P.bIsCrouched) ? 1 : 4);
    Duration = P.PlayBodyAnim(AnimName, Stance, 1, DefaultBlendInTime, DefaultBlendOutTime, bLooping);
    if((Duration > float(0)) && bPlaySynchedWeaponAnim)
    {
        PlayWeaponMeshAnim(AnimName, P.BodyStanceNodes[Stance], bLooping);
    }
    if(bDebug)
    {
        LogInternal((((((string(GetFuncName()) @ "called on:") $ string(P)) @ "Anim:") $ string(AnimName)) @ "Duration:") $ string(Duration));
    }
    return Duration;
}

simulated function UpdateThirdPersonWeaponAction(KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    ClearTimer('LoopWeaponMeleeAnim');
    bIsReloading = false;
    if(__OnWeaponStateChanged__Delegate != none)
    {
        OnWeaponStateChanged();
    }
    if(bDebug)
    {
        LogInternal((((string(GetFuncName()) @ "called on") @ string(self)) @ "State:") @ string(NewWeaponState));
    }
    switch(NewWeaponState)
    {
        case 24:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Equip_CH' : 'Equip'));
            break;
        case 25:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'PutAway_CH' : 'PutAway'));
            break;
        case 26:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Nade_Throw_CH' : 'Nade_Throw'));
            break;
        case 27:
            PlayHealAnim(P);
            break;
        case 28:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Heal_Quick_CH' : 'Heal_Quick'));
            break;
        case 29:
            PlayWeldAnim(P);
            break;
        case 23:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Clean_NoBlood_CH' : 'Clean_NoBlood'));
            break;
        case 11:
        case 17:
        case 16:
        case 14:
        case 15:
        case 21:
        case 20:
        case 18:
        case 19:
            PlayMeleeAtkAnim(NewWeaponState, P);
            break;
        case 13:
            PlayMeleeSustainedAnim(P);
            break;
        case 22:
            PlayMeleeBlockAnim(P);
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 9:
        case 10:
            bIsReloading = true;
            PlayReloadMagazineAnim(NewWeaponState, P);
            break;
        case 5:
        case 7:
        case 6:
        case 8:
            bIsReloading = true;
            PlayReloadSingleAnim(NewWeaponState, P);
            break;
        default:
            break;
    }
}

simulated function float PlayMeleeAtkAnim(KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    local name AnimName;
    local float Duration;

    if(P.IsFirstPerson())
    {
        return Duration;
    }
    switch(NewWeaponState)
    {
        case 11:
            AnimName = ((P.bIsCrouched) ? 'Melee_CH' : 'Melee');
            break;
        case 21:
            AnimName = ((P.bIsCrouched) ? 'Atk_H_B_CH' : 'Atk_H_B');
            break;
        case 20:
            AnimName = ((P.bIsCrouched) ? 'Atk_H_F_CH' : 'Atk_H_F');
            break;
        case 18:
            AnimName = ((P.bIsCrouched) ? 'Atk_H_L_CH' : 'Atk_H_L');
            break;
        case 19:
            AnimName = ((P.bIsCrouched) ? 'Atk_H_R_CH' : 'Atk_H_R');
            break;
        case 17:
            AnimName = ((P.bIsCrouched) ? 'Atk_B_CH' : 'Atk_B');
            break;
        case 16:
            AnimName = ((P.bIsCrouched) ? 'Atk_F_CH' : 'Atk_F');
            break;
        case 14:
            AnimName = ((P.bIsCrouched) ? 'Atk_L_CH' : 'Atk_L');
            break;
        case 15:
            AnimName = ((P.bIsCrouched) ? 'Atk_R_CH' : 'Atk_R');
            break;
        default:
            break;
    }
    if(AnimName != 'None')
    {
        Duration = PlayCharacterMeshAnim(P, AnimName);
    }
    return Duration;
}

simulated function name GetRandomDirectionalMeleeAnim(Pawn P)
{
    local byte AnimIdx, NumTries;

    J0x00:
    AnimIdx = byte(Rand(4));
    ++ NumTries;
    if(!((LastMeleeAnimIdx != AnimIdx) || NumTries >= 4))
        goto J0x00;
    LastMeleeAnimIdx = AnimIdx;
    switch(AnimIdx)
    {
        case 0:
            return ((P.bIsCrouched) ? 'Atk_F_CH' : 'Atk_F');
        case 1:
            return ((P.bIsCrouched) ? 'Atk_B_CH' : 'Atk_B');
        case 2:
            return ((P.bIsCrouched) ? 'Atk_L_CH' : 'Atk_L');
        case 3:
            return ((P.bIsCrouched) ? 'Atk_R_CH' : 'Atk_R');
        default:
            break;
    }
}

simulated function LoopWeaponMeleeAnim()
{
    local KFPawn P;

    P = KFPawn(Owner);
    if((P != none) && !P.IsDoingSpecialMove())
    {
        UpdateThirdPersonWeaponAction(12, P);
    }
}

simulated function PlayMeleeBlockAnim(KFPawn P)
{
    if(P.bIsCrouched)
    {
        StartLoopingAnim(P, 'Brace_Loop_CH', 'Brace_In_CH', 'Brace_Out_CH');        
    }
    else
    {
        StartLoopingAnim(P, 'Brace_loop', 'Brace_in', 'Brace_out');
    }
}

simulated function PlayMeleeSustainedAnim(KFPawn P)
{
    if(P.bIsCrouched)
    {
        StartLoopingAnim(P, 'Atk_F_Loop_CH', 'Atk_F_In_CH', 'Atk_F_Out_CH');        
    }
    else
    {
        StartLoopingAnim(P, 'Atk_F_Loop', 'Atk_F_In', 'Atk_F_Out');
    }
}

simulated function PlayReloadMagazineAnim(KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    local name AnimName;

    switch(NewWeaponState)
    {
        case 1:
            AnimName = ((!P.bIsCrouched) ? 'Reload_Half' : 'Reload_Half_CH');
            break;
        case 2:
            AnimName = ((!P.bIsCrouched) ? 'Reload_Empty' : 'Reload_Empty_CH');
            break;
        case 3:
            AnimName = ((!P.bIsCrouched) ? 'Reload_Half_Elite' : 'Reload_Half_Elite_CH');
            break;
        case 4:
            AnimName = ((!P.bIsCrouched) ? 'Reload_Empty_Elite' : 'Reload_Empty_Elite_CH');
            break;
        default:
            break;
    }
    PlayCharacterMeshAnim(P, AnimName, true);
}

simulated function PlayReloadSingleAnim(KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    switch(NewWeaponState)
    {
        case 5:
            if(P.bIsCrouched)
            {
                StartLoopingAnim(P, 'Reload_Insert_CH', 'Reload_Open_CH', 'Reload_Close_CH', true);                
            }
            else
            {
                StartLoopingAnim(P, 'Reload_Insert', 'Reload_Open', 'Reload_Close', true);
            }
            break;
        case 7:
            if(P.bIsCrouched)
            {
                StartLoopingAnim(P, 'Reload_Insert_Elite_CH', 'Reload_Open_Elite_CH', 'Reload_Close_Elite_CH', true);                
            }
            else
            {
                StartLoopingAnim(P, 'Reload_Insert_Elite', 'Reload_Open_Elite', 'Reload_Close_Elite', true);
            }
            break;
        case 6:
            if(P.bIsCrouched)
            {
                StartLoopingAnim(P, 'Reload_Insert_CH', 'Reload_Open_Shell_CH', 'Reload_Close_CH', true);                
            }
            else
            {
                StartLoopingAnim(P, 'Reload_Insert', 'Reload_Open_Shell', 'Reload_Close', true);
            }
            break;
        case 8:
            if(P.bIsCrouched)
            {
                StartLoopingAnim(P, 'Reload_Insert_Elite_CH', 'Reload_Open_Shell_Elite_CH', 'Reload_Close_Elite_CH', true);                
            }
            else
            {
                StartLoopingAnim(P, 'Reload_Insert_Elite', 'Reload_Open_Shell_Elite', 'Reload_Close_Elite', true);
            }
            break;
        default:
            break;
    }
}

simulated function PlayHealAnim(KFPawn P)
{
    if(P.bIsCrouched)
    {
        PlayCharacterMeshAnim(P, ((P.FiringMode == 0) ? 'Healer_F_CH' : 'Healer_Self_CH'));        
    }
    else
    {
        PlayCharacterMeshAnim(P, ((P.FiringMode == 0) ? 'Healer_F' : 'Healer_Self'));
    }
}

simulated function PlayWeldAnim(KFPawn P)
{
    if(P.bIsCrouched)
    {
        StartLoopingAnim(P, 'Welder_Loop_CH', 'Welder_Start_CH', 'Welder_End_CH');        
    }
    else
    {
        StartLoopingAnim(P, 'Welder_Loop', 'Welder_Start', 'Welder_End');
    }
}

simulated function PlayWeaponMeshAnim(name AnimName, AnimNodeSlot SyncNode, bool bLoop)
{
    if(!bWeapMeshIsPawnMesh)
    {
        WeapMesh.PlayAnim(AnimName, 0, bLoop);
        if(SyncNode != none)
        {
            bSynchronizeWeaponAnim = true;
            SyncPawnNode = SyncNode;
            SyncAnimName = AnimName;
            bSyncAnimCheckRelevance = false;
        }
    }
}

simulated event Tick(float DeltaTime)
{
    if(((!bWeapMeshIsPawnMesh && bSynchronizeWeaponAnim) && SyncPawnNode != none) && WeapMesh.bForceRefpose == 0)
    {
        if((!SyncPawnNode.bIsPlayingCustomAnim || !SyncPawnNode.bRelevant && bSyncAnimCheckRelevance) || SyncPawnNode.GetPlayedAnimation() != SyncAnimName)
        {
            if(WeapAnimNode.bPlaying && WeapAnimNode.AnimSeqName == SyncAnimName)
            {
                InterruptWeaponAnim();
            }
            bSynchronizeWeaponAnim = false;
        }
        bSyncAnimCheckRelevance = true;
    }
}

simulated function InterruptWeaponAnim()
{
    if(!bWeapMeshIsPawnMesh)
    {
        WeapAnimNode.StopAnim();
        if(WeapAnimNode.bForceRefposeWhenNotPlaying)
        {
            WeapMesh.SetForceRefPose(true);
        }
    }
}

simulated function SetMeshLightingChannels(LightingChannelContainer NewLightingChannels)
{
    if(!bWeapMeshIsPawnMesh)
    {
        WeapMesh.SetLightingChannels(NewLightingChannels);
    }
    if(LaserSight != none)
    {
        LaserSight.SetMeshLightingChannels(NewLightingChannels);
    }
}

simulated function bool HasIndoorLighting()
{
    return WeapMesh.LightingChannels.Indoor;
}

simulated function bool HasOutdoorLighting()
{
    return WeapMesh.LightingChannels.Outdoor;
}

simulated function StartLoopingAnim(KFPawn P, name InLoopAnim, optional name InIntroAnim, optional name InOutroAnim, optional bool bPlaySynchedWeaponAnim)
{
    if(!P.IsDoingSpecialMove())
    {
        LoopingAnim = InLoopAnim;
        LoopIntroAnim = InIntroAnim;
        LoopOutroAnim = InOutroAnim;
        bLoopSynchedWeaponAnim = bPlaySynchedWeaponAnim;
        GotoState('LoopingWeaponAction');
    }
}

simulated function PlayLoopAnim();

simulated state LoopingWeaponAction
{
    simulated function BeginState(name PreviousStateName)
    {
        local KFPawn P;
        local float Duration;

        P = KFPawn(Owner);
        if(LoopIntroAnim != 'None')
        {
            Duration = PlayCharacterMeshAnim(P, LoopIntroAnim, bLoopSynchedWeaponAnim);
            if(Duration > float(0))
            {
                SetTimer(Duration - 0.2, false, 'PlayLoopAnim');
                return;
            }
        }
        PlayLoopAnim();
    }

    simulated function EndState(name NextStateName)
    {
        local KFPawn P;

        P = KFPawn(Owner);
        if(P != none)
        {
            P.StopBodyAnim(1, 0.1);
            P.StopBodyAnim(4, 0.1);
        }
        if(bLoopSynchedWeaponAnim && bSynchronizeWeaponAnim)
        {
            InterruptWeaponAnim();
        }
    }

    simulated function PlayLoopAnim()
    {
        local KFPawn P;

        P = KFPawn(Owner);
        if(P != none)
        {
            PlayCharacterMeshAnim(P, LoopingAnim, bLoopSynchedWeaponAnim, true);
        }
    }

    simulated function UpdateThirdPersonWeaponAction(KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
    {
        GotoState('None');
        if(LoopOutroAnim != 'None')
        {
            PlayCharacterMeshAnim(P, LoopOutroAnim, bLoopSynchedWeaponAnim);
        }
        global.UpdateThirdPersonWeaponAction(NewWeaponState, P);
    }

    simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P)
    {
        GotoState('None');
        return global.ThirdPersonFireEffects(HitLocation, P);
    }

    simulated function DetachFrom(KFPawn P)
    {
        GotoState('None');
        global.DetachFrom(P);
    }
    stop;    
}

defaultproperties
{
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeaponAttachment.MeshSequenceA'
        bForceRefpose=1
        bUpdateSkelWhenNotRendered=false
        bIgnoreControllersWhenNotRendered=true
        bPerBoneMotionBlur=true
        bOverrideAttachmentOwnerVisibility=true
        ReplacementPrimitive=none
        MaxDrawDistance=4000
        CachedMaxDrawDistance=4000
        bOwnerNoSee=true
        LightingChannels=(bInitialized=true,Outdoor=true)
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeaponAttachment.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
    LaserSightArchetype=KFLaserSightAttachment'FX_LaserSight_ARCH.Default_LaserSight_3P'
    MaxFireEffectDistance=5000
    Recoil_Hand=(TimeToGo=0,TimeDuration=0.33,RotAmplitude=(X=0,Y=0,Z=0),RotFrequency=(X=0,Y=0,Z=0),RotSinOffset=(X=0,Y=0,Z=0),RotParams=(X=ERecoilStart.ERS_Zero,Y=ERecoilStart.ERS_Zero,Z=ERecoilStart.ERS_Zero,Padding=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),LocAmplitude=(X=0,Y=0,Z=0),LocFrequency=(X=0,Y=0,Z=0),LocSinOffset=(X=0,Y=0,Z=0),LocParams=(X=ERecoilStart.ERS_Zero,Y=ERecoilStart.ERS_Zero,Z=ERecoilStart.ERS_Zero,Padding=0),LocOffset=(X=0,Y=0,Z=0))
    Recoil_Spine=(TimeToGo=0,TimeDuration=0.33,RotAmplitude=(X=0,Y=0,Z=0),RotFrequency=(X=0,Y=0,Z=0),RotSinOffset=(X=0,Y=0,Z=0),RotParams=(X=ERecoilStart.ERS_Zero,Y=ERecoilStart.ERS_Zero,Z=ERecoilStart.ERS_Zero,Padding=0),RotOffset=(Pitch=0,Yaw=0,Roll=0),LocAmplitude=(X=0,Y=0,Z=0),LocFrequency=(X=0,Y=0,Z=0),LocSinOffset=(X=0,Y=0,Z=0),LocParams=(X=ERecoilStart.ERS_Zero,Y=ERecoilStart.ERS_Zero,Z=ERecoilStart.ERS_Zero,Padding=0),LocOffset=(X=0,Y=0,Z=0))
    DefaultBlendInTime=0.2
    DefaultBlendOutTime=0.2
    ShootBlendInTime=0.1
    ShootBlendOutTime=0.1
    LastMeleeAnimIdx=255
    AimOffsetProfileName=Default
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bReplicateInstigator=true
    NetUpdateFrequency=10
}