/*******************************************************************************
 * KFWeapAttach_Pulverizer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_Pulverizer extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

const PulverizerShoot_F = 'Atk_F_Shoot';
const PulverizerShoot_B = 'Atk_B_Shoot';
const PulverizerShoot_L = 'Atk_L_Shoot';
const PulverizerShoot_R = 'Atk_R_Shoot';
const CH_PulverizerShoot_F = 'Atk_F_Shoot_CH';
const CH_PulverizerShoot_B = 'Atk_B_Shoot_CH';
const CH_PulverizerShoot_L = 'Atk_L_Shoot_CH';
const CH_PulverizerShoot_R = 'Atk_R_Shoot_CH';

var transient KFGame.KFWeaponAttachment.EWeaponState NextPulverizerShootType;

simulated function bool ThirdPersonFireEffects(Vector HitLocation, KFPawn P, byte ThirdPersonAnimRateByte)
{
    DecodeThirdPersonAnimRate(ThirdPersonAnimRateByte);
    if(!P.IsDoingSpecialMove())
    {
        PlayPulverizerShoot(P);
    }
    if(!ActorEffectIsRelevant(P, false, MaxFireEffectDistance))
    {
        return false;
    }
    CauseMuzzleFlash(P.FiringMode);
    return true;
}

simulated function PlayPulverizerShoot(KFPawn P)
{
    switch(NextPulverizerShootType)
    {
        case 23:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Atk_B_Shoot_CH' : 'Atk_B_shoot'));
            break;
        case 22:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Atk_F_Shoot_CH' : 'Atk_F_shoot'));
            break;
        case 20:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Atk_L_Shoot_CH' : 'Atk_L_shoot'));
            break;
        case 21:
            PlayCharacterMeshAnim(P, ((P.bIsCrouched) ? 'Atk_R_Shoot_CH' : 'Atk_R_shoot'));
            break;
        default:
            break;
    }
    NextPulverizerShootType = 255;
}

simulated function UpdateThirdPersonWeaponAction(KFGame.KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P, byte ThirdPersonAnimRateByte)
{
    switch(NewWeaponState)
    {
        case 23:
        case 22:
        case 20:
        case 21:
            NextPulverizerShootType = NewWeaponState;
            break;
        default:
            break;
    }
    super.UpdateThirdPersonWeaponAction(NewWeaponState, P, ThirdPersonAnimRateByte);
}

defaultproperties
{
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_Pulverizer.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_Pulverizer.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}