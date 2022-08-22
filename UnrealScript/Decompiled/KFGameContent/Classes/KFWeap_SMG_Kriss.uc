/*******************************************************************************
 * KFWeap_SMG_Kriss generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_SMG_Kriss extends KFWeap_SMGBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=1
    InventorySize=6
    MagazineCapacity=33
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    MeshIronSightFOV=45
    IronSightPosition=(X=15,Y=0,Z=0)
    GroupPriority=100
    WeaponSelectTexture=Texture2D'WEP_UI_KRISS_TEX.UI_WeaponSelect_KRISS'
    SpareAmmoCapacity=495
    InitialSpareMags=4
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=20,Y=9.5,Z=-3)
    AttachmentArchetype=KFWeaponAttachment'wep_kriss_arch.Wep_KRISS_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_SMG_Kriss.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'wep_kriss_arch.Wep_KRISS_MuzzleFlash'
    maxRecoilPitch=50
    minRecoilPitch=40
    maxRecoilYaw=80
    minRecoilYaw=-80
    RecoilRate=0.045
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=100
    RecoilISMinYawLimit=65435
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    JoggingRecoilModifier=1.2
    WalkingRecoilModifier=1.1
    IronSightMeshFOVCompensationScale=1.85
    AssociatedPerkClass=Class'KFGame.KFPerk_SWAT'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'wep_1p_kriss_mesh.Wep_1stP_KRISS_Rig'
        AnimSets(0)=AnimSet'wep_1p_kriss_anim.wep_1p_kriss_anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_SMG_Kriss.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Kriss SMG"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_kriss_mesh.Wep_KRISS_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_Kriss.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_kriss_mesh.Wep_KRISS_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_SMG_Kriss.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}