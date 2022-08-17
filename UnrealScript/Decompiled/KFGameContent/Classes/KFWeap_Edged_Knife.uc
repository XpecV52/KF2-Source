/*******************************************************************************
 * KFWeap_Edged_Knife generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Edged_Knife extends KFWeap_MeleeBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    MaxChainAtkCount=4
    ParryStrength=1
    ParryDamageMitigationPercent=0.3
    BlockSound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
    ParrySound=AkEvent'WW_WEP_Bullet_Impacts.Play_Block_MEL_Katana'
    bIsBackupWeapon=true
    GroupPriority=10
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Knife'
    PlayerViewOffset=(X=10,Y=10,Z=0)
    AttachmentArchetype=KFWeaponAttachment'WEP_CommandoKnife_ARCH.Wep_CommandoKnife_3P'
    begin object name=MeleeHelper class=KFMeleeHelperWeapon
        ChainSequence_F=/* Array type was not detected. */
        ChainSequence_B=/* Array type was not detected. */
        ChainSequence_L=/* Array type was not detected. */
        ChainSequence_R=/* Array type was not detected. */
        WorldImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Bladed_melee_impact'
        MeleeImpactCamShakeScale=0.2
        MaxHitRange=220
        HitboxChain=/* Array type was not detected. */
    object end
    // Reference: KFMeleeHelperWeapon'Default__KFWeap_Edged_Knife.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    AssociatedPerkClass=Class'KFGame.KFPerk_Commando'
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    bCanThrow=false
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_CommandoKnife_MESH.Wep_1stP_CommKnife_Rig'
        AnimSets(0)=AnimSet'WEP_1P_CommandoKnife_ANIM.Wep_1stP_CommKnife_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Edged_Knife.FirstPersonMesh'
    Mesh=FirstPersonMesh
    bDropOnDeath=false
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_CommandoKnife_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Knife.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_CommandoKnife_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Edged_Knife.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}