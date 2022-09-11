/*******************************************************************************
 * KFWeap_Thrown_C4 generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Thrown_C4 extends KFWeap_ThrownBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

const DETONATE_FIREMODE = 5;

/** NEW - IronSights Key */
var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateLastAnim;
var array<KFProj_Thrown_C4> DeployedCharges;
var class<KFGFxWorld_C4Screen> ScreenUIClass;
var KFGFxWorld_C4Screen ScreenUI;
var float TimeSinceLastUpdate;
var float UpdateInterval;
var() AkEvent DetonateAkEvent;
/** Sound to play upon attempted but unsuccessful detonation */
var() AkEvent DryFireAkEvent;
var int NumDeployedCharges;

replication
{
     if(bNetDirty)
        NumDeployedCharges;
}

simulated function SetIronSights(bool bNewIronSights)
{
    if(!Instigator.IsLocallyControlled())
    {
        return;
    }
    if(bNewIronSights)
    {
        StartFire(5);        
    }
    else
    {
        StopFire(5);
    }
}

simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional name SocketName)
{
    super(KFWeapon).AttachWeaponTo(MeshCpnt, SocketName);
    if((Instigator != none) && Instigator.IsLocallyControlled())
    {
        if(ScreenUI == none)
        {
            ScreenUI = new (self) ScreenUIClass;
            ScreenUI.Init();
            ScreenUI.Start(true);
        }
        if(ScreenUI != none)
        {
            ScreenUI.SetPause(false);
        }
    }
}

simulated function DetachWeapon()
{
    super(KFWeapon).DetachWeapon();
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && ScreenUI != none)
    {
        ScreenUI.SetPause();
    }
}

simulated event Destroyed()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && ScreenUI != none)
    {
        ScreenUI.Close();
    }
    super(Weapon).Destroyed();
}

simulated event Tick(float DeltaTime)
{
    super(KFWeapon).Tick(DeltaTime);
    TimeSinceLastUpdate += DeltaTime;
    if(TimeSinceLastUpdate > UpdateInterval)
    {
        UpdateScreenUI();
    }
}

simulated function UpdateScreenUI()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.Weapon == self)
    {
        if(ScreenUI != none)
        {
            ScreenUI.SetMaxCharges(GetMaxAmmoAmount(0));
            ScreenUI.SetActiveCharges(NumDeployedCharges);
            TimeSinceLastUpdate = 0;
        }
    }
}

