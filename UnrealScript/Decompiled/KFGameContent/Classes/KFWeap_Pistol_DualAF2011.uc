/*******************************************************************************
 * KFWeap_Pistol_DualAF2011 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Pistol_DualAF2011 extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var Vector BarrelOffset;

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, Vector RealStartLoc, Vector AimDir)
{
    if(CurrentFireMode == 4)
    {
        return super(KFWeapon).SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }
    super(KFWeapon).SpawnProjectile(KFProjClass, RealStartLoc + (BarrelOffset / 2), AimDir);
    super(KFWeapon).SpawnProjectile(KFProjClass, RealStartLoc - (BarrelOffset / 2), AimDir);
    return none;
}

defaultproperties
{
    BarrelOffset=(X=10,Y=0,Z=0)
    LeftFireOffset=(X=17,Y=-4,Z=-2.25)
    SingleClass=Class'KFWeap_Pistol_AF2011'
    BonesToLockOnEmpty_L=/* Array type was not detected. */
    InventorySize=6
    MagazineCapacity=32
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=77
    PlayerIronSightFOV=77
    IronSightPosition=(X=-1,Y=0,Z=0)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=38
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=45
    WeaponSelectTexture=Texture2D'WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=272
    InitialSpareMags=2
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=9,Y=0,Z=-5)
    AttachmentArchetype=KFWeapAttach_DualBase'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Pistol_DualAF2011.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Dual_AF2001_ARCH.Wep_Dual_AF2001_MuzzleFlash'
    maxRecoilPitch=650
    minRecoilPitch=550
    maxRecoilYaw=550
    minRecoilYaw=-550
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1250
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=17,Y=4,Z=-2.25)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'wep_1p_dual_af2001_mesh.Wep_1stP_Dual_AF2001_Rig'
        AnimSets(0)=AnimSet'wep_1p_dual_af2001_anim.Wep_1stP_Dual_AF2001_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Pistol_DualAF2011.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Dual AF2011-A1"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_AF2001_MESH.Wep_3rdP_AF2001_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_DualAF2011.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_AF2001_MESH.Wep_3rdP_AF2001_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Pistol_DualAF2011.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}