/*******************************************************************************
 * KFWeap_Edged_Katana generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Edged_Katana extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    BlockDamageMitigation=0.6
    ParryDamageMitigationPercent=0.5
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
    PackageKey="Katana"
    FirstPersonMeshName="WEP_1P_KATANA_MESH.Wep_1stP_Katana_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_KATANA_MESH.Wep_Katana_Pickup"
    AttachmentArchetypeName="WEP_Katana_ARCH.Wep_Katana_3P"
    InventorySize=4
    GroupPriority=100
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Katana'
    PlayerViewOffset=(X=2,Y=0,Z=0)
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        MeleeImpactCamShakeScale=0.03
        MaxHitRange=190
        HitboxChain=/* Array type was not detected. */
        WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Edged_Katana.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Edged_Katana.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Katana"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Katana.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Katana.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}