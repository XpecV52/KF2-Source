/*******************************************************************************
 * KFPawn_ZedBloat generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFPawn_ZedBloat extends KFPawn_Monster
    config(Game)
    hidecategories(Navigation);

var protected const name PukeSocketName;
var protected const float VomitRange;
var protected const int VomitDamage;
var protected const float ExplodeRange;
var protected bool bHasExploded;
var protected transient bool bWasDismembered;
var protected const class<KFProjectile> PukeMineProjectileClass;
var protected array<Rotator> DeathPukeMineRotations;
var protected byte NumPukeMinesToSpawnOnDeath;
var protected Vector OldLocation;
var protected Rotator OldRotation;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    if(WorldInfo.Game != none)
    {
        NumPukeMinesToSpawnOnDeath = class<KFDifficulty_Bloat>(DifficultySettings).static.GetPukeMinesToSpawnOnDeath(self, WorldInfo.Game);
    }
}

function ANIMNOTIFY_PukeAttack()
{
    Puke();
}

function Puke()
{
    local Pawn P;
    local Vector PukeLocation, PukeDirection;
    local Rotator PukeRotation;
    local Vector HitLocation, HitNormal, EndTrace, Momentum;
    local Actor HitActor;

    Mesh.GetSocketWorldLocationAndRotation('PukeSocket', PukeLocation, PukeRotation);
    PukeDirection = vector(Rotation);
    PukeDirection.Z = 0;
    foreach WorldInfo.AllPawns(Class'Pawn', P, PukeLocation, VomitRange)
    {
        if(CanPukeOnTarget(P, PukeLocation, PukeDirection))
        {
            DealPukeDamage(P, PukeLocation);
        }        
    }    
    EndTrace = PukeLocation + (PukeDirection * VomitRange);
    HitActor = Trace(HitLocation, HitNormal, EndTrace, PukeLocation, true, vect(10, 10, 10));
    if(((HitActor != none) && HitActor.bCanBeDamaged) && Pawn(HitActor) == none)
    {
        Momentum = EndTrace - PukeLocation;
        Momentum.Z = 0;
        Momentum = Normal(Momentum);
        HitActor.TakeDamage(VomitDamage, Controller, HitLocation, Momentum, Class'KFDT_BloatPuke',, self);
    }
}

function DealPukeDamage(Pawn Victim, Vector Origin)
{
    local Vector VectToEnemy;

    VectToEnemy = Victim.Location - Origin;
    VectToEnemy.Z = 0;
    VectToEnemy = Normal(VectToEnemy);
    Victim.TakeDamage(GetRallyBoostDamage(VomitDamage), Controller, Victim.Location, VectToEnemy, Class'KFDT_BloatPuke',, self);
}

function bool CanPukeOnTarget(Pawn PukeTarget, Vector PukeLocation, Vector PukeDirection)
{
    local Vector VectToEnemy;
    local Box ActorBox;

    if(PukeTarget != none)
    {
        VectToEnemy = PukeTarget.Location - PukeLocation;
        VectToEnemy.Z = 0;
        VectToEnemy = Normal(VectToEnemy);
        PukeTarget.GetComponentsBoundingBox(ActorBox);
        if(((!PukeTarget.bWorldGeometry || PukeTarget.bCanBeDamaged) && ActorBox.Min.Z < PukeLocation.Z) && (VectToEnemy Dot PukeDirection) > 0.5)
        {
            if(PukeTarget.FastTrace((ActorBox.Min + ActorBox.Max) * 0.5, PukeLocation,, true))
            {
                return true;
            }
        }
    }
    return false;
}

function bool CanInjureHitZone(class<DamageType> DamageType, int HitZoneIdx)
{
    if(HitExplosiveBone(HitZones[HitZoneIdx].BoneName))
    {
        return true;
    }
    if(super(KFPawn).CanInjureHitZone(DamageType, HitZoneIdx))
    {
        bWasDismembered = true;
        return true;
    }
    return false;
}

simulated function bool HasInjuredHitZones()
{
    return bWasDismembered || IsHeadless();
}

function bool Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    OldLocation = Location;
    OldRotation = Rotation;
    return super.Died(Killer, DamageType, HitLocation);
}

function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, Vector InstigatorLocation)
{
    local int HitZoneIndex;
    local name HitBoneName;

    super.TakeHitZoneDamage(Damage, DamageType, HitZoneIdx, InstigatorLocation);
    if((((Role == ROLE_Authority) && bPlayedDeath) && !bHasExploded) && TimeOfDeath == WorldInfo.TimeSeconds)
    {
        HitZoneIndex = HitFxInfo.HitBoneIndex;
        if((HitZoneIndex != 255) && (InjuredHitZones & (1 << HitZoneIndex)) > 0)
        {
            HitBoneName = HitZones[HitZoneIndex].BoneName;
            if(HitExplosiveBone(HitBoneName))
            {
                DealExplosionDamage();
                bHasExploded = true;
                SpawnPukeMinesOnDeath();
                SoundGroupArch.PlayObliterationSound(self, false);
            }
        }
    }
}

function bool HitExplosiveBone(name HitBoneName)
{
    local byte JointIndex;
    local KFCharacterInfo_Monster MonsterInfo;

    MonsterInfo = GetCharacterMonsterInfo();
    if(MonsterInfo != none)
    {
        JointIndex = 0;
        J0x2F:

        if(JointIndex < MonsterInfo.GoreJointSettings.Length)
        {
            if((MonsterInfo.GoreJointSettings[JointIndex].HitBoneName == HitBoneName) && MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore.Length > 0)
            {
                return true;
            }
            ++ JointIndex;
            goto J0x2F;
        }
    }
    return false;
}

function DealExplosionDamage()
{
    local Pawn P;
    local Vector HitLocation, HitNormal;
    local Actor HitActor;

    foreach WorldInfo.AllPawns(Class'Pawn', P, Location, ExplodeRange)
    {
        if(P != Instigator)
        {
            HitActor = Instigator.Trace(HitLocation, HitNormal, P.Location, Location, true);
            if((HitActor == none) || HitActor == P)
            {
                DealPukeDamage(P, Location);
            }
        }        
    }    
}

function SpawnPukeMine(Vector SpawnLocation, Rotator SpawnRotation)
{
    local KFProjectile PukeMine;

    PukeMine = Spawn(PukeMineProjectileClass,,, SpawnLocation, SpawnRotation,, true);
    if(PukeMine != none)
    {
        PukeMine.Init(vector(SpawnRotation));
    }
}

function SpawnPukeMinesOnDeath()
{
    local int I;

    J0x00:
    if((NumPukeMinesToSpawnOnDeath > 0) && DeathPukeMineRotations.Length > 0)
    {
        I = Rand(DeathPukeMineRotations.Length);
        SpawnPukeMine(OldLocation, Normalize(OldRotation + DeathPukeMineRotations[I]));
        DeathPukeMineRotations.Remove(I, 1;
        -- NumPukeMinesToSpawnOnDeath;
        goto J0x00;
    }
}

static function int GetTraderAdviceID()
{
    return 41;
}

defaultproperties
{
    VomitRange=350
    VomitDamage=12
    ExplodeRange=500
    PukeMineProjectileClass=Class'KFProj_BloatPukeMine'
    DeathPukeMineRotations(0)=
/* Exception thrown while deserializing DeathPukeMineRotations
System.ArgumentException: Requested value '0_6999' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DeathPukeMineRotations(1)=
/* Exception thrown while deserializing DeathPukeMineRotations
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    DeathPukeMineRotations(2)=
/* Exception thrown while deserializing DeathPukeMineRotations
System.ArgumentException: Requested value '0_1146' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
    bIsBloatClass=true
    MonsterArchPath="ZED_ARCH.ZED_Bloat_Archetype"
    HeadlessBleedOutTime=6
    ParryResistance=3
    MinSpawnSquadSizeType=ESquadType.EST_Large
    begin object name=MeleeHelper class=KFMeleeHelperAI
        BaseDamage=14
        MyDamageType=Class'KFDT_Slashing_ZedWeak'
        MomentumTransfer=25000
        MaxHitRange=250
    object end
    // Reference: KFMeleeHelperAI'Default__KFPawn_ZedBloat.MeleeHelper'
    MeleeAttackHelper=MeleeHelper
    DoshValue=17
    XPValues[0]=17
    XPValues[1]=22
    XPValues[2]=30
    XPValues[3]=34
    DamageTypeModifiers=/* Array type was not detected. */
    DifficultySettings=Class'KFDifficulty_Bloat'
    BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
    SprintAkComponent=AkComponent'Default__KFPawn_ZedBloat.SprintAkComponent0'
    HeadShotAkComponent=AkComponent'Default__KFPawn_ZedBloat.HeadshotAkComponent0'
    PawnAnimInfo=KFPawnAnimInfo'ZED_Bloat_ANIM.Bloat_AnimGroup'
    LocalizationKey=KFPawn_ZedBloat
    begin object name=ThirdPersonHead0 class=SkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: SkeletalMeshComponent'Default__KFPawn_ZedBloat.ThirdPersonHead0'
    ThirdPersonHeadMeshComponent=ThirdPersonHead0
    HitZones=/* Array type was not detected. */
    PenetrationResistance=3
    begin object name=Afflictions class=KFAfflictionManager
        FireFullyCharredDuration=3.5
    object end
    // Reference: KFAfflictionManager'Default__KFPawn_ZedBloat.Afflictions'
    AfflictionHandler=Afflictions
    IncapSettings=/* Array type was not detected. */
    PhysRagdollImpulseScale=1.5
    KnockdownImpulseScale=2
    SprintSpeed=210
    begin object name=FirstPersonArms class=KFSkeletalMeshComponent
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloat.FirstPersonArms'
    ArmsMesh=FirstPersonArms
    begin object name=SpecialMoveHandler class=KFSpecialMoveHandler
        SpecialMoveClasses=/* Array type was not detected. */
    object end
    // Reference: KFSpecialMoveHandler'Default__KFPawn_ZedBloat.SpecialMoveHandler'
    SpecialMoveHandler=SpecialMoveHandler
    AmbientAkComponent=AkComponent'Default__KFPawn_ZedBloat.AmbientAkSoundComponent_1'
    WeaponAkComponent=AkComponent'Default__KFPawn_ZedBloat.AmbientAkSoundComponent'
    WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'Default__KFPawn_ZedBloat.WeaponAmbientEchoHandler'
    SecondaryWeaponAkComponent=AkComponent'Default__KFPawn_ZedBloat.SecondaryWeaponAkSoundComponent'
    FootstepAkComponent=AkComponent'Default__KFPawn_ZedBloat.FootstepAkSoundComponent'
    DialogAkComponent=AkComponent'Default__KFPawn_ZedBloat.DialogAkSoundComponent'
    PowerUpAkComponent=AkComponent'Default__KFPawn_ZedBloat.PowerUpAkSoundComponent'
    DamageRecoveryTimeHeavy=0.85
    Mass=130
    GroundSpeed=150
    Health=405
    ControllerClass=Class'KFAIController_ZedBloat'
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloat.KFPawnSkeletalMeshComponent'
    Mesh=KFPawnSkeletalMeshComponent
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloat.CollisionCylinder'
    CylinderComponent=CollisionCylinder
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__KFPawn_ZedBloat.Sprite'
    Components(0)=Sprite
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloat.CollisionCylinder'
    Components(1)=CollisionCylinder
    begin object name=Arrow class=ArrowComponent
        ReplacementPrimitive=none
    object end
    // Reference: ArrowComponent'Default__KFPawn_ZedBloat.Arrow'
    Components(2)=Arrow
    begin object name=KFPawnSkeletalMeshComponent class=KFSkeletalMeshComponent
        bUpdateKinematicBonesFromAnimation=true
        bPerBoneMotionBlur=false
        ReplacementPrimitive=none
    object end
    // Reference: KFSkeletalMeshComponent'Default__KFPawn_ZedBloat.KFPawnSkeletalMeshComponent'
    Components(3)=KFPawnSkeletalMeshComponent
    Components(4)=AkComponent'Default__KFPawn_ZedBloat.AmbientAkSoundComponent'
    Components(5)=AkComponent'Default__KFPawn_ZedBloat.AmbientAkSoundComponent_1'
    Components(6)=AkComponent'Default__KFPawn_ZedBloat.FootstepAkSoundComponent'
    Components(7)=AkComponent'Default__KFPawn_ZedBloat.DialogAkSoundComponent'
    Components(8)=AkComponent'Default__KFPawn_ZedBloat.PowerUpAkSoundComponent'
    Components(9)=AkComponent'Default__KFPawn_ZedBloat.SecondaryWeaponAkSoundComponent'
    Components(10)=AkComponent'Default__KFPawn_ZedBloat.SprintAkComponent0'
    Components(11)=AkComponent'Default__KFPawn_ZedBloat.HeadshotAkComponent0'
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionRadius=55
        ReplacementPrimitive=none
    object end
    // Reference: CylinderComponent'Default__KFPawn_ZedBloat.CollisionCylinder'
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
}