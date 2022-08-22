/*******************************************************************************
 * KFWeap_Shotgun_AA12 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_AA12 extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=10
    MagazineCapacity=20
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=8,Y=0,Z=0)
    DOF_FG_FocalRadius=85
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=100
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AA12'
    SpareAmmoCapacity=120
    InitialSpareMags=1
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=8.5,Z=0)
    AttachmentArchetype=KFWeaponAttachment'WEP_AA12_ARCH.Wep_AA12_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_AA12.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_AA12_ARCH.Wep_AA12_MuzzleFlash'
    maxRecoilPitch=250
    minRecoilPitch=225
    maxRecoilYaw=125
    minRecoilYaw=-125
    RecoilRate=0.075
    RecoilBlendOutRatio=0.25
    RecoilViewRotationScale=0.7
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    FallingRecoilModifier=1.5
    AssociatedPerkClass=Class'KFGame.KFPerk_Support'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'Wep_1P_AA12_MESH.Wep_1stP_AA12_Rig'
        AnimSets(0)=AnimSet'Wep_1P_AA12_ANIM.Wep_1stP_AA12_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_AA12.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="AA-12 Auto Shotgun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AA12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_AA12.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_AA12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_AA12.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}