/*******************************************************************************
 * KFWeap_Shotgun_DoubleBarrel generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_DoubleBarrel extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** How much to scale recoil when firing in double barrel fire. */
var(Recoil) float DoubleFireRecoilModifier;
/** Shoot animation to play when shooting both barrels from the hip */
var(Animations) const editconst name FireDoubleAnim;
/** How long the to wait after firing to force zoom out */
var() float ForceReloadTime;
/** How much momentum to apply when fired in double barrel */
var(Recoil) float DoubleBarrelKickMomentum;
/** How much to reduce shoot momentum when falling */
var(Recoil) float FallingMomentumReduction;

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function SendToFiringState(byte FireModeNum)
{
    if((FireModeNum == 1) && AmmoCount[0] < 2)
    {
        super(KFWeapon).SendToFiringState(0);        
    }
    else
    {
        super(KFWeapon).SendToFiringState(FireModeNum);
    }
}

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    if(bUsingSights)
    {
        return FireSightedAnims[FireModeNum];        
    }
    else
    {
        if(FireModeNum == 1)
        {
            return FireDoubleAnim;            
        }
        else
        {
            return FireAnim;
        }
    }
}

simulated function PlayFireEffects(byte FireModeNum, optional Vector HitLocation)
{
    super(KFWeapon).PlayFireEffects(FireModeNum, HitLocation);
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && AmmoCount[0] == 0)
    {
        SetTimer(ForceReloadTime, false, 'ForceReload');
    }
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
    if(FireModeNum == 0)
    {
        if(AmmoCount[0] == 1)
        {
            super(KFWeapon).CauseMuzzleFlash(0);            
        }
        else
        {
            super(KFWeapon).CauseMuzzleFlash(1);
        }        
    }
    else
    {
        super(KFWeapon).CauseMuzzleFlash(0);
        super(KFWeapon).CauseMuzzleFlash(1);
    }
}

simulated state WeaponDoubleBarrelFiring extends WeaponSingleFiring
{
    simulated function ModifyRecoil(out float CurrentRecoilModifier)
    {
        super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
        CurrentRecoilModifier *= DoubleFireRecoilModifier;
    }

    simulated function BeginState(name PreviousStateName)
    {
        local Vector UsedKickMomentum;

        super(WeaponFiring).BeginState(PreviousStateName);
        if(Instigator != none)
        {
            UsedKickMomentum.X = -DoubleBarrelKickMomentum;
            if(Instigator.Physics == 2)
            {
                UsedKickMomentum = UsedKickMomentum >> Instigator.GetViewRotation();
                UsedKickMomentum *= FallingMomentumReduction;                
            }
            else
            {
                UsedKickMomentum = UsedKickMomentum >> Instigator.Rotation;
                UsedKickMomentum.Z = 0;
            }
            Instigator.AddVelocity(UsedKickMomentum, Instigator.Location, none);
        }
    }
    stop;    
}

defaultproperties
{
    DoubleFireRecoilModifier=2.2
    FireDoubleAnim=Shoot_Double
    ForceReloadTime=0.3
    DoubleBarrelKickMomentum=1000
    FallingMomentumReduction=0.5
    NumPellets=/* Array type was not detected. */
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=4
    MagazineCapacity=2
    bHasIronSights=true
    bNoMagazine=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=75
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=3,Y=0,Z=0)
    DOF_FG_FocalRadius=65
    GroupPriority=50
    WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_DBShotgun'
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=46
    InitialSpareMags=11
    AmmoPickupScale=3
    FireAnim=Shoot_Single
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=4,Y=7,Z=-5)
    AttachmentArchetype=KFWeaponAttachment'WEP_Shotgun_DoubleBarrel_ARCH.Wep_Shotgun_DoubleBarrel_3P'
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_DoubleBarrel.MeleeHelper'
    MuzzleFlashTemplate=KFMuzzleFlash'WEP_Shotgun_DoubleBarrel_ARCH.Wep_Shotgun_DoubleBarrel_MuzzleFlash'
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
    AssociatedPerkClass=Class'KFGame.KFPerk_Support'
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=3.5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        SkeletalMesh=SkeletalMesh'wep_1p_double_barrel_mesh.Wep_1stP_Double_Barrel'
        AnimSets(0)=AnimSet'WEP_1P_Double_Barrel_ANIM.Wep_1stP_Double_Barrel_Anim'
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_DoubleBarrel.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Double-barrel Boomstick"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Double_Barrel_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_DoubleBarrel.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        StaticMesh=StaticMesh'WEP_3P_Pickups_MESH.Wep_Double_Barrel_Pickup'
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_DoubleBarrel.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}