/*******************************************************************************
 * KFWeap_GrenadeLauncher_HX25 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_GrenadeLauncher_HX25 extends KFWeap_GrenadeLauncher_Base
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var(Weapon) array<byte> NumPellets;
var array<Vector2D> PelletSpread;
var float LastSubmunitionFireTime;

simulated function KFProjectile SpawnProjectile(class<KFProjectile> KFProjClass, Vector RealStartLoc, Vector AimDir)
{
    local int I;
    local Rotator AimRot;

    if(CurrentFireMode == 4)
    {
        return super(KFWeapon).SpawnProjectile(KFProjClass, RealStartLoc, AimDir);
    }
    AimRot = rotator(AimDir);
    I = 0;
    J0x58:

    if(I < GetNumProjectilesToFire(CurrentFireMode))
    {
        super(KFWeapon).SpawnProjectile(KFProjClass, RealStartLoc, vector(AddMultiShotSpread(AimRot, byte(I))));
        ++ I;
        goto J0x58;
    }
    return none;
}

function HandleWeaponShotTaken(byte FireMode)
{
    if(KFPlayer != none)
    {
        KFPlayer.AddShotsFired(GetNumProjectilesToFire(FireMode));
    }
}

simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
    return NumPellets[CurrentFireMode];
}

simulated function Rotator AddSpread(Rotator BaseAim)
{
    return BaseAim;
}

simulated function Rotator AddMultiShotSpread(Rotator BaseAim, byte PelletNum)
{
    local Vector X, Y, Z;
    local float CurrentSpread, RandY, RandZ;

    CurrentSpread = Spread[CurrentFireMode];
    if(CurrentSpread == float(0))
    {
        return BaseAim;        
    }
    else
    {
        GetAxes(BaseAim, X, Y, Z);
        RandY = PelletSpread[PelletNum].Y * RandRange(0.5, 1.5);
        RandZ = PelletSpread[PelletNum].X * RandRange(0.5, 1.5);
        return rotator((X + ((RandY * CurrentSpread) * Y)) + ((RandZ * CurrentSpread) * Z));
    }
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    local float BaseDamage, DoTDamage;
    local class<KFDamageType> DamageType;
    local GameExplosion ExplosionInstance;

    ExplosionInstance = class<KFProjectile>(default.WeaponProjectiles[0]).default.ExplosionTemplate;
    BaseDamage = default.InstantHitDamage[0] + ExplosionInstance.Damage;
    DamageType = class<KFDamageType>(ExplosionInstance.MyDamageType);
    if((DamageType != none) && DamageType.default.DoT_Type != 0)
    {
        DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
    }
    return (BaseDamage * float(default.NumPellets[0])) + DoTDamage;
}

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetAltTraderFilter()
{
    return 0;
}

defaultproperties
{
    NumPellets(0)=7
    PelletSpread(0)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.UnrealStreamImplementations.ReadName(IUnrealStream stream)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(1)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(2)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(3)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(4)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(5)=
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PelletSpread(6)=FireModeIconPaths=/* Array type was not detected. */,
/* Exception thrown while deserializing PelletSpread
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    FireModeIconPaths=/* Array type was not detected. */
    InventoryGroup=EInventoryGroup.IG_Secondary
    InventorySize=4
    MagazineCapacity=1
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    MeshIronSightFOV=52
    PlayerIronSightFOV=73
    FastZoomOutTime=0.2
    GroupPriority=25
    WeaponSelectTexture=Texture2D'WEP_UI_HX25_Pistol_TEX.UI_WeaponSelect_HX25'
    SpareAmmoCapacity=29
    InitialSpareMags=17
    AmmoPickupScale=3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=13,Y=13,Z=-4)
    AttachmentArchetype=KFWeaponAttachment'WEP_HX25_Pistol_ARCH.Wep_HX25_Pistol_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_GrenadeLauncher_HX25.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_HX25_Pistol_ARCH.Wep_HX25_Pistol_MuzzleFlash'
    maxRecoilPitch=900
    minRecoilPitch=775
    maxRecoilYaw=500
    minRecoilYaw=-500
    RecoilRate=0.04
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
    AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=23,Y=4,Z=-3)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'WEP_1P_HX25_Pistol_MESH.Wep_1stP_HX25_Pistol_Rig'
        AnimSets(0)=AnimSet'WEP_1P_HX25_Pistol_ANIM.Wep_1stP_HX25_Pistol_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_GrenadeLauncher_HX25.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="HX25 Grenade Pistol"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_hx25_pistol_mesh.WEP_HX25_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_HX25.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'wep_3p_hx25_pistol_mesh.WEP_HX25_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_GrenadeLauncher_HX25.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}