simulated function Projectile ProjectileFire()
{
    local Projectile P;
    local KFProj_Thrown_C4 Charge;

    P = super(KFWeapon).ProjectileFire();
    Charge = KFProj_Thrown_C4(P);
    if(Charge != none)
    {
        if(SkinItemId > 0)
        {
            Charge.WeaponSkinId = SkinItemId;
            Charge.SetWeaponSkin(SkinItemId);
            Charge.bNetDirty = true;
        }
        DeployedCharges.AddItem(Charge;
        NumDeployedCharges = DeployedCharges.Length;
        bForceNetUpdate = true;
    }
    return P;
}

simulated function Detonate()
{
    if(Role == ROLE_Authority)
    {
        if(DeployedCharges.Length > 0)
        {
            DeployedCharges[0].Detonate();
        }
        if(!HasAnyAmmo() && NumDeployedCharges == 0)
        {
            if(CanSwitchWeapons())
            {
                Instigator.Controller.ClientSwitchToBestWeapon(false);
            }
        }
    }
}

function RemoveDeployedCharge(optional int ChargeIndex, optional Actor ChargeActor)
{
    ChargeIndex = -1;    
    if(ChargeIndex == -1)
    {
        if(ChargeActor != none)
        {
            ChargeIndex = DeployedCharges.Find(ChargeActor;
        }
    }
    if(ChargeIndex != -1)
    {
        DeployedCharges.Remove(ChargeIndex, 1;
        NumDeployedCharges = DeployedCharges.Length;
        bForceNetUpdate = true;
    }
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
    local int I;

    super(KFWeapon).SetOriginalValuesFromPickup(PickedUpWeapon);
    DeployedCharges = KFWeap_Thrown_C4(PickedUpWeapon).DeployedCharges;
    NumDeployedCharges = DeployedCharges.Length;
    bForceNetUpdate = true;
    I = 0;
    J0x6F:

    if(I < NumDeployedCharges)
    {
        DeployedCharges[I].Instigator = Instigator;
        DeployedCharges[I].SetOwner(self);
        if(Instigator.Controller != none)
        {
            DeployedCharges[I].InstigatorController = Instigator.Controller;
        }
        ++ I;
        goto J0x6F;
    }
}

static simulated event bool UsesAmmo()
{
    return true;
}

simulated function bool HasAmmo(byte FireModeNum, optional int Amount)
{
    if(FireModeNum == 5)
    {
        return NumDeployedCharges > 0;
    }
    return super(KFWeapon).HasAmmo(FireModeNum, Amount);
}

simulated function BeginFire(byte FireModeNum)
{
    if((FireModeNum == 5) && IsInState('WeaponSprinting') || NumDeployedCharges <= 0)
    {
        PrepareAndDetonate();        
    }
    else
    {
        super(KFWeapon).BeginFire(FireModeNum);
    }
}

simulated function PrepareAndDetonate()
{
    local name DetonateAnimName;
    local float AnimDuration;
    local bool bInSprintState;

    DetonateAnimName = ((ShouldPlayLastAnims()) ? DetonateLastAnim : DetonateAnim);
    AnimDuration = MySkelMesh.GetAnimLength(DetonateAnimName);
    bInSprintState = IsInState('WeaponSprinting');
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(NumDeployedCharges > 0)
        {
            PlaySoundBase(DetonateAkEvent, true);            
        }
        else
        {
            PlaySoundBase(DryFireAkEvent, true);
        }
        if(bInSprintState)
        {
            AnimDuration *= 0.25;
            PlayAnimation(DetonateAnimName, AnimDuration);            
        }
        else
        {
            PlayAnimation(DetonateAnimName);
        }
    }
    if(Role == ROLE_Authority)
    {
        Detonate();
    }
    IncrementFlashCount();
    if(bInSprintState)
    {
        SetTimer(AnimDuration * 0.8, false, 'PlaySprintStart');        
    }
    else
    {
        SetTimer(AnimDuration * 0.5, false, 'GotoActiveState');
    }
}

simulated function AltFireMode();

simulated function bool HasAlwaysOnZedTimeResist()
{
    return true;
}

simulated function GotoActiveState();

static simulated event KFGame.KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 6;
}

simulated state Active
{
    simulated function bool CanPlayIdleFidget(optional bool bOnReload)
    {
        if(!HasAmmo(0))
        {
            return false;
        }
        return super.CanPlayIdleFidget(bOnReload);
    }
    stop;    
}

simulated state WeaponDetonating
{
    ignores AllowSprinting;

    simulated event BeginState(name PreviousStateName)
    {
        PrepareAndDetonate();
    }

    simulated function GotoActiveState()
    {
        GotoState('Active');
    }
    stop;    
}

simulated state WeaponThrowing
{
    simulated function bool ShouldRefire()
    {
        return false;
    }

    simulated function EndState(name NextStateName)
    {
        local KFPerk InstigatorPerk;

        super.EndState(NextStateName);
        InstigatorPerk = GetPerk();
        if(InstigatorPerk != none)
        {
            SetZedTimeResist(InstigatorPerk.GetZedTimeModifier(self));
        }
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        if(!HasAmmo(0) && HasSpareAmmo())
        {
            PerformArtificialReload();
        }
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    ignores SetIronSights;
    stop;    
}

defaultproperties
{
    DetonateAnim=Detonate
    DetonateLastAnim=Detonate_Last
    ScreenUIClass=Class'KFGame.KFGFxWorld_C4Screen'
    UpdateInterval=0.25
    DetonateAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Handling_Detonate'
    DryFireAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_DryFire'
    PackageKey="C4"
    FirstPersonMeshName="Wep_1P_C4_MESH.Wep_1stP_C4_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="WEP_3P_C4_MESH.Wep_C4_Pickup"
    AttachmentArchetypeName="WEP_C4_ARCH.Wep_C4_3P"
    FireModeIconPaths=/* Array type was not detected. */
    InventoryGroup=EInventoryGroup.IG_Equipment
    InventorySize=3
    GroupPriority=25
    WeaponSelectTexture=Texture2D'WEP_UI_C4_TEX.UI_WeaponSelect_C4'
    MagazineCapacity=1
    AmmoCost=/* Array type was not detected. */
    SpareAmmoCapacity=2
    InitialSpareMags=1
    FireAnim=C4_Throw
    FireLastAnim=C4_Throw_Last
    PlayerViewOffset=(X=6,Y=2,Z=-4)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Thrown_C4.MeleeHelper'
    AssociatedPerkClasses=/* Array type was not detected. */
    CurrentFireMode=5
    FiringStatesArray=/* Array type was not detected. */
    WeaponFireTypes=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=25,Y=15,Z=0)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Thrown_C4.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="C4 Explosives"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Thrown_C4.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Thrown_C4.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
}