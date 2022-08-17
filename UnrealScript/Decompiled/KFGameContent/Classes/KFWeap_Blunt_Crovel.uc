/*******************************************************************************
 * KFWeap_Blunt_Crovel generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Blunt_Crovel extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    ParryStrength=3
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Crovel'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=4
    GroupPriority=25
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Crovel'
    AttachmentArchetype=KFWeaponAttachment'WEP_Crovel_ARCH.Wep_Crovel_3P'
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_B=/* Array type was not detected. */
        ChainSequence_L=/* Array type was not detected. */
        ChainSequence_R=/* Array type was not detected. */
        MeleeImpactCamShakeScale=0.4
        HitboxChain=/* Array type was not detected. */
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Blunt_Crovel.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Crovel_MESH.Wep_1stP_Crovel_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Crovel_ANIM.WEP_1P_Crovel_ANIM'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Blunt_Crovel.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Crovel Survival Tool"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Crovel_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_Crovel.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Crovel_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Blunt_Crovel.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}