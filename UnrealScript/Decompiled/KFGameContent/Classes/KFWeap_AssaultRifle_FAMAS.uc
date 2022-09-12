/*******************************************************************************
 * KFWeap_AssaultRifle_FAMAS generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_AssaultRifle_FAMAS extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const SecondaryFireAnim = 'Shoot_Secondary';
const SecondaryFireIronAnim = 'Shoot_Secondary_Iron';
const SecondaryFireAnimLast = 'Shoot_Secondary_Last';
const SecondaryFireIronAnimLast = 'Shoot_Secondary_Iron_Last';
const SecondaryReloadAnimEmpty = 'Reload_Secondary_Empty';
const SecondaryReloadAnimHalf = 'Reload_Secondary_Half';
const SecondaryReloadAnimEliteEmpty = 'Reload_Secondary_Elite_Empty';
const SecondaryReloadAnimEliteHalf = 'Reload_Secondary_Elite_Half';
const ShotgunMuzzleSocket = 'ShotgunMuzzleFlash';

var(Positioning) Vector SecondaryFireOffset;
/** Animation to play when the weapon is fired  in burst mode with 2 rounds left */
var(Animations) const editconst name BurstFire2RdAnim;
var(Animations) const editconst name BurstFire2RdSightedAnim;
/** Animation to play when the weapon is fired in burst fire mode for 3 rounds */
var(Animations) const editconst name BurstFire3RdAnim;
var(Animations) const editconst name BurstFire3RdSightedAnim;
var transient KFMuzzleFlash ShotgunMuzzleFlash;
var() KFMuzzleFlash ShotgunMuzzleFlashTemplate;
var int ServerTotalAltAmmo;
var transient bool bCanceledAltAutoReload;
var transient int BurstAmountBegin;
var protected const float AltFireRecoilScale;

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 7;
}

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
    if(bCanceledAltAutoReload)
    {
        bCanceledAltAutoReload = false;
        TryToAltReload(true);
        return;
    }
    StartFire(1);
}

simulated function BeginFire(byte FireModeNum)
{
    local bool bStoredAutoReload;

    if((FireModeNum == 2) && !CanReload())
    {
        bStoredAutoReload = bCanceledAltAutoReload;
        bCanceledAltAutoReload = false;
        if(CanAltAutoReload(false))
        {
            TryToAltReload(false);
            return;
        }
        bCanceledAltAutoReload = bStoredAutoReload;
    }
    super(KFWeapon).BeginFire(FireModeNum);
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
    TryToAltReload(true);
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
    local KFWeap_AssaultRifle_FAMAS Weap;

    super(KFWeapon).SetOriginalValuesFromPickup(PickedUpWeapon);
    if((Role == ROLE_Authority) && !Instigator.IsLocallyControlled())
    {
        Weap = KFWeap_AssaultRifle_FAMAS(PickedUpWeapon);
        ServerTotalAltAmmo = Weap.ServerTotalAltAmmo;
        SpareAmmoCount[1] = ServerTotalAltAmmo - AmmoCount[1];        
    }
    else
    {
        SpareAmmoCount[1] = PickedUpWeapon.SpareAmmoCount[1];
    }
}

simulated function CauseMuzzleFlash(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        if(ShotgunMuzzleFlash == none)
        {
            AttachMuzzleFlash();
        }
        if(ShotgunMuzzleFlash != none)
        {
            ShotgunMuzzleFlash.CauseMuzzleFlash(FireModeNum);
        }
        if(ShotgunMuzzleFlash.bAutoActivateShellEject)
        {
            ShotgunMuzzleFlash.CauseShellEject();
            SetShellEjectsToForeground();
        }        
    }
    else
    {
        super(KFWeapon).CauseMuzzleFlash(FireModeNum);
    }
}

simulated function AttachMuzzleFlash()
{
    super(KFWeapon).AttachMuzzleFlash();
    if(MySkelMesh != none)
    {
        if(ShotgunMuzzleFlashTemplate != none)
        {
            ShotgunMuzzleFlash = new (self) Class'KFMuzzleFlash' (ShotgunMuzzleFlashTemplate);
            ShotgunMuzzleFlash.AttachMuzzleFlash(MySkelMesh, 'ShotgunMuzzleFlash');
        }
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
    ReloadAmountLeft = MagazineCapacity[1] - AmmoCount[1];
    GotoState('AltReloading');
    if(Role < ROLE_Authority)
    {
        ServerSendToAltReload();
    }
}

reliable server function ServerSendToAltReload()
{
    ReloadAmountLeft = MagazineCapacity[1] - AmmoCount[1];
    GotoState('AltReloading');
}

reliable server function ServerSetAltAmmoCount(byte Amount)
{
    AmmoCount[1] = Amount;
}

simulated function bool CanOverrideMagReload(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        return true;
    }
    return super(KFWeapon).CanOverrideMagReload(FireModeNum);
}

simulated function bool CanAltAutoReload(bool bIsAuto)
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
    if(bIsAuto && AmmoCount[1] > 0)
    {
        return false;
    }
    if(bCanceledAltAutoReload)
    {
        return false;
    }
    return true;
}

