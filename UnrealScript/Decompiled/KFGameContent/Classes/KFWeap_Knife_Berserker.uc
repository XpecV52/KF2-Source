/*******************************************************************************
 * KFWeap_Knife_Berserker generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Knife_Berserker extends KFWeap_Edged_Knife
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    PackageKey="BerserkerKnife"
    FirstPersonMeshName="WEP_1P_BerserkerKnife_MESH.Wep_1stP_BerserkerKnife_Rig"
    AttachmentArchetypeName="WEP_BerserkerKnife_ARCH.Wep_Knife_3P"
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_BerserkerKnife'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Knife_Berserker.MeleeHelper'
    AssociatedPerkClasses=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        AnimSets(0)=AnimSet'WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Knife_Berserker.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Lawn Mower Blade"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Knife_Berserker.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Knife_Berserker.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}