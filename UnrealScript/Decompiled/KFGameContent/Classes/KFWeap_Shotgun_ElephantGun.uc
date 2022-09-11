/*******************************************************************************
 * KFWeap_Shotgun_ElephantGun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Shotgun_ElephantGun extends KFWeap_ShotgunBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** How much to scale recoil when firing in double barrel fire. */
var(Recoil) float QuadFireRecoilModifier;
/** Shoot animation to play when shooting both barrels from the hip */
var(Animations) const editconst name FireQuadAnim;
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
    if(ReloadStatus == 2)
    {
        return;
    }
    if(AmmoCount[0] <= 1)
    {
        StartFire(0);        
    }
    else
    {
        AmmoCost[1] = byte(Max(1, AmmoCount[0]));
        StartFire(1);
    }
}

simulated function byte GetNumProjectilesToFire(byte FireModeNum)
{
    local float MagPercentFull;

    if(FireModeNum == 1)
    {
        MagPercentFull = float(AmmoCount[0]) / float(default.AmmoCost[1]);
        return byte(float(NumPellets[FireModeNum]) * MagPercentFull);
    }
    return NumPellets[CurrentFireMode];
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
            return FireQuadAnim;            
        }
        else
        {
            return FireAnim;
        }
    }
}

simulated function BeginState(name PreviousStateName)
{
    local Vector UsedKickMomentum;

    super(Object).BeginState(PreviousStateName);
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

simulated state WeaponQuadBarrelFiring extends WeaponSingleFiring
{
    simulated function ModifyRecoil(out float CurrentRecoilModifier)
    {
        super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
        CurrentRecoilModifier *= QuadFireRecoilModifier;
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
    QuadFireRecoilModifier=2
    FireQuadAnim=Shoot_Double
    DoubleBarrelKickMomentum=1000
    FallingMomentumReduction=0.5
    PackageKey="Quad_Barrel"
    FirstPersonMeshName="wep_1p_quad_barrel_mesh.Wep_1stP_Quad_Barrel"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Quad_Barrel_MESH.Wep_3rdP_Quad_Barrel_Pickup"
    AttachmentArchetypeName="WEP_Quad_Barrel_ARCH.Wep_Quad_Barrel_3P"
    MuzzleFlashTemplateName="WEP_Quad_Barrel_ARCH.Wep_Quad_Barrel_MuzzleFlash"
    bHasIronSights=true
    bNoMagazine=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=false
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=10
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=60
    MeshIronSightFOV=52
    PlayerIronSightFOV=70
    IronSightPosition=(X=3,Y=0,Z=0)
    DOF_FG_FocalRadius=65
    GroupPriority=110
    WeaponSelectTexture=Texture2D'WEP_UI_Quad_Barrel_TEX.UI_WeaponSelect_QuadBarrel'
    MagazineCapacity=4
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=48
    InitialSpareMags=3
    AmmoPickupScale=2
    ForceReloadTimeOnEmpty=0.3
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    FireAnim=Shoot_Single
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=15,Y=8,Z=-4.5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Shotgun_ElephantGun.MeleeHelper'
    NumPellets=/* Array type was not detected. */
    maxRecoilPitch=1200
    minRecoilPitch=775
    maxRecoilYaw=800
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
    HippedRecoilModifier=1.1
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
    FireOffset=(X=25,Y=3.5,Z=-4)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Shotgun_ElephantGun.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Doomstick"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_ElephantGun.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Shotgun_ElephantGun.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}