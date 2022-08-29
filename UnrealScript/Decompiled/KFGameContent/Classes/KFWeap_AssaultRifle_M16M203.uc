/*******************************************************************************
 * KFWeap_AssaultRifle_M16M203 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_M16M203 extends KFWeap_RifleBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';
const SecondaryReloadAnim = 'Reload_Secondary';
const SecondaryReloadAnim_Elite = 'Reload_Secondary_Elite';

var(Positioning) Vector SecondaryFireOffset;
var int ServerTotalAltAmmo;

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetAltTraderFilter()
{
    return 6;
}

simulated function AltFireMode()
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    StartFire(1);
}

function InitializeAmmo()
{
    super(KFWeapon).InitializeAmmo();
    SpareAmmoCount[1] = Min(SpareAmmoCount[1] + (InitialSpareMags[1] * default.MagazineCapacity[1]), (GetMaxAmmoAmount(1)) - AmmoCount[1]);
    ServerTotalAltAmmo += SpareAmmoCount[1];
    if((Role == ROLE_Authority) && !Instigator.IsLocallyControlled())
    {
        ServerTotalAltAmmo += AmmoCount[1];
    }
}

simulated function ConsumeAmmo(byte FireModeNum)
{
    local byte AmmoType;
    local bool bNoInfiniteAmmo;
    local int OldAmmoCount;

    if((((UsesSecondaryAmmo()) && FireModeNum == 1) && Role == ROLE_Authority) && !Instigator.IsLocallyControlled())
    {
        AmmoType = byte(GetAmmoType(FireModeNum));
        OldAmmoCount = AmmoCount[AmmoType];
        super(KFWeapon).ConsumeAmmo(FireModeNum);
        bNoInfiniteAmmo = ((OldAmmoCount - AmmoCount[AmmoType]) > 0) || AmmoCount[AmmoType] == 0;
        if(bNoInfiniteAmmo)
        {
            -- ServerTotalAltAmmo;
        }        
    }
    else
    {
        super(KFWeapon).ConsumeAmmo(FireModeNum);
    }
}

simulated event bool HasAmmo(byte FireModeNum, optional int Amount)
{
    local byte AmmoType;

    Amount = 1;
    AmmoType = byte(GetAmmoType(FireModeNum));
    if((((AmmoType == 1) && Role == ROLE_Authority) && UsesSecondaryAmmo()) && !Instigator.IsLocallyControlled())
    {
        if(ServerTotalAltAmmo <= 0)
        {
            return false;
        }
    }
    return super(KFWeapon).HasAmmo(FireModeNum, Amount);
}

function int AddSecondaryAmmo(int Amount)
{
    local int OldAmmo;

    if(!CanRefillSecondaryAmmo())
    {
        return 0;
    }
    if((Role == ROLE_Authority) && !Instigator.IsLocallyControlled())
    {
        OldAmmo = ServerTotalAltAmmo;
        ServerTotalAltAmmo = Min(ServerTotalAltAmmo + Amount, GetMaxAmmoAmount(1));
        ClientGiveSecondaryAmmo(byte(Amount));
        return ServerTotalAltAmmo - OldAmmo;        
    }
    else
    {
        OldAmmo = SpareAmmoCount[1];
        ClientGiveSecondaryAmmo(byte(Amount));
        return SpareAmmoCount[1] - OldAmmo;
    }
}

reliable client simulated function ClientGiveSecondaryAmmo(byte Amount)
{
    SpareAmmoCount[1] = Min(SpareAmmoCount[1] + Amount, (GetMaxAmmoAmount(1)) - AmmoCount[1]);
    TryToAltReload();
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
    local KFWeap_AssaultRifle_M16M203 Weap;

    super(KFWeapon).SetOriginalValuesFromPickup(PickedUpWeapon);
    if((Role == ROLE_Authority) && !Instigator.IsLocallyControlled())
    {
        Weap = KFWeap_AssaultRifle_M16M203(PickedUpWeapon);
        ServerTotalAltAmmo = Weap.ServerTotalAltAmmo;
        SpareAmmoCount[1] = ServerTotalAltAmmo - AmmoCount[1];
        ClientForceSecondarySpareAmmo(byte(SpareAmmoCount[1]));        
    }
    else
    {
        SpareAmmoCount[1] = PickedUpWeapon.SpareAmmoCount[1];
    }
}

reliable client simulated function ClientForceSecondarySpareAmmo(byte NewSecondarySpareAmmo)
{
    if(Role < ROLE_Authority)
    {
        SpareAmmoCount[1] = NewSecondarySpareAmmo;
        NotifyHUDofWeapon(Pawn(Owner));
    }
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
    local bool AutoShellEject;

    if(FireModeNum == 1)
    {
        if(MuzzleFlash == none)
        {
            AttachMuzzleFlash();
        }
        AutoShellEject = MuzzleFlash.bAutoActivateShellEject;
        MuzzleFlash.bAutoActivateShellEject = false;
        super(KFWeapon).CauseMuzzleFlash(FireModeNum);
        MuzzleFlash.bAutoActivateShellEject = AutoShellEject;        
    }
    else
    {
        super(KFWeapon).CauseMuzzleFlash(FireModeNum);
    }
}

simulated function bool ShouldAutoReload(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return false;
    }
    return super(KFWeapon).ShouldAutoReload(FireModeNum);
}

simulated function SendToAltReload()
{
    ReloadAmountLeft = MagazineCapacity[1];
    GotoState('AltReloading');
    if(Role < ROLE_Authority)
    {
        ServerSendToAltReload();
    }
}

reliable server function ServerSendToAltReload()
{
    ReloadAmountLeft = MagazineCapacity[1];
    GotoState('AltReloading');
}

reliable server function ServerSetAltAmmoCount(byte Amount)
{
    AmmoCount[1] = byte(Min(Amount, MagazineCapacity[1]));
}

simulated function bool CanOverrideMagReload(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return true;
    }
    return super(KFWeapon).CanOverrideMagReload(FireModeNum);
}

simulated function bool CanAltAutoReload()
{
    if(!Instigator.IsLocallyControlled())
    {
        return false;
    }
    if(!UsesSecondaryAmmo())
    {
        return false;
    }
    if(PendingFire(0) && HasAmmo(0))
    {
        return false;
    }
    if(!CanReload(1))
    {
        return false;
    }
    return true;
}

simulated function TryToAltReload()
{
    if(IsInState('Active') && CanAltAutoReload())
    {
        SendToAltReload();
    }
}

simulated state FiringSecondaryState extends WeaponSingleFiring
{
    simulated event BeginState(name PreviousStateName)
    {
        super(WeaponFiring).BeginState(PreviousStateName);
        NotifyBeginState();
    }

    simulated function EndState(name NextStateName)
    {
        super(WeaponFiring).EndState(NextStateName);
        NotifyEndState();
    }

    simulated event Vector GetMuzzleLoc()
    {
        local Vector MuzzleLocation;

        FireOffset = SecondaryFireOffset;
        MuzzleLocation = global.GetMuzzleLoc();
        FireOffset = default.FireOffset;
        return MuzzleLocation;
    }

    simulated function name GetWeaponFireAnim(byte FireModeNum)
    {
        return ((bUsingSights) ? 'Shoot_Secondary_Iron' : 'Shoot_Secondary');
    }
    stop;    
}

simulated state AltReloading extends Reloading
{
    ignores ForceReload, ShouldAutoReload, AllowSprinting;

    simulated function byte GetWeaponStateId()
    {
        local KFPerk Perk;
        local bool bTacticalReload;

        Perk = GetPerk();
        bTacticalReload = (Perk != none) && Perk.GetUsingTactialReload(self);
        return byte(((bTacticalReload) ? 10 : 9));
    }

    simulated function EndState(name NextStateName)
    {
        ClearZedTimeResist();
        ClearTimer('ReloadStatusTimer');
        ClearTimer('ReloadAmmoTimer');
        CheckBoltLockPostReload();
        NotifyEndState();
        if(((Role == ROLE_Authority) && KFGameInfo(WorldInfo.Game) != none) && KFGameInfo(WorldInfo.Game).DialogManager != none)
        {
            KFGameInfo(WorldInfo.Game).DialogManager.PlayAmmoDialog(KFPawn(Instigator), float(SpareAmmoCount[1]) / float(GetMaxAmmoAmount(1)));
        }
    }

    simulated event ReplicatedEvent(name VarName)
    {
        global.ReplicatedEvent(VarName);
    }

    simulated function bool CanOverrideMagReload(byte FireModeNum)
    {
        return true;
    }

    simulated function name GetReloadAnimName(bool bTacticalReload)
    {
        if(AmmoCount[1] > 0)
        {
            return ((bTacticalReload) ? 'Reload_Secondary_Elite' : 'Reload_Secondary');            
        }
        else
        {
            return ((bTacticalReload) ? 'Reload_Secondary_Elite' : 'Reload_Secondary');
        }
    }

    simulated function PerformReload(optional byte FireModeNum)
    {
        global.PerformReload(1);
        if(Instigator.IsLocallyControlled() && Role < ROLE_Authority)
        {
            ServerSetAltAmmoCount(AmmoCount[1]);
        }
    }

    simulated function KFGame.KFWeapon.EReloadStatus GetNextReloadStatus(optional byte FireModeNum)
    {
        return global.GetNextReloadStatus(1);
    }
    stop;    
}

simulated state Active
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        TryToAltReload();
    }
    stop;    
}

defaultproperties
{
    SecondaryFireOffset=(X=20,Y=4.5,Z=-7)
    PackageKey="M16_M203"
    FirstPersonMeshName="wep_1p_m16_m203_mesh.Wep_1stP_M16_M203_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_M16_M203_MESH.Wep_M4_M203_Pickup"
    AttachmentArchetypeName="Wep_M16_M203_ARCH.Wep_M16_M203_3P_new"
    MuzzleFlashTemplateName="wep_m16_m203_arch.Wep_M16_M203_MuzzleFlash"
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    SingleFireSoundIndex=2
    InventorySize=6
    MagazineCapacity[0]=30
    MagazineCapacity[1]=1
    MeshFOV=65
    MeshIronSightFOV=45
    PlayerIronSightFOV=70
    DOF_FG_FocalRadius=75
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=50
    WeaponSelectTexture=Texture2D'wep_ui_m16_m203_tex.UI_WeaponSelect_M16M203'
    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
    SpareAmmoCapacity[0]=270
    SpareAmmoCapacity[1]=13
    InitialSpareMags[0]=3
    InitialSpareMags[1]=3
    AmmoPickupScale[1]=2
    bLoopingFireAnim=/* Array type was not detected. */
    bLoopingFireSnd=/* Array type was not detected. */
    FireSightedAnims=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponFireLoopEndSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=22,Y=9,Z=-2)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_M16M203.MeleeHelper'
    maxRecoilPitch=120
    minRecoilPitch=70
    maxRecoilYaw=130
    minRecoilYaw=-130
    RecoilRate=0.08
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
    IronSightMeshFOVCompensationScale=1.7
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
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_M16M203.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="M16 M203 Assault Rifle"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_M16M203.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_M16M203.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}