/*******************************************************************************
 * KFCarryableObject generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFCarryableObject extends KFWeap_MeleeBase
    abstract
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

reliable client simulated function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
    super(KFWeapon).ClientWeaponSet(false);
}

simulated function float GetWeaponRating()
{
    return 1000;
}

defaultproperties
{
    WeaponDryFireSnd(0)=none
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFCarryableObject.MeleeHelper'
    AssociatedPerkClasses(0)=none
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFCarryableObject.FirstPersonMesh'
    Mesh=FirstPersonMesh
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFCarryableObject.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFCarryableObject.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}