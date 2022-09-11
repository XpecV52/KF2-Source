/*******************************************************************************
 * KFPawn_ZedBloatKing generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedBloatKing extends KFPawn_ZedBloat
    config(Game)
    hidecategories(Navigation)
    implements(KFInterface_MonsterBoss);

var const localized array<localized string> BossCaptionStrings;
var bool bUseAnimatedCamera;
var Vector AnimatedBossCameraOffset;
var KFPawn PullVictims[11];
var protected const KFGameExplosion FartExplosionTemplate;
var const ParticleSystem FartFXTemplate;
var const name FartFXSocket;
var repnotify byte FartFXNotify;
var repnotify byte PoopMonsterFXNotify;
var Vector2D BaseFartAttackTimer;
var Vector2D VarianceFartAttackTimer;
var Vector2D RageFartAttackTimer;
var Vector2D RageVarianceFartAttackTimer;
var array<Vector2D> DifficultyFartAttackTimers;
var array<Vector2D> DifficultyVarianceFartTimers;
var array<Vector2D> DifficultyRageFartTimers;
var array<Vector2D> DifficultyVarianceRageFartTimers;
var KFTrigger_BloatKingGorge GorgeTrigger;
var const float PoopMonsterOffset;
var ParticleSystem PoopMonsterFXTemplate;
var AkEvent PoopMonsterSFXTemplate;
var const name PoopMonsterFXSocket;
var const float PoopMonsterSpawnDelay;
var int CurrentDelayedSpawns;
var const float RageSprintSpeedMultiplier;
var array<float> EnrageHealthThresholds;
var protected const float FootstepCameraShakePitchAmplitude;
var protected const float FootstepCameraShakeRollAmplitude;

replication
{
     if(Role == ROLE_Authority)
        FartFXNotify, PoopMonsterFXNotify, 
        PullVictims;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'bIsEnraged')
    {
        SetEnraged(bIsEnraged);        
    }
    else
    {
        if(VarName == 'FartFXNotify')
        {
            PlayFartSpawnFX();            
        }
        else
        {
            if(VarName == 'PoopMonsterFXNotify')
            {
                PlayPoopSpawnFX();                
            }
            else
            {
                super(KFPawn_Monster).ReplicatedEvent(VarName);
            }
        }
    }
}

simulated function KFPawn_Monster GetMonsterPawn()
{
    return self;
}

simulated function string GetRandomBossCaption()
{
    if(default.BossCaptionStrings.Length <= 0)
    {
        return "";
    }
    return default.BossCaptionStrings[Rand(default.BossCaptionStrings.Length)];
}

static simulated event bool IsABoss()
{
    return true;
}

simulated function float GetHealthPercent()
{
    return float(Health) / float(HealthMax);
}

simulated function SetAnimatedBossCamera(bool bEnable, optional Vector CameraOffset)
{
    bUseAnimatedCamera = bEnable;
    if(bUseAnimatedCamera)
    {
        AnimatedBossCameraOffset = CameraOffset;        
    }
    else
    {
        AnimatedBossCameraOffset = vect(0, 0, 0);
    }
}

simulated function bool UseAnimatedBossCamera()
{
    return bUseAnimatedCamera;
}

simulated function name GetBossCameraSocket()
{
    return 'TheatricCameraRootSocket';
}

simulated function Vector GetBossCameraOffset()
{
    return AnimatedBossCameraOffset;
}

function OnZedDied(Controller Killer)
{
    super(KFPawn_Monster).OnZedDied(Killer);
    KFGameInfo(WorldInfo.Game).BossDied(Killer);
    ClearFartTimer();
    ClearTimer('AllowNextPoopMonster');
}

function KFAIWaveInfo GetWaveInfo(int BattlePhase, int Difficulty)
{
    return none;
}

function byte GetNumMinionsToSpawn()
{
    return 0;
}

function PossessedBy(Controller C, bool bVehicleTransition)
{
    super(KFPawn_Monster).PossessedBy(C, bVehicleTransition);
    if(DifficultyFartAttackTimers.Length > 0)
    {
        BaseFartAttackTimer = DifficultyFartAttackTimers[Min(WorldInfo.Game.GetModifiedGameDifficulty(), DifficultyFartAttackTimers.Length)];
    }
    if(DifficultyVarianceFartTimers.Length > 0)
    {
        VarianceFartAttackTimer = DifficultyVarianceFartTimers[Min(WorldInfo.Game.GetModifiedGameDifficulty(), DifficultyVarianceFartTimers.Length)];
    }
    if(DifficultyRageFartTimers.Length > 0)
    {
        RageFartAttackTimer = DifficultyRageFartTimers[Min(WorldInfo.Game.GetModifiedGameDifficulty(), DifficultyRageFartTimers.Length)];
    }
    if(DifficultyVarianceRageFartTimers.Length > 0)
    {
        RageVarianceFartAttackTimer = DifficultyVarianceRageFartTimers[Min(WorldInfo.Game.GetModifiedGameDifficulty(), DifficultyVarianceRageFartTimers.Length)];
    }
    PlayBossMusic();
    Class'KFPawn_MonsterBoss'.static.PlayBossEntranceTheatrics((self));
    SetFartAttackTimer();
    GorgeTrigger = Spawn(Class'KFTrigger_BloatKingGorge', self,, Location, Rotation);
    GorgeTrigger.SetBase(self);
    GorgeTrigger.SetRelativeLocation(vect(0, 0, 0));
    GorgeTrigger.CylinderComponent.SetCylinderSize(Sqrt(Class'KFSM_BloatKing_Gorge'.default.GorgeAttackRangeSq), CylinderComponent.CollisionHeight);
}

function PlayBossMusic()
{
    if(KFGameInfo(WorldInfo.Game) != none)
    {
        KFGameInfo(WorldInfo.Game).ForceAbominationMusicTrack();
    }
}

function bool CanObliterateDoors()
{
    return true;
}

event TakeDamage(int Damage, Controller InstigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    super(KFPawn_Monster).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    if((EnrageHealthThresholds.Length > 0) && (float(Health) / float(HealthMax)) < EnrageHealthThresholds[0])
    {
        if(IsCombatCapable())
        {
            EnrageHealthThresholds.Remove(0, 1;
            KFAIController_ZedBloatKing(Controller).StartArmorEnrage();
        }
    }
}

function int GetHitZoneIndex(name BoneName)
{
    if(BoneName == 'KBArmor')
    {
        return OverrideArmorFXIndex;
    }
    return super(KFPawn).GetHitZoneIndex(BoneName);
}

simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects(int HitZoneIdx)
{
    if(HitZoneIdx == OverrideArmorFXIndex)
    {
        return CharacterArch.ImpactSkins[2];
    }
    return super(KFPawn).GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function ZedExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
    super(KFPawn_Monster).ZedExplodeArmor(ArmorZoneIdx, ArmorZoneName);
    Knockdown(((Velocity != vect(0, 0, 0)) ? -Velocity * float(2) : float(3) * (-vector(Rotation) * GroundSpeed)), vect(1, 1, 1),,,,, Location);
}

simulated event bool CanDoSpecialMove(KFGame.KFPawn.ESpecialMove AMove, optional bool bForceCheck)
{
    if(bIsEnraged && AMove == 17)
    {
        return false;
    }
    return super(KFPawn).CanDoSpecialMove(AMove, bForceCheck);
}

function bool ShouldPlaySpecialMeleeAnims()
{
    return IsEnraged();
}

simulated event bool IsEnraged()
{
    return bIsEnraged;
}

simulated function bool SetEnraged(bool bNewEnraged)
{
    local bool bSuccess;

    bSuccess = super(KFPawn_Monster).SetEnraged(bNewEnraged);
    if(bSuccess && Role == ROLE_Authority)
    {
        if(bIsEnraged)
        {
            DoSpecialMove(44, true,, SpecialMoveHandler.SpecialMoveClasses[44].static.PackFlagsBase(self));
            if(GetTimerCount('TimerFartAttack') > Lerp(RageFartAttackTimer.X, RageFartAttackTimer.Y, GetHealthPercentage()))
            {
                ClearFartTimer();
                SetFartAttackTimer();
            }
            if(KFAIController_ZedBloatKing(Controller) != none)
            {
                KFAIController_ZedBloatKing(Controller).SetEnrageTimer();
            }
        }
    }
    return bSuccess;
}

function AdjustMovementSpeed(float SpeedAdjust)
{
    if(bIsEnraged)
    {
        DesiredAdjustedGroundSpeed = (default.GroundSpeed * SpeedAdjust) * InitialGroundSpeedModifier;
        if(IsDoingSpecialMove())
        {
            DesiredAdjustedSprintSpeed = FMax((((default.SprintSpeed * SpeedAdjust) * InitialGroundSpeedModifier) * SpecialMoves[SpecialMove].GetSprintSpeedModifier()) * default.RageSprintSpeedMultiplier, DesiredAdjustedGroundSpeed);            
        }
        else
        {
            DesiredAdjustedSprintSpeed = FMax(((default.SprintSpeed * SpeedAdjust) * InitialGroundSpeedModifier) * default.RageSprintSpeedMultiplier, DesiredAdjustedGroundSpeed);
        }
        NormalGroundSpeed = DesiredAdjustedGroundSpeed;
        NormalSprintSpeed = DesiredAdjustedSprintSpeed;        
    }
    else
    {
        super(KFPawn_Monster).AdjustMovementSpeed(SpeedAdjust);
    }
}

simulated event PlayFootStepSound(int FootDown)
{
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        if(IsHumanControlled() && IsLocallyControlled())
        {
            FootstepCameraShake.RotOscillation.Pitch.Amplitude = 0;
            FootstepCameraShake.RotOscillation.Roll.Amplitude = 0;            
        }
        else
        {
            FootstepCameraShake.RotOscillation.Pitch.Amplitude = FootstepCameraShakePitchAmplitude;
            FootstepCameraShake.RotOscillation.Roll.Amplitude = FootstepCameraShakeRollAmplitude;
            FootstepCameraShakeInnerRadius = default.FootstepCameraShakeInnerRadius;
            FootstepCameraShakeOuterRadius = default.FootstepCameraShakeOuterRadius;
            if(!bIsSprinting || VSizeSq(Velocity) < 10000)
            {
                FootstepCameraShake.RotOscillation.Pitch.Amplitude *= 0.75;
                FootstepCameraShake.RotOscillation.Roll.Amplitude *= 0.75;
            }
        }
    }
    super(KFPawn_Monster).PlayFootStepSound(FootDown);
}

simulated function ANIMNOTIFY_PukeMineAttack()
{
    local Vector SpawnLocation;
    local Rotator SpawnRotation;

    if(Role == ROLE_Authority)
    {
        Mesh.GetSocketWorldLocationAndRotation('PukeSocket', SpawnLocation, SpawnRotation);
        SpawnPukeMine(SpawnLocation, SpawnRotation);
    }
}

function SetFartAttackTimer()
{
    local float HealthPct, TimerValue;

    HealthPct = GetHealthPercentage();
    if(bIsEnraged)
    {
        TimerValue = Lerp(RageFartAttackTimer.X, RageFartAttackTimer.Y, HealthPct) + (((FRand() - 0.5) * 2) * Lerp(RageVarianceFartAttackTimer.X, RageVarianceFartAttackTimer.Y, HealthPct));        
    }
    else
    {
        TimerValue = Lerp(BaseFartAttackTimer.X, BaseFartAttackTimer.Y, HealthPct) + (((FRand() - 0.5) * 2) * Lerp(VarianceFartAttackTimer.X, VarianceFartAttackTimer.Y, HealthPct));
    }
    SetTimer(TimerValue, false, 'TimerFartAttack');
}

function ClearFartTimer()
{
    ClearTimer('TimerFartAttack');
}

simulated function TimerFartAttack()
{
    local Vector FartLocation;
    local Rotator FartRotation;

    if(!IsAliveAndWell())
    {
        ClearTimer('TimerFartAttack');
        return;
    }
    Mesh.GetSocketWorldLocationAndRotation(default.FartFXSocket, FartLocation, FartRotation);
    ++ FartFXNotify;
    PlayFartSpawnFX();
    if(bIsEnraged)
    {
        SpawnPukeMine(FartLocation, FartRotation);
    }
    SetFartAttackTimer();
}

simulated function PlayFartSpawnFX()
{
    local Vector SocketLocation;
    local Rotator SocketRotation;
    local KFExplosion_BloatKingFart ExploActor;

    if(Role == ROLE_Authority)
    {
        SpawnPoopMonster();
    }
    ExploActor = Spawn(Class'KFExplosion_BloatKingFart', self,, Location, Rotation);
    if(ExploActor != none)
    {
        ExploActor.InstigatorController = Controller;
        ExploActor.Instigator = self;
        ExploActor.Explode(FartExplosionTemplate);
    }
    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        Mesh.GetSocketWorldLocationAndRotation(default.FartFXSocket, SocketLocation, SocketRotation);
        WorldInfo.MyEmitterPool.SpawnEmitter(default.FartFXTemplate, SocketLocation, SocketRotation);
    }
}

function AddGorgeVictim(KFPawn NewPawn)
{
    local bool bHuman;
    local int I;

    bHuman = KFPawn_Human(NewPawn) != none;
    NewPawn.SetCollision(true, false);
    NewPawn.SetPhysics(7);
    I = ((bHuman) ? 0 : 6);
    J0x71:

    if(I < ((bHuman) ? 6 : 11))
    {
        if(PullVictims[I] == none)
        {
            PullVictims[I] = NewPawn;
            return;
        }
        ++ I;
        goto J0x71;
    }
}

function RemoveGorgeVictim(KFPawn OldPawn)
{
    local int I;

    OldPawn.SetCollision(true, true);
    OldPawn.SetPhysics(1);
    I = 0;
    J0x40:

    if(I < 11)
    {
        if(PullVictims[I] == OldPawn)
        {
            PullVictims[I] = none;
            return;
        }
        ++ I;
        goto J0x40;
    }
}

function AllowNextPoopMonster()
{
    if(CurrentDelayedSpawns > 0)
    {
        ClearTimer('AllowNextPoopMonster');
        -- CurrentDelayedSpawns;
        SpawnPoopMonster();
    }
}

function SpawnPoopMonster()
{
    local KFPawn_Monster NewZed;
    local Vector X, Y, Z;

    if(IsDoingSpecialMove(38))
    {
        return;
    }
    if(IsTimerActive('AllowNextPoopMonster'))
    {
        ++ CurrentDelayedSpawns;
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    NewZed = Spawn(Class'KFPawn_ZedBloatKingSubspawn',,, Location + (X * PoopMonsterOffset), Rotation,, true);
    if(NewZed != none)
    {
        NewZed.SetPhysics(2);
        KFGameInfo(WorldInfo.Game).SetMonsterDefaults(NewZed);
        NewZed.SpawnDefaultController();
        NewZed.Knockdown(,, vect(1, 1, 1), NewZed.Location, 1000, 100);
        if(KFAIController(NewZed.Controller) != none)
        {
            KFGameInfo(WorldInfo.Game).GetAIDirector().AIList.AddItem(KFAIController(NewZed.Controller);
            KFAIController(NewZed.Controller).SetTeam(1);
        }
        ++ PoopMonsterFXNotify;
        PlayPoopSpawnFX();
    }
    SetTimer(PoopMonsterSpawnDelay, false, 'AllowNextPoopMonster');
}

simulated function PlayPoopSpawnFX()
{
    local Vector SocketLocation;
    local Rotator SocketRotation;

    if(WorldInfo.NetMode != NM_DedicatedServer)
    {
        Mesh.GetSocketWorldLocationAndRotation(default.PoopMonsterFXSocket, SocketLocation, SocketRotation);
        WorldInfo.MyEmitterPool.SpawnEmitter(default.PoopMonsterFXTemplate, SocketLocation, SocketRotation);
        PlaySoundBase(default.PoopMonsterSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
    }
}

function CauseHeadTrauma(optional float BleedOutTime)
{
    BleedOutTime = 5;
    return;
}

simulated function bool PlayDismemberment(int InHitZoneIndex, class<KFDamageType> InDmgType, optional Vector HitDirection)
{
    return false;
}

simulated function PlayHeadAsplode()
{
    return;
}

simulated function ApplyHeadChunkGore(class<KFDamageType> dmgType, Vector HitLocation, Vector HitDirection)
{
    return;
}

simulated function string GetIconPath()
{
    return "ZED_Patriarch_UI.ZED-VS_Icon_Boss";
}

defaultproperties
{
    BossCaptionStrings(0)="The Abomination has heavy armor plating that must be destroyed; it cannot be pierced, but you can shoot around it."
    BossCaptionStrings(1)="The Abomination can eat Zeds and pass them out again as... let's just say their smell does not improve."
    BossCaptionStrings(2)="Don't let the Abomination's size fool you; he can move fast when he wants."
    BossCaptionStrings(3)="Don't let the Abomination get near other Zeds; he can ingest them to... on second thought, you don't want to know."
    BossCaptionStrings(4)="If you let the Abomination get too close he will do far more than vomit on you. Those axes are not for show."
    BossCaptionStrings(5)="Destroying the Abomination's armor will send him into a rage, which is his most deadly state."
    begin object name=ExploTemplate0 class=KFGameExplosion
        ExplosionEffects=KFImpactEffectInfo'ZED_BloatKing_ARCH.FX_GasAoE_Explosion_01'
        Damage=5
        DamageRadius=450
        DamageFalloffExponent=0
        MyDamageType=Class'KFDT_Toxic_BloatKingFart'
        KnockDownStrength=0
        MomentumTransferScale=100
        ExplosionSound=AkEvent'WW_ZED_Abomination.Play_Abomination_AOE_Explo'
        FractureMeshRadius=0
        FracturePartVel=0
        CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=350
        CamShakeOuterRadius=600
    object end
    // Reference: KFGameExplosion'Default__KFPawn_ZedBloatKing.ExploTemplate0'
    FartExplosionTemplate=ExploTemplate0
    FartFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Fart_01'
    FartFXSocket=Poop_Attach
    DifficultyFartAttackTimers(0)=
/* Exception thrown while deserializing DifficultyFartAttackTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyFartAttackTimers(1)=
/* Exception thrown while deserializing DifficultyFartAttackTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyFartAttackTimers(2)=
/* Exception thrown while deserializing DifficultyFartAttackTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyFartAttackTimers(3)=
/* Exception thrown while deserializing DifficultyFartAttackTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceFartTimers(0)=
/* Exception thrown while deserializing DifficultyVarianceFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceFartTimers(1)=
/* Exception thrown while deserializing DifficultyVarianceFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceFartTimers(2)=
/* Exception thrown while deserializing DifficultyVarianceFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceFartTimers(3)=
/* Exception thrown while deserializing DifficultyVarianceFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyRageFartTimers(0)=
/* Exception thrown while deserializing DifficultyRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyRageFartTimers(1)=
/* Exception thrown while deserializing DifficultyRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyRageFartTimers(2)=
/* Exception thrown while deserializing DifficultyRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyRageFartTimers(3)=
/* Exception thrown while deserializing DifficultyRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceRageFartTimers(0)=
/* Exception thrown while deserializing DifficultyVarianceRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceRageFartTimers(1)=
/* Exception thrown while deserializing DifficultyVarianceRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceRageFartTimers(2)=
/* Exception thrown while deserializing DifficultyVarianceRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DifficultyVarianceRageFartTimers(3)=
/* Exception thrown while deserializing DifficultyVarianceRageFartTimers
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    PoopMonsterOffset=-100
    PoopMonsterFXTemplate=ParticleSystem'CHR_Bile_EMIT.FX_Bile_Birth_01'
    PoopMonsterSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Bile_Spawn'
    PoopMonsterFXSocket=Poop_Attach
    PoopMonsterSpawnDelay=2
    RageSprintSpeedMultiplier=1.3
    EnrageHealthThresholds(0)=0.8
    EnrageHealthThresholds(1)=0.6
    EnrageHealthThresholds(2)=0.4
    EnrageHealthThresholds(3)=0.2
    FootstepCameraShakePitchAmplitude=120
    FootstepCameraShakeRollAmplitude=60
    VomitRange=400
    VomitDamage=20
    PukeMineProjectileClass=Class'KFProj_BloatKingPukeMine'
    bCanRage=true
    MonsterArchPath="ZED_ARCH.ZED_BloatKing_Archetype"
    ParryResistance=4
    RepArmorPct[0]=255
    RepArmorPct[1]=255
    RepArmorPct[2]=255
    ArmorZoneStatus=7
    PreviousArmorZoneStatus=7
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=55
        MyDamageType=Class'KFDT_Bludgeon_BloatKing'
        MomentumTransfer=40000
        MaxHitRange=375
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedBloatKing.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=500
    XPValues[0]=1291
    XPValues[1]=1694
    XPValues[2]=1790
    XPValues[3]=1843
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_BloatKing'
    FootstepCameraShakeInnerRadius=200
    FootstepCameraShakeOuterRadius=900
    begin object name=FootstepCameraShake0 class=CameraShake
        bSingleInstance=true
        OscillationDuration=0.25
        RotOscillation=(Pitch=(Amplitude=120,Frequency=60),Roll=(Amplitude=60,Frequency=40))
    object end
    // Reference: CameraShake'Default__KFPawn_ZedBloatKing.FootstepCameraShake0'
    FootstepCameraShake=FootstepCameraShake0
    SprintAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.HeadshotAkComponent0'
    ArmorInfoClass=Class'KFZedArmorInfo_BloatKing'
    OverrideArmorFXIndex=200
    PawnAnimInfo=KFPawnAnimInfo'ZED_BloatKing_ANIM.BloatKing_AnimGroup'
    LocalizationKey=KFPawn_ZedBloatKing
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedBloatKing.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    bCanBePinned=false
    HitZones=/* Array type was not detected. */
    PenetrationResistance=10
    AfflictionHandler=KFAfflictionManager'Default__KFPawn_ZedBloatKing.Afflictions'
    IncapSettings=/* Array type was not detected. */
    SprintSpeed=450
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloatKing.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedBloatKing.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedBloatKing.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedBloatKing.PowerUpAkSoundComponent'
    Mass=400
    GroundSpeed=450
    Health=9000
    ControllerClass=Class'KFAIController_ZedBloatKing'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloatKing.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloatKing.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedBloatKing.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloatKing.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedBloatKing.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloatKing.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedBloatKing.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedBloatKing.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedBloatKing.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedBloatKing.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedBloatKing.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedBloatKing.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedBloatKing.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedBloatKing.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloatKing.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}