simulated function TryToAltReload(bool bIsAuto)
{
    if((IsInState('Active') || IsInState('WeaponSprinting')) && CanAltAutoReload(bIsAuto))
    {
        SendToAltReload();
    }
}

simulated function int GetSecondaryAmmoForHUD()
{
    return AmmoCount[1];
}

simulated function int GetSecondarySpareAmmoForHUD()
{
    return SpareAmmoCount[1];
}

simulated function ModifyRecoil(out float CurrentRecoilModifier)
{
    if(CurrentFireMode == 1)
    {
        CurrentRecoilModifier *= AltFireRecoilScale;
    }
    super(KFWeapon).ModifyRecoil(CurrentRecoilModifier);
}

simulated state WeaponBurstFiring
{
    simulated event BeginState(name PreviousStateName)
    {
        BurstAmountBegin = GetBurstAmount();
        super.BeginState(PreviousStateName);
    }

    simulated function name GetWeaponFireAnim(byte FireModeNum)
    {
        if(BurstAmount == BurstAmountBegin)
        {
            if(BurstAmount == 3)
            {
                if(bUsingSights)
                {
                    return BurstFire3RdSightedAnim;
                }
                return BurstFire3RdAnim;                
            }
            else
            {
                if(BurstAmount == 2)
                {
                    if(bUsingSights)
                    {
                        return BurstFire2RdSightedAnim;
                    }
                    return BurstFire2RdAnim;                    
                }
                else
                {
                    return super(KFWeapon).GetWeaponFireAnim(FireModeNum);
                }
            }
        }
        return 'None';
    }
    stop;    
}

simulated state FiringSecondaryState extends WeaponFiring
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        NotifyBeginState();
    }

    simulated function EndState(name NextStateName)
    {
        super.EndState(NextStateName);
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
        if(AmmoCount[FireModeNum] > 0)
        {
            return ((bUsingSights) ? 'Shoot_Secondary_Iron' : 'Shoot_Secondary');
        }
        return ((bUsingSights) ? 'Shoot_Secondary_Iron_Last' : 'Shoot_Secondary_Last');
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

    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        bCanceledAltAutoReload = true;
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
        return false;
    }

    simulated function name GetReloadAnimName(bool bTacticalReload)
    {
        if(AmmoCount[1] > 0)
        {
            return ((bTacticalReload) ? 'Reload_Secondary_Elite_Half' : 'Reload_Secondary_Half');            
        }
        else
        {
            return ((bTacticalReload) ? 'Reload_Secondary_Elite_Empty' : 'Reload_Secondary_Empty');
        }
    }

    simulated function PerformReload(optional byte FireModeNum)
    {
        global.PerformReload(1);
        if(Instigator.IsLocallyControlled() && Role < ROLE_Authority)
        {
            ServerSetAltAmmoCount(byte(AmmoCount[1]));
        }
        bCanceledAltAutoReload = false;
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
        TryToAltReload(true);
    }
    stop;    
}

defaultproperties
{
    SecondaryFireOffset=(X=20,Y=4.5,Z=-7)
    BurstFire2RdAnim=Shoot_Burst2
    BurstFire2RdSightedAnim=Shoot_Burst2_Iron
    BurstFire3RdAnim=Shoot_Burst
    BurstFire3RdSightedAnim=Shoot_Burst_Iron
    ShotgunMuzzleFlashTemplate=KFMuzzleFlash'wep_famas_arch.Wep_Famas_Shotgun_MuzzleFlash'
    AltFireRecoilScale=4.5
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_AssaultRifle_FAMAS.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_FNFAL_MAT.WEP_1P_FNFAL_Scope_MAT'
    ScopedSensitivityMod=8
    PackageKey="Famas"
    FirstPersonMeshName="wep_1p_famas_mesh.Wep_1stP_Famas_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_Famas_MESH.WEP_Famas_Pickup"
    AttachmentArchetypeName="Wep_Famas_ARCH.Wep_Famas_3P"
    MuzzleFlashTemplateName="wep_famas_arch.Wep_Famas_MuzzleFlash"
    bHasIronSights=true
    bUsesSecondaryAmmoAltHUD=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    BurstAmount=3
    InventorySize=6
    PenetrationPower=/* Array type was not detected. */
    MeshFOV=65
    MeshIronSightFOV=60
    PlayerIronSightFOV=70
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    GroupPriority=80
    WeaponSelectTexture=Texture2D'WEP_UI_Famas_TEX.UI_WeaponSelect_Famas'
    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
    MagazineCapacity[0]=24
    MagazineCapacity[1]=6
    SpareAmmoCapacity[0]=240
    SpareAmmoCapacity[1]=36
    InitialSpareMags[0]=3
    InitialSpareMags[1]=1
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=22,Y=9,Z=-2)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_AssaultRifle_FAMAS.MeleeHelper'
    NumPellets=/* Array type was not detected. */
    maxRecoilPitch=100
    minRecoilPitch=75
    maxRecoilYaw=40
    minRecoilYaw=-40
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
    HippedRecoilModifier=2
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
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_AssaultRifle_FAMAS.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="FAMAS Masterkey"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_FAMAS.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_AssaultRifle_FAMAS.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_AssaultRifle_FAMAS.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}