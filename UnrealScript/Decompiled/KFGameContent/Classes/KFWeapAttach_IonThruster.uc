/*******************************************************************************
 * KFWeapAttach_IonThruster generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeapAttach_IonThruster extends KFWeaponAttachment
    hidecategories(Navigation,Object,Movement,Attachment,Collision,Physics,Advanced,Debug,Mobile);

var name UltimateAttackAnim;
var name UltimateAttackAnimCrouch;

simulated function float PlayMeleeAtkAnim(KFGame.KFWeaponAttachment.EWeaponState NewWeaponState, KFPawn P)
{
    if(P.IsFirstPerson())
    {
        return 0;
    }
    if((Instigator != none) && Instigator.FiringMode == 6)
    {
        if(P.bIsCrouched)
        {
            return PlayCharacterMeshAnim(P, UltimateAttackAnimCrouch);            
        }
        else
        {
            return PlayCharacterMeshAnim(P, UltimateAttackAnim);
        }
    }
    return super.PlayMeleeAtkAnim(NewWeaponState, P);
}

defaultproperties
{
    UltimateAttackAnim=Super_Attack
    UltimateAttackAnimCrouch=Super_Attack_CH
    begin object name=SkeletalMeshComponent0 class=SkeletalMeshComponent
        Animations=AnimNodeSequence'Default__KFWeapAttach_IonThruster.SkeletalMeshComponent0.MeshSequenceA'
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFWeapAttach_IonThruster.SkeletalMeshComponent0'
    WeapMesh=SkeletalMeshComponent0
}