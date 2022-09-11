/*******************************************************************************
 * KFWeap_Ice_FreezeThrower generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Ice_FreezeThrower extends KFWeap_FlameBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

/** Shoot animation to play when shooting secondary fire */
var(Animations) const editconst name FireHeavyAnim;
/** Shoot animation to play when shooting secondary fire last shot */
var(Animations) const editconst name FireLastHeavyAnim;
/** Shoot animation to play when shooting secondary fire last shot when aiming */
var(Animations) const editconst name FireLastHeavySightedAnim;
/** Alt-fire explosion template */
var() GameExplosion ExplosionTemplate;
var protected const float AltFireRecoilScale;

simulated function name GetWeaponFireAnim(byte FireModeNum)
{
    local bool bPlayFireLast;

    bPlayFireLast = ShouldPlayFireLast(FireModeNum);
    if(bUsingSights)
    {
        if(bPlayFireLast)
        {
            if(FireModeNum == 1)
            {
                return FireLastHeavySightedAnim;                
            }
            else
            {
                return FireLastSightedAnim;
            }            
        }
        else
        {
            return FireSightedAnims[FireModeNum];
        }        
    }
    else
    {
        if(bPlayFireLast)
        {
            if(FireModeNum == 1)
            {
                return FireLastHeavyAnim;                
            }
            else
            {
                return FireLastAnim;
            }            
        }
        else
        {
            if(FireModeNum == 1)
            {
                return FireHeavyAnim;                
            }
            else
            {
                return FireAnim;
            }
        }
    }
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

simulated function Rotator AddSpread(Rotator BaseAim)
{
    return BaseAim;
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
    local bool bRequestReload;

    bRequestReload = super(KFWeapon).ShouldAutoReload(FireModeNum);
    if((FireModeNum == 1) && AmmoCount[0] > 0)
    {
        bPendingAutoSwitchOnDryFire = false;
        return false;
    }
    return bRequestReload;
}

function HandleWeaponShotTaken(byte FireMode)
{
    if((KFPlayer != none) && FireMode == 1)
    {
        KFPlayer.AddShotsFired(GetNumProjectilesToFire(FireMode));
        return;
    }
    super(KFWeapon).HandleWeaponShotTaken(FireMode);
}

simulated function ModifyRecoil(out float CurrentRecoilModifier)
{
    if(CurrentFireMode == 1)
    {
        CurrentRecoilModifier *= AltFireRecoilScale;
    }
    super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
}

simulated function bool IsHeavyWeapon()
{
    return true;
}

simulated function SetPilotDynamicLightEnabled(bool bLightEnabled);

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 5;
}

defaultproperties
{
    FireHeavyAnim=Shoot_Heavy
    FireLastHeavyAnim=Shoot_Heavy_Last
    FireLastHeavySightedAnim=Shoot_Heavy_Iron_Last
    AltFireRecoilScale=4
    bWarnAIWhenFiring=true
    FlameSprayArchetype=SprayActor_Flame'WEP_CryoGun_ARCH.Wep_CryoGun_IceSpray'
    PSC_PilotLight=none
    begin object name=FlameEndSpray0 class=KFParticleSystemComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFParticleSystemComponent'Default__KFWeap_Ice_FreezeThrower.FlameEndSpray0'
    PSC_EndSpray=FlameEndSpray0
    MinAmmoConsumed=4
    PackageKey="CryoGun"
    FirstPersonMeshName="WEP_1P_CryoGun_MESH.Wep_1stP_CryoGun_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_CryoGun_MESH.Wep_CryoGun_Pickup"
    AttachmentArchetypeName="WEP_CryoGun_ARCH.Wep_CryoGun_3P"
    MuzzleFlashTemplateName="WEP_CryoGun_ARCH.Wep_CryoGun_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=7
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=52
    PlayerIronSightFOV=80
    IronSightPosition=(X=20,Y=8,Z=-3)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=150
    DOF_FG_MaxNearBlurSize=1
    GroupPriority=75
    WeaponSelectTexture=Texture2D'wep_ui_cryogun_tex.UI_WeaponSelect_Cryogun'
    MagazineCapacity=100
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=500
    InitialSpareMags=1
    AmmoPickupScale=0.75
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Weak_Recoil'
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    FireLoopSightedAnim=ShootLoop
    FireLoopStartSightedAnim=ShootLoop_Start
    FireLoopEndSightedAnim=ShootLoop_End
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=6,Y=15,Z=-5)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Ice_FreezeThrower.MeleeHelper'
    NumPellets=/* Array type was not detected. */
    maxRecoilPitch=150
    minRecoilPitch=115
    maxRecoilYaw=115
    minRecoilYaw=-115
    RecoilRate=0.085
    RecoilViewRotationScale=0.25
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    HippedRecoilModifier=1.5
    IronSightMeshFOVCompensationScale=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=4.5,Z=-5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Ice_FreezeThrower.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Freezethrower"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Ice_FreezeThrower.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Ice_FreezeThrower.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}