/*******************************************************************************
 * KFWeap_Shotgun_Nailgun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_Nailgun extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** Animations to play when the weapon is alt fired when sighted */
var(Animations) const editconst array<editconst name> AltFireSightedAnims;
/** Animation to play when the weapon is alt fired */
var(Animations) const editconst name AltFireAnim;
/** How much to scale recoil when alt firing */
var(Recoil) float AltFireRecoilModifier;

simulated function ConsumeAmmo(byte FireModeNum)
{
    local int AmountToConsume;

    if((Role == ROLE_Authority) || bAllowClientAmmoTracking)
    {
        if((MagazineCapacity[GetAmmoType(FireModeNum)] > 0) && AmmoCount[GetAmmoType(FireModeNum)] > 0)
        {
            AmountToConsume = Min(NumPellets[CurrentFireMode], AmmoCount[GetAmmoType(FireModeNum)]);
            AmmoCount[GetAmmoType(FireModeNum)] -= byte(AmountToConsume);
        }
    }
}

simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
    return byte(Min(NumPellets[CurrentFireMode], AmmoCount[GetAmmoType(CurrentFireMode)]));
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if(FireModeNum == 0)
    {
        return super.GetWeaponFireAnim(FireModeNum);
    }
    if(bUsingSights)
    {
        return AltFireSightedAnims[Rand(AltFireSightedAnims.Length)];        
    }
    else
    {
        return AltFireAnim;
    }
}

simulated state WeaponAltFiring extends WeaponSingleFiring
{
    simulated function ModifyRecoil(out float CurrentRecoilModifier)
    {
        super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
        CurrentRecoilModifier *= AltFireRecoilModifier;
    }

    simulated function BeginState(name PreviousStateName)
    {
        super(WeaponFiring).BeginState(PreviousStateName);
        if((RecoilRate > float(0)) && RecoilBlendOutRatio > float(0))
        {
            RecoilYawBlendOutRate = int(((float(maxRecoilYaw) * AltFireRecoilModifier) / RecoilRate) * RecoilBlendOutRatio);
            RecoilPitchBlendOutRate = int(((float(maxRecoilPitch) * AltFireRecoilModifier) / RecoilRate) * RecoilBlendOutRatio);
        }
    }
    stop;    
}

defaultproperties
{
    AltFireSightedAnims(0)=Shoot_Iron_Single
    AltFireAnim=Shoot_Single
    AltFireRecoilModifier=0.5
    NumPellets=/* Array type was not detected. */
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=6
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=12,Y=0,Z=0)
    GroupPriority=50
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_NailShotgun'
    MagazineCapacity=42
    MaxSpareAmmo=336
    InitialSpareMags=4
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=10,Y=8,Z=-4)
    AttachmentArchetype=KFWeaponAttachment'WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_Nailgun.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Nail_Shotgun_ARCH.Wep_Nail_Shotgun_MuzzleFlash'
    maxRecoilPitch=550
    minRecoilPitch=450
    maxRecoilYaw=250
    minRecoilYaw=-250
    RecoilRate=0.085
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=250
    RecoilISMinPitchLimit=65485
    FallingRecoilModifier=1.5
    AssociatedPerkClass=Class'KFGame.KFPerk_Berserker'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_Nail_Shotgun_MESH.Wep_1stP_Nail_ShotGun_Rig'
        AnimSets(0)=AnimSet'WEP_1P_Nail_Shotgun_ANIM.Wep_1stP_Nail_Shotgun_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_Nailgun.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="VLAD-1000 Nailgun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_NailShotgun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_Nailgun.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_NailShotgun_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_Nailgun.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}