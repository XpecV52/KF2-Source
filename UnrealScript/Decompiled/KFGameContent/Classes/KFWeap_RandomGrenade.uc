/*******************************************************************************
 * KFWeap_RandomGrenade generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_RandomGrenade extends KFWeapon
    abstract
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_RandomGrenade.MeleeHelper'
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_RandomGrenade.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Random Grenade"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_RandomGrenade.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_RandomGrenade.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}