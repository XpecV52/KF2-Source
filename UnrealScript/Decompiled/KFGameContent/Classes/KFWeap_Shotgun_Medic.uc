/*******************************************************************************
 * KFWeap_Shotgun_Medic generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_Medic extends KFWeap_MedicBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var(Weapon) array<byte> NumPellets;

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, Vector RealStartLoc, Vector AimDir)
{
    local int I;
    local Rotator AimRot;
    local KFPerk InstigatorPerk;

    if(CurrentFireMode == 4)
    {
        return super.SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }
    InstigatorPerk = GetPerk();
    if(InstigatorPerk != none)
    {
        Spread[CurrentFireMode] = default.Spread[CurrentFireMode] * InstigatorPerk.GetTightChokeModifier();
    }
    AimRot = rotator(AimDir);
    I = 0;
    J0xC7:

    if(I < NumPellets[CurrentFireMode])
    {
        super.SpawnProjectile(KFProjClass, RealStartLoc, vector(Class'KFWeap_ShotgunBase'.static.AddMultiShotSpread(AimRot, Spread[CurrentFireMode])));
        ++ I;
        goto J0xC7;
    }
    return none;
}

simulated function Rotator AddSpread(Rotator BaseAim)
{
    return BaseAim;
}

function HandleWeaponShotTaken(byte FireMode)
{
    if(KFPlayer != none)
    {
        KFPlayer.AddShotsFired(NumPellets[FireMode]);
    }
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    local float BaseDamage, DoTDamage;
    local class<KFDamageType> DamageType;

    BaseDamage = default.InstantHitDamage[0];
    DamageType = class<KFDamageType>(default.InstantHitDamageTypes[0]);
    if((DamageType != none) && DamageType.default.DoT_Type != 0)
    {
        DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
    }
    return (BaseDamage * float(default.NumPellets[0])) + DoTDamage;
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 1;
}

defaultproperties
{
    NumPellets(0)=6
    NumPellets(1)=1
    HealAmount=15
    HealFullRechargeSeconds=12
    PackageKey="Medic_Shotgun"
    FirstPersonMeshName="WEP_1P_Medic_Shotgun_MESH.Wep_1stP_Medic_Shotgun_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="wep_3p_medic_shotgun_mesh.Wep_Medic_Shotgun_Pickup"
    AttachmentArchetypeName="WEP_Medic_Shotgun_ARCH.Wep_Medic_Shotgun_3P"
    MuzzleFlashTemplateName="WEP_Medic_Shotgun_ARCH.Wep_Medic_Shotgun_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=6
    MagazineCapacity=10
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=12,Y=0,Z=0)
    DOF_FG_FocalRadius=95
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=75
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_MedicShotgun'
    SecondaryAmmoTexture=Texture2D'UI_SecondaryAmmo_TEX.MedicDarts'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=80
    InitialSpareMags=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=14,Y=6.5,Z=-3.5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_Medic.MeleeHelper'
    maxRecoilPitch=400
    minRecoilPitch=375
    maxRecoilYaw=250
    minRecoilYaw=-250
    RecoilRate=0.075
    RecoilBlendOutRatio=0.25
    RecoilViewRotationScale=0.7
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=1.5
    FallingRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_Medic.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HMTech-301 Shotgun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_Medic.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_Medic.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}