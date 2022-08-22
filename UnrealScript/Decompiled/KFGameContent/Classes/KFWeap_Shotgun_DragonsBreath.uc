/*******************************************************************************
 * KFWeap_Shotgun_DragonsBreath generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_DragonsBreath extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetAltTraderFilter()
{
    return 4;
}

defaultproperties
{
    NumPellets=/* Array type was not detected. */
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=5
    MagazineCapacity=6
    bHasIronSights=true
    bCanBeReloaded=true
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=7,Y=0,Z=0)
    DOF_FG_FocalRadius=95
    DOF_FG_MaxNearBlurSize=2.5
    GroupPriority=50
    WeaponSelectTexture=Texture2D'WEP_UI_DragonsBreath.UI_WeaponSelect_DragonsBreath'
    SpareAmmoCapacity=45
    InitialSpareMags=3
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=10,Y=7.5,Z=-4.5)
    AttachmentArchetype=KFWeaponAttachment'WEP_DragonsBreath_ARCH.Wep_DragonsBreath_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_DragonsBreath.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_DragonsBreath_ARCH.Wep_DragonsBreath_MuzzleFlash_3P'
    maxRecoilPitch=900
    minRecoilPitch=775
    maxRecoilYaw=500
    minRecoilYaw=-500
    RecoilRate=0.085
    RecoilBlendOutRatio=0.35
    RecoilViewRotationScale=0.8
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=1.25
    FallingRecoilModifier=1.5
    AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_DragonsBreath_MESH.Wep_1stP_DragonsBreath_Rig'
        AnimSets(0)=AnimSet'WEP_1P_DragonsBreath_ANIM.WEP_1P_DragonsBreath_ANIM'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_DragonsBreath.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Incendiary Trench Gun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_DragonsBreath_MESH.Wep_DragonsBreath_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_DragonsBreath.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_DragonsBreath_MESH.Wep_DragonsBreath_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_DragonsBreath.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}