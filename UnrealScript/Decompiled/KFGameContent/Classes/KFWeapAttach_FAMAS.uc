/*******************************************************************************
 * KFWeapAttach_FAMAS generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_FAMAS extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireAnimCrouch = 'Shoot_Secondary_CH';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';
const SecondaryFireBodyAnim = 'ADD_Shoot_Secondary';
const SecondaryFireBodyAnimCH = 'ADD_Shoot_Secondary_CH';
const SecondaryFireBodyAnimIron = 'ADD_Shoot_Secondary_Iron';
const SecondaryReloadAnimEmpty = 'Reload_Secondary_Empty';
const SecondaryReloadAnimEmptyCrouch = 'Reload_Secondary_Empty_CH';
const SecondaryReloadAnimHalf = 'Reload_Secondary_Half';
const SecondaryReloadAnimHalfCrouch = 'Reload_Secondary_Half_CH';
const SecondaryReloadAnimEliteEmpty = 'Reload_Secondary_Elite_Empty';
const SecondaryReloadAnimEliteEmptyCrouch = 'Reload_Secondary_Elite_Empty_CH';
const SecondaryReloadAnimEliteHalf = 'Reload_Secondary_Elite_Half';
const SecondaryReloadAnimEliteHalfCrouch = 'Reload_Secondary_Elite_Half_CH';
const ShotgunMuzzleSocket = 'ShotgunMuzzleFlash';

var protected transient KFMuzzleFlash ShotgunMuzzleFlash;

simulated function PlayReloadMagazineAnim(KFGame.KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    local name AnimName;

    switch(NewWeaponState)
    {
        case 9:
            AnimName = ((P.bIsCrouched) ? 'Reload_Secondary_Half_CH' : 'Reload_Secondary_Half');
            break;
        case 11:
            AnimName = ((P.bIsCrouched) ? 'Reload_Secondary_Empty_CH' : 'Reload_Secondary_Empty');
            break;
        case 10:
            AnimName = ((P.bIsCrouched) ? 'Reload_Secondary_Elite_Half_CH' : 'Reload_Secondary_Elite_Half');
            break;
        case 12:
            AnimName = ((P.bIsCrouched) ? 'Reload_Secondary_Elite_Empty_CH' : 'Reload_Secondary_Elite_Empty');
            break;
        default:
            break;
    }
    if(AnimName != 'None')
    {
        PlayCharacterMeshAnim(P, AnimName, true);        
    }
    else
    {
        super.PlayReloadMagazineAnim(NewWeaponState, P);
    }
}

simulated function CauseMuzzleFlash(byte FiringMode)
{
    if(FiringMode == 1)
    {
        if(ShotgunMuzzleFlash == none)
        {
            AttachMuzzleFlash();
        }
        if(ShotgunMuzzleFlash != none)
        {
            ShotgunMuzzleFlash.CauseMuzzleFlash(FiringMode);
            if(ShotgunMuzzleFlash.bAutoActivateShellEject)
            {
                ShotgunMuzzleFlash.CauseShellEject();
            }
        }        
    }
    else
    {
        super.CauseMuzzleFlash(FiringMode);
    }
}

simulated function AttachMuzzleFlash()
{
    super.AttachMuzzleFlash();
    if((WeapMesh != none) && ShotgunMuzzleFlash == none)
    {
        ShotgunMuzzleFlash = new (self) Class'KFMuzzleFlash' (Class'KFWeap_AssaultRifle_FAMAS'.default.ShotgunMuzzleFlashTemplate);
        ShotgunMuzzleFlash.AttachMuzzleFlash(WeapMesh, 'ShotgunMuzzleFlash');
    }
}

simulated function PlayFireAnim(KFPawn P)
{
    local float Duration;
    local name Anim;
    local KFPawn OwnerPawn;

    OwnerPawn = KFPawn(Owner);
    if(Instigator.bIsWalking)
    {
        if(OwnerPawn.FiringMode == 0)
        {
            Anim = 'Iron_Shoot';            
        }
        else
        {
            if(OwnerPawn.FiringMode == 1)
            {
                Anim = 'Shoot_Secondary_Iron';
            }
        }        
    }
    else
    {
        if(OwnerPawn.FiringMode == 0)
        {
            Anim = 'Shoot';            
        }
        else
        {
            if(OwnerPawn.FiringMode == 1)
            {
                Anim = ((OwnerPawn.bIsCrouched) ? 'Shoot_Secondary_CH' : 'Shoot_Secondary');
            }
        }
    }
    Duration = WeapMesh.GetAnimLength(Anim);
    WeapMesh.PlayAnim(Anim, Duration / ThirdPersonAnimRate,, true);
}

simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P, byte ThirdPersonAnimRateByte)
{
    local KFGame.KFPawn.EAnimSlotStance AnimType;

    if(P.FiringMode == 1)
    {
        SpawnTracer(GetAltMuzzleLocation(), HitLocation);        
    }
    else
    {
        SpawnTracer(GetMuzzleLocation(), HitLocation);
    }
    if(!ActorEffectIsRelevant(P, false, MaxFireEffectDistance))
    {
        return false;
    }
    DecodeThirdPersonAnimRate(ThirdPersonAnimRateByte);
    if(!bWeapMeshIsPawnMesh)
    {
        PlayFireAnim(P);
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

simulated function PlayPawnFireAnim(KFPawn P, KFGame.KFPawn.EAnimSlotStance AnimType)
{
    if(P.FiringMode == 0)
    {
        super.PlayPawnFireAnim(P, AnimType);        
    }
    else
    {
        if(P.FiringMode == 1)
        {
            if(P.bIsCrouched)
            {
                P.PlayBodyAnim('ADD_Shoot_Secondary_CH', AnimType, ThirdPersonAnimRate, ShootBlendInTime, ShootBlendOutTime);                
            }
            else
            {
                if(P.bIsWalking)
                {
                    P.PlayBodyAnim('ADD_Shoot_Secondary_Iron', AnimType, ThirdPersonAnimRate, ShootBlendInTime, ShootBlendOutTime);                    
                }
                else
                {
                    P.PlayBodyAnim('ADD_Shoot_Secondary', AnimType, ThirdPersonAnimRate, ShootBlendInTime, ShootBlendOutTime);
                }
            }
        }
    }
}

simulated function Vector GetAltMuzzleLocation(optional byte MuzzleID)
{
    local Vector SocketLocation;

    if((ShotgunMuzzleFlash == none) && MuzzleFlashTemplate != none)
    {
        AttachMuzzleFlash();
    }
    if(ShotgunMuzzleFlash != none)
    {
        WeapMesh.GetSocketWorldLocationAndRotation(ShotgunMuzzleFlash.GetSocketName(), SocketLocation);
        return SocketLocation;
    }
    return GetMuzzleLocation(MuzzleID);
}

defaultproperties
{
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_FAMAS.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_FAMAS.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}