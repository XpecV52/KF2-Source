/*******************************************************************************
 * KFWeap_Rifle_RailGun generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeap_Rifle_RailGun extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var ScriptedTexture CanvasTexture;
var int CurrentCanvasTextureSize;
var Texture2D LockedHitZoneIcon;
var Texture2D DefaultHitZoneIcon;
var LinearColor RedIconColor;
var LinearColor YellowIconColor;
var LinearColor BlueIconColor;
var float MaxScopeScreenDot;
var AkEvent AmbientSoundPlayEvent;
var AkEvent AmbientSoundStopEvent;
/** Socket to attach the ambient sound to. */
var() name AmbientSoundSocketName;

simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
    local int NewScopeTextureSize;

    super.InitFOV(SizeX, SizeY, DefaultPlayerFOV);
    NewScopeTextureSize = int(ScopeTextureScale * SizeX);
    if(NewScopeTextureSize > MaxSceneCaptureSize)
    {
        NewScopeTextureSize = MaxSceneCaptureSize;
    }
    if(CurrentCanvasTextureSize != NewScopeTextureSize)
    {
        CanvasTexture = ScriptedTexture(Class'ScriptedTexture'.static.Create(NewScopeTextureSize, NewScopeTextureSize, 9, MakeLinearColor(0, 0, 0, 0)));
        CanvasTexture.__Render__Delegate = OnRender;
        CanvasTexture.bNeedsTwoCopies = true;
        if(ScopeLenseMIC != none)
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
        CurrentCanvasTextureSize = NewScopeTextureSize;
    }
}

reliable client simulated function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
    super.ClientWeaponSet(bOptionalSet);
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsHumanControlled())
    {
        if(ScopeLenseMIC != none)
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeText', CanvasTexture);
        }
    }
}

simulated function StartFire(byte FireModeNum)
{
    if(FireModeNum == 1)
    {
        LogInternal("Nope, use the default you dirty cheater :)");
        FireModeNum = 0;
    }
    super(KFWeapon).StartFire(FireModeNum);
}

simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
    return false;
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    if(AmmoCount[0] > 0)
    {
        WarnInternal("Railgun reloading with non-empty mag");
    }
    return ((bTacticalReload) ? 'Reload_Empty_Elite' : 'Reload_Empty');
}

simulated function StartAmbientSound()
{
    if(((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.IsFirstPerson())
    {
        PostAkEventOnBone(AmbientSoundPlayEvent, AmbientSoundSocketName, false, true);
    }
}

simulated function StopAmbientSound()
{
    PostAkEventOnBone(AmbientSoundStopEvent, AmbientSoundSocketName, false, true);
}

simulated function DetachWeapon()
{
    StopAmbientSound();
    super.DetachWeapon();
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    if(((Instigator != none) && Instigator.Controller != none) && Instigator.IsLocallyControlled())
    {
        CanvasTexture.bNeedsUpdate = bUsingSights && TargetingComp.bTargetingUpdated;
    }
}

simulated event Destroyed()
{
    if(CanvasTexture != none)
    {
        CanvasTexture = none;
    }
    StopAmbientSound();
    super(Weapon).Destroyed();
}

simulated function InstantFireClient()
{
    local Vector StartTrace, EndTrace;
    local Rotator AimRot;
    local array<ImpactInfo> ImpactList;
    local int Idx;
    local ImpactInfo RealImpact;
    local float CurPenetrationValue;

    bInstantHit = true;
    StartTrace = GetSafeStartTraceLocation();
    if(!IsZero(TargetingComp.LockedAimLocation))
    {
        AimRot = rotator(Normal(TargetingComp.LockedAimLocation - StartTrace));
        EndTrace = StartTrace + (vector(AimRot) * (GetTraceRange()));        
    }
    else
    {
        AimRot = GetAdjustedAim(StartTrace);
        EndTrace = StartTrace + (vector(AimRot) * (GetTraceRange()));
    }
    bInstantHit = false;
    PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
    CurPenetrationValue = PenetrationPowerRemaining;
    RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
    if(Instigator != none)
    {
        if(ImpactList.Length > 0)
        {
            Instigator.SetFlashLocation(self, CurrentFireMode, ImpactList[ImpactList.Length - 1].HitLocation);            
        }
        else
        {
            Instigator.SetFlashLocation(self, CurrentFireMode, RealImpact.HitLocation);
        }
    }
    if((Instigator != none) && Instigator.IsLocallyControlled())
    {
        InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);
        Idx = 0;
        J0x27E:

        if(Idx < ImpactList.Length)
        {
            ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
            ++ Idx;
            goto J0x27E;
        }
        if(Instigator.Role < ROLE_Authority)
        {
            SendClientImpactList(CurrentFireMode, ImpactList);
        }
    }
}

simulated function OnRender(Canvas C)
{
    local int I;

    if(!bUsingSights)
    {
        return;
    }
    I = 0;
    J0x1C:

    if(I < TargetingComp.TargetVulnerableLocations.Length)
    {
        if(!IsZero(TargetingComp.TargetVulnerableLocations[I]))
        {
            DrawTargetingIcon(C, I);
        }
        ++ I;
        goto J0x1C;
    }
    CanvasTexture.bNeedsUpdate = true;
}

simulated function DrawTargetingIcon(Canvas Canvas, int Index)
{
    local Vector WorldPos;
    local float IconSize, IconScale;
    local Vector2D ScreenPos;

    WorldPos = TargetingComp.TargetVulnerableLocations[Index];
    ScreenPos = WorldToCanvas(Canvas, WorldPos);
    IconScale = FMin(float(Canvas.SizeX) / 1024, 1);
    IconScale *= FClamp(1 - (VSize(WorldPos - Instigator.Location) / 4000), 0.2, 1);
    IconSize = 300 * IconScale;
    ScreenPos.X -= (IconSize / 2);
    ScreenPos.Y -= (IconSize / 2);
    if((((ScreenPos.X < float(0)) || ScreenPos.X > float(Canvas.SizeX)) || ScreenPos.Y < float(0)) || ScreenPos.Y > float(Canvas.SizeY))
    {
        return;
    }
    Canvas.SetPos(ScreenPos.X, ScreenPos.Y);
    if((TargetingComp.LockedHitZone >= 0) && Index == TargetingComp.LockedHitZone)
    {
        Canvas.DrawTile(LockedHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedHitZoneIcon.SizeX), float(LockedHitZoneIcon.SizeY), RedIconColor);        
    }
    else
    {
        if((TargetingComp.PendingHitZone >= 0) && Index == TargetingComp.PendingHitZone)
        {
            Canvas.DrawTile(LockedHitZoneIcon, IconSize, IconSize, 0, 0, float(LockedHitZoneIcon.SizeX), float(LockedHitZoneIcon.SizeY), YellowIconColor);            
        }
        else
        {
            Canvas.DrawTile(DefaultHitZoneIcon, IconSize, IconSize, 0, 0, float(DefaultHitZoneIcon.SizeX), float(DefaultHitZoneIcon.SizeY), BlueIconColor);
        }
    }
}

simulated function Vector2D WorldToCanvas(Canvas Canvas, Vector WorldPoint)
{
    local Vector ViewLoc, ViewDir;
    local Rotator ViewRot;
    local Vector X, Y, Z;
    local Vector2D ScreenPoint;
    local float DotToZedUpDown, DotToZedLeftRight, UpDownScale, LeftRightScale;

    Instigator.Controller.GetPlayerViewPoint(ViewLoc, ViewRot);
    GetAxes(ViewRot, X, Y, Z);
    ViewDir = Normal(WorldPoint - ViewLoc);
    DotToZedUpDown = Z Dot ViewDir;
    DotToZedLeftRight = Y Dot ViewDir;
    UpDownScale = DotToZedUpDown / MaxScopeScreenDot;
    LeftRightScale = DotToZedLeftRight / MaxScopeScreenDot;
    ScreenPoint.X = float(CanvasTexture.SizeX) * (0.5 + (LeftRightScale * 0.5));
    ScreenPoint.Y = float(CanvasTexture.SizeY) * (0.5 - (UpDownScale * 0.5));
    return ScreenPoint;
}

auto simulated state Inactive
{
    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StopAmbientSound();
    }
    stop;    
}

simulated state WeaponEquipping
{
    simulated function BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StartAmbientSound();
    }
    stop;    
}

simulated state WeaponPuttingDown
{
    simulated event BeginState(name PreviousStateName)
    {
        super.BeginState(PreviousStateName);
        StopAmbientSound();
    }
    stop;    
}

simulated state WeaponAbortEquip
{
    simulated event BeginState(name PreviousStateName)
    {
        super(WeaponPuttingDown).BeginState(PreviousStateName);
        StopAmbientSound();
    }
    stop;    
}

defaultproperties
{
    LockedHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Yellow_Red_Target'
    DefaultHitZoneIcon=Texture2D'Wep_Scope_TEX.Wep_1stP_Blue_Target'
    RedIconColor=(R=1,G=0,B=0,A=1)
    YellowIconColor=(R=1,G=1,B=0,A=1)
    BlueIconColor=(R=0.25,G=0.6,B=1,A=1)
    MaxScopeScreenDot=0.2
    AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Railgun.Play_Railgun_Loop'
    AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Railgun.Stop_Railgun_Loop'
    AmbientSoundSocketName=AmbientSound
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=23
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_RailGun.SceneCapture2DComponent0'
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'WEP_1P_RailGun_MAT.Wep_1stP_RailGun_Lens_MIC'
    ScopedSensitivityMod=16
    PackageKey="RailGun"
    FirstPersonMeshName="WEP_1P_RailGun_MESH.WEP_1stP_RailGun_Rig"
    FirstPersonAnimSetNames=/* Array type was not detected. */
    PickupMeshName="wep_3p_railgun_mesh.Wep_3rdP_RailGun_Pickup"
    AttachmentArchetypeName="WEP_RailGun_ARCH.Wep_RailGun_3P_Updated"
    MuzzleFlashTemplateName="WEP_RailGun_ARCH.Wep_RailGun_MuzzleFlash"
    bHasIronSights=true
    bWarnAIWhenAiming=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    FireModeIconPaths=/* Array type was not detected. */
    InventorySize=9
    MagazineCapacity=1
    PenetrationPower=/* Array type was not detected. */
    MeshIronSightFOV=27
    PlayerIronSightFOV=70
    IronSightPosition=(X=-0.25,Y=0,Z=0)
    DOF_BlendInSpeed=3
    DOF_FG_FocalRadius=0
    DOF_FG_MaxNearBlurSize=3.5
    AimWarningDelay=(X=0.4,Y=0.8)
    GroupPriority=100
    WeaponSelectTexture=Texture2D'WEP_UI_RailGun_TEX.UI_WeaponSelect_Railgun'
    SpareAmmoCapacity=32
    InitialSpareMags=6
    AmmoPickupScale=3
    ForceReloadTimeOnEmpty=0.5
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'
    FireSightedAnims=/* Array type was not detected. */
    BonesToLockOnEmpty=/* Array type was not detected. */
    WeaponFireSnd=/* Array type was not detected. */
    WeaponDryFireSnd=/* Array type was not detected. */
    PlayerViewOffset=(X=3,Y=7,Z=-2)
    MeleeAttackHelper=KFMeleeHelperWeapon'Default__KFWeap_Rifle_RailGun.MeleeHelper'
    IronSightsSpreadMod=0.01
    maxRecoilPitch=600
    minRecoilPitch=450
    maxRecoilYaw=250
    minRecoilYaw=-250
    RecoilBlendOutRatio=1.1
    RecoilViewRotationScale=0.6
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485
    HippedRecoilModifier=2.33333
    FallingRecoilModifier=1.5
    AssociatedPerkClasses=/* Array type was not detected. */
    WeaponUpgrades=/* Array type was not detected. */
    TargetingCompClass=Class'KFTargetingWeaponComponent_RailGun'
    FiringStatesArray=/* Array type was not detected. */
    WeaponProjectiles=/* Array type was not detected. */
    FireInterval=/* Array type was not detected. */
    Spread=/* Array type was not detected. */
    InstantHitDamage=/* Array type was not detected. */
    InstantHitDamageTypes=/* Array type was not detected. */
    FireOffset=(X=30,Y=3,Z=-2.5)
    begin object name=FirstPersonMesh class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFWeap_Rifle_RailGun.FirstPersonMesh'
    Mesh=FirstPersonMesh
    ItemName="Rail Gun"
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_RailGun.StaticPickupComponent'
    DroppedPickupMesh=StaticPickupComponent
    begin object name=StaticPickupComponent class=StaticMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: StaticMeshComponent'Default__KFWeap_Rifle_RailGun.StaticPickupComponent'
    PickupFactoryMesh=StaticPickupComponent
    begin object name=SceneCapture2DComponent0 class=TWSceneCapture2DDPGComponent
        FieldOfView=23
    object end
    // Reference: TWSceneCapture2DDPGComponent'Default__KFWeap_Rifle_RailGun.SceneCapture2DComponent0'
    Components(0)=SceneCapture2DComponent0
}