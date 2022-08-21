/*******************************************************************************
 * KFWeap_Edged_Zweihander generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Edged_Zweihander extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    ParryStrength=5
    BlockDamageMitigation=0.6
    ParryDamageMitigationPercent=0.6
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Parry_Metal'
    InventorySize=6
    GroupPriority=85
    WeaponSelectTexture=Texture2D'WEP_UI_Zweihander_TEX.UI_WeaponSelect_Zweihander'
    PlayerViewOffset=(X=2,Y=0,Z=0)
    AttachmentArchetype=KFWeaponAttachment'WEP_Zweihander_ARCH.Wep_Zweihander_3P'
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_F=/* Array type was not detected. */
        ChainSequence_B=/* Array type was not detected. */
        WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
        MeleeImpactCamShakeScale=0.5
        MaxHitRange=400
        HitboxChain=/* Array type was not detected. */
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Edged_Zweihander.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
    InstantHitDamage=/* Array type was not detected. */
    InstantHitMomentum=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Zweihander_MESH.Wep_1stP_Zweihander_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Zweihander_ANIM.Wep_1stP_Zweihander_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Edged_Zweihander.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Zweihander"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Zweihander_MESH.Wep_Zweihander_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Zweihander.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Zweihander_MESH.Wep_Zweihander_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Zweihander.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}