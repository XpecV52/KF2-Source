/*******************************************************************************
 * KFWeap_AssaultRifle_DualMKb42_Hans generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_DualMKb42_Hans extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, Vector RealStartLoc, Vector AimDir)
{
    local KFProjectile SpawnedProjectile;
    local int ProjDamage;

    SpawnedProjectile = Spawn(KFProjClass, self,, RealStartLoc);
    if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
    {
        if((InstantHitDamage.Length > CurrentFireMode) && InstantHitDamageTypes.Length > CurrentFireMode)
        {
            ProjDamage = int(InstantHitDamage[CurrentFireMode]);
            SpawnedProjectile.Damage = float(ProjDamage);
            SpawnedProjectile.MyDamageType = InstantHitDamageTypes[CurrentFireMode];
        }
        if(SpawnedProjectile != none)
        {
            SpawnedProjectile.PenetrationPower = GetInitialPenetrationPower(CurrentFireMode);
        }
        SpawnedProjectile.Init(AimDir);
    }
    return SpawnedProjectile;
}

simulated function ConsumeAmmo(byte FireModeNum);

defaultproperties
{
    SingleFireMode=1
    InventorySize=6
    bHasIronSights=true
    bUseAnimLenEquipTime=false
    MeshFOV=75
    MeshIronSightFOV=33
    PlayerIronSightFOV=70
    GroupPriority=50
    UITexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AK12'
    MagazineCapacity=60
    MaxSpareAmmo=270
    InitialSpareMags=3
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=2,Y=8,Z=-3)
    AttachmentArchetype=KFWeapAttach_DualBase'WEP_DualMKB42_ARCH.Wep_DualMKB42_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_DualMKb42_Hans.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_L85A2_ARCH.Wep_L85A2_MuzzleFlash'
    maxRecoilPitch=200
    minRecoilPitch=150
    maxRecoilYaw=175
    minRecoilYaw=-125
    RecoilRate=0.085
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=2.5
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=32,Y=4,Z=-5)
    bCanThrow=false
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_DualMKb42_Hans.FirstPersonMesh'
    Mesh=FirstPersonMesh
    bDropOnDeath=false
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_DualMKb42_Hans.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_DualMKb42_Hans.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}