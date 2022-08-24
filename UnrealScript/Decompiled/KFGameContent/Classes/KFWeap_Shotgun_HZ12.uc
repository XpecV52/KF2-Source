/*******************************************************************************
 * KFWeap_Shotgun_HZ12 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_HZ12 extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var protected transient int NumShotsFired;
var protected const float PumpFireInterval;

protected simulated function bool IsPumpFire()
{
    return (NumShotsFired % 2) == 0;
}

simulated function float GetFireInterval(byte FireModeNum)
{
    if(IsPumpFire())
    {
        return PumpFireInterval;
    }
    return super(Weapon).GetFireInterval(FireModeNum);
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    ++ NumShotsFired;
    super(KFWeapon).ConsumeAmmo(FireModeNum);
}

simulated function PerformReload(optional byte FireModeNum)
{
    NumShotsFired = 0;
    super(KFWeapon).PerformReload(FireModeNum);
}

simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    if(IsPumpFire())
    {
        return true;
    }
    return false;
}

simulated state WeaponSingleFiring
{
    simulated function RefireCheckTimer()
    {
        super(WeaponFiring).RefireCheckTimer();
    }

    simulated function FireAmmunition()
    {
        super.FireAmmunition();
        if(IsTimerActive('RefireCheckTimer'))
        {
            ClearTimer('RefireCheckTimer');
            TimeWeaponFiring(CurrentFireMode);
        }
    }
    stop;    
}

defaultproperties
{
    PumpFireInterval=0.66
    NumPellets=/* Array type was not detected. */
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=5
    MagazineCapacity=16
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=6,Y=0,Z=0)
    DOF_FG_FocalRadius=95
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=55
    WeaponSelectTexture=Texture2D'WEP_UI_HZ12_TEX.UI_WeaponSelect_HZ12'
    SpareAmmoCapacity=80
    InitialSpareMags=1
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=20,Y=7.6,Z=-3)
    AttachmentArchetype=KFWeaponAttachment'WEP_HZ12_ARCH.Wep_HZ12_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_HZ12.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_HZ12_ARCH.Wep_HZ12_MuzzleFlash'
    maxRecoilPitch=900
    minRecoilPitch=775
    maxRecoilYaw=500
    minRecoilYaw=-500
    RecoilRate=0.085
    RecoilBlendOutRatio=1.1
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
    AssociatedPerkClasses=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_HZ12_MESH.Wep_1stP_HZ12_Rig'
        AnimSets(0)=AnimSet'WEP_1P_HZ12_ANIM.Wep_1stP_HZ12_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_HZ12.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HZ12 Multi-Action"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_HZ12_MESH.Wep_3rdP_HZ12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_HZ12.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_HZ12_MESH.Wep_3rdP_HZ12_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_HZ12.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}