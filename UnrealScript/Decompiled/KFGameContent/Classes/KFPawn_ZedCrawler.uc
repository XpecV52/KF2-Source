/*******************************************************************************
 * KFPawn_ZedCrawler generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedCrawler extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

var Actor LastBumpLevelActor;
var float LastBumpLevelTime;
var protected const KFGameExplosion DeathExplosionTemplate;
var protected repnotify bool bIsSpecialCrawler;
var bool bShouldExplode;

replication
{
     if(bNetInitial)
        bIsSpecialCrawler;

     if(bIsSpecialCrawler && bTearOff)
        bShouldExplode;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bIsSpecialCrawler')
    {
        UpdateBodyMIC();
        return;
    }
    super.ReplicatedEvent(VarName);
}

event PossessedBy(Controller C, bool bVehicleTransition)
{
    local KFAIController_ZedCrawler CrawlerController;

    super.PossessedBy(C, bVehicleTransition);
    LastBumpLevelActor = none;
    CrawlerController = KFAIController_ZedCrawler(MyKFAIC);
    if(CrawlerController != none)
    {
        CrawlerController.OriginalMeshTranslation = Mesh.Translation;
        if(FRand() < class<KFDifficulty_Crawler>(DifficultySettings).static.GetSpecialCrawlerChance(self, KFGameReplicationInfo(WorldInfo.GRI)))
        {
            bIsSpecialCrawler = true;
            if(WorldInfo.NetMode != NM_DedicatedServer)
            {
                UpdateBodyMIC();
            }
        }
    }
}

simulated event bool UsePlayerControlledZedSkin()
{
    return bIsSpecialCrawler || super.UsePlayerControlledZedSkin();
}

protected simulated function UpdateBodyMIC()
{
    if((GetCharacterMonsterInfo()) != none)
    {
        CharacterMICs[0].SetParent(GetCharacterMonsterInfo().PlayerControlledSkins[0]);
    }
}

function bool SpecialMoveTo_Leap(NavigationPoint Start, NavigationPoint End, optional float JumpTime)
{
    JumpTime = 0.45;
    Class'AICommand_Crawler_LeapToWall'.static.LeapToWall(KFAIController_ZedCrawler(MyKFAIC), Start, End, JumpTime);
    return true;
}

event SpiderBumpLevel(Vector HitLocation, Vector HitNormal, optional Actor Wall)
{
    local AICommand ActiveCommand;

    if(MyKFAIC != none)
    {
        if((LastBumpLevelTime == 0) || (WorldInfo.TimeSeconds - LastBumpLevelTime) > 0.1)
        {
            LastBumpLevelTime = WorldInfo.TimeSeconds;
            ActiveCommand = AICommand(MyKFAIC.GetActiveCommand());
            if((Physics != 2) || (ActiveCommand != none) && AICommand_Crawler_LeapToWall(ActiveCommand) != none)
            {
                if((Wall != none) && LastBumpLevelActor != Wall)
                {
                    if(MyKFAIC != none)
                    {
                        MyKFAIC.AILog_Internal((((("(Pawn) " $ string(GetFuncName())) $ " Wall: ") $ string(Wall)) $ " HitNormal: ") $ string(HitNormal), 'Crawler');
                    }
                    LastBumpLevelActor = Wall;
                    MyKFAIC.NotifyHitWall(HitNormal, Wall);
                }                
            }
            else
            {
                if(MyKFAIC != none)
                {
                    MyKFAIC.AILog_Internal((((("(Pawn) [PHYS_FALLING] " $ string(GetFuncName())) $ " Wall: ") $ string(Wall)) $ " HitNormal: ") $ string(HitNormal), 'Crawler');
                }
            }
        }
    }
}

simulated function CancelExplosion()
{
    if(bIsSpecialCrawler)
    {
        bShouldExplode = false;
        if(IsTimerActive('Timer_CheckForExplode'))
        {
            ClearTimer('Timer_CheckForExplode');
        }
    }
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
    super.CauseHeadTrauma(BleedOutTime);
    CancelExplosion();
}

simulated function PlayHeadAsplode()
{
    super.PlayHeadAsplode();
    CancelExplosion();
}

function bool Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    if((bIsSpecialCrawler && !bPlayedDeath) && DamageType != Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType)
    {
        bShouldExplode = true;
    }
    return super.Died(Killer, DamageType, HitLocation);
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc)
{
    super.PlayDying(DamageType, HitLoc);
    if(bIsSpecialCrawler && bShouldExplode)
    {
        SetTimer(WorldInfo.DeltaSeconds, false, 'Timer_CheckForExplode');
    }
}

simulated function Timer_CheckForExplode()
{
    local KFGoreManager GoreManager;
    local array<name> OutGibBoneList;
    local int NumGibs;

    if(bShouldExplode)
    {
        Class'KFSM_PlayerCrawler_Suicide'.static.TriggerExplosion(self, DeathExplosionTemplate, true);
        if(WorldInfo.NetMode != NM_DedicatedServer)
        {
            GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
            if(GoreManager != none)
            {
                NumGibs = 10 + Rand(4);
                NumGibs *= GetCharacterMonsterInfo().ExplosionGibScale;
                GetClosestHitBones(NumGibs, Location, OutGibBoneList);
                GoreManager.CauseGibsAndApplyImpulse(self, Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType, Location, OutGibBoneList, none, Mesh.GetBoneLocation(Mesh.GetBoneName(0)));
            }
        }
    }
}

simulated function GetOverheadDebugText(KFHUDBase HUD, out array<string> OverheadTexts, out array<Color> OverheadColors)
{
    local string DebugText;

    super.GetOverheadDebugText(HUD, OverheadTexts, OverheadColors);
    if(MyKFAIC != none)
    {
        DebugText = (((((((DebugText $ "
Phys:") $ (GetPhysicsName())) $ " Floor:") $ string(Floor)) $ " Rot:") $ string(Rotation)) $ " Desired:") $ string(DesiredRotation);
        if(Base != none)
        {
            DebugText = (DebugText $ "
Base:") $ string(Base);
        }
    }
    OverheadTexts[OverheadTexts.Length] = DebugText;
}

simulated function DrawDebugRotation()
{
    local Vector vExtent, StartLoc;

    if(Mesh != none)
    {
        vExtent = vect(0, 0, 1) * (GetCollisionHeight());
        DrawDebugCylinder(Location - vExtent, Location + vExtent, GetCollisionRadius(), 10, 100, 100, 0);
        StartLoc = Location + (vExtent * (GetCollisionRadius()));
        DrawDebugCoordinateSystem(StartLoc, Rotation, 75);
        if(ReachedDesiredRotation() == false)
        {
            DrawDebugLine(Location, Location + (vector(DesiredRotation) * float(750)), 0, 100, 255);
        }
    }
}

simulated function Tick(float DeltaTime)
{
    super(KFPawn).Tick(DeltaTime);
    if(bDebugCrawlerPhysics)
    {
        DrawDebugRotation();
    }
}

function int GetSpotterDialogID()
{
    local int EmergeType;

    if(IsDoingSpecialMove(10))
    {
        EmergeType = SpecialMoveFlags & 15;
        switch(EmergeType)
        {
            case 0:
                return 142;
            case 1:
            case 2:
                return 140;
            case 3:
                return 141;
            default:
                return 125;
                break;
        }
    }
    if(Floor.Z > 0.7)
    {
        return 125;        
    }
    else
    {
        if(Floor.Z < -0.7)
        {
            return 139;            
        }
        else
        {
            return 138;
        }
    }
    return 125;
}

defaultproperties
{
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_Crawler_ARCH.ToxicGasAoE_Explosion'
        Damage=4
        DamageRadius=600
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_PlayerCrawlerSuicide'
        KnockDownStrength=0
        MomentumTransferScale=100
        ExplosionSound=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
    object end
    // Reference: KFGameExplosion'Default__KFPawn_ZedCrawler.ExploTemplate0'
    DeathExplosionTemplate=ExploTemplate0
    bKnockdownWhenJumpedOn=true
    bIsCrawlerClass=true
    CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Crawler_ARCH.ZED_Crawler_Archetype'
    MinSpawnSquadSizeType=ESquadType.EST_Crawler
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=7
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
        MomentumTransfer=25000
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedCrawler.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=10
    XPValues[0]=8
    XPValues[1]=10
    XPValues[2]=10
    XPValues[3]=10
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_Crawler'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Crawler_ANIM.Crawler_AnimGroup'
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedCrawler.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bDisableTurnInPlace=true
    bUseQuadrupedFloorConform=true
    PenetrationResistance=0.5
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedCrawler.Afflictions'
    IncapSettings=/* Array type was not detected. */
    KnockdownImpulseScale=1
    SprintSpeed=500
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawler.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedCrawler.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedCrawler.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedCrawler.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedCrawler.WeaponAmbientEchoHandler'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedCrawler.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedCrawler.DialogAkSoundComponent'
    DamageRecoveryTimeHeavy=0.75
    Mass=50
    GroundSpeed=400
    MaxFallSpeed=6000
    Health=55
    ControllerClass=Class'KFGame.KFAIController_ZedCrawler'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=-48)
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawler.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=40
        CollisionRadius=47
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawler.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedCrawler.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=40
        CollisionRadius=47
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawler.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedCrawler.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
        Translation=(X=0,Y=0,Z=-48)
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedCrawler.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedCrawler.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedCrawler.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedCrawler.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedCrawler.DialogAkSoundComponent'
    bBlocksNavigation=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=40
        CollisionRadius=47
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedCrawler.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=90000,Yaw=45000,Roll=90000)
}