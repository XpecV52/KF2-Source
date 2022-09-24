/*******************************************************************************
 * KFDamageType generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFDamageType extends DamageType
    abstract;

enum EDamageOverTimeGroup
{
    DOT_None,
    DOT_Fire,
    DOT_Toxic,
    DOT_Bleeding,
    DOT_MAX
};

enum EGoreDamageGroup
{
    DGT_None,
    DGT_AssaultRifle,
    DGT_Rifle,
    DGT_Submachinegun,
    DGT_Shotgun,
    DGT_Handgun,
    DGT_Explosive,
    DGT_MeleeSlash,
    DGT_MeleeBludgeon,
    DGT_Fire,
    DGT_EMP,
    DGT_Obliteration,
    DGT_MAX
};

var class<KFWeaponDefinition> WeaponDef;
var bool bNoInstigatorDamage;
var bool bNoFriendlyFire;
var bool bNonLethalDamage;
var bool bConsideredIndirectOrAoE;
var bool bAllowAIDoorDestruction;
var bool bCanPlayDeadHitEffects;
var bool bStackDoT;
var bool bHasToSpawnMicrowaveFire;
var bool bAnyPerk;
var bool bShouldSpawnBloodSplat;
var bool bShouldSpawnPersistentBlood;
var bool bCanGib;
var bool bIgnoreAggroOnDamage;
var bool bCanObliterate;
var bool bUseHitLocationForGibImpulses;
var bool bPointImpulseTowardsOrigin;
var bool bNoPain;
var bool bIgnoreSelfInflictedScale;
var bool bIgnoreZedOnZedScaling;
var bool bIsTrapDamage;
var float HeadDestructionDamageScale;
var float HeadDestructionImpulseForceScale;
var KFDamageType.EDamageOverTimeGroup DoT_Type;
var KFSkinTypeEffects.EEffectDamageGroup EffectGroup;
var KFDamageType.EGoreDamageGroup GoreDamageGroup;
var float DoT_Duration;
var float DoT_Interval;
var float DoT_DamageScale;
var float StunPower;
var float KnockdownPower;
var float StumblePower;
var float LegStumblePower;
var float GunHitPower;
var float MeleeHitPower;
var float BurnPower;
var float EMPPower;
var float PoisonPower;
var float MicrowavePower;
var float FreezePower;
var float SnarePower;
var float BleedPower;
var float BigHeadPower;
var float ShrinkPower;
var array< class<KFPerk> > ModifierPerkList;
var array<MaterialInstance> BodyWoundDecalMaterials;
var float BodyWoundDecalWidth;
var float BodyWoundDecalHeight;
var name ScreenMaterialName;
var class<EmitterCameraLensEffectBase> CameraLensEffectTemplate;
var class<EmitterCameraLensEffectBase> AltCameraLensEffectTemplate;
/** How low the pawn's health must get for this damage type to cause obliteration */
var(Obliteration) int ObliterationHealthThreshold;
/** How much damage this damage type must deal before causing obliteration */
var(Obliteration) int ObliterationDamageThreshold;
var float MaxObliterationGibs;
var float GibImpulseScale;
var float ImpulseOriginScale;
var float ImpulseOriginLift;
var float BloodSpread;
var float BloodScale<ClampMin=0.0|ClampMax=1.0>;
var name DeathMaterialEffectParamName;
var float DeathMaterialEffectDuration;
var ParticleSystem OverrideImpactEffect;
var AkEvent OverrideImpactSound;
var float DamageModifierAP;

static simulated function AddBloodSpread(KFPawn_Monster inPawn, Vector HitDirection, out array<Vector> HitSpread, bool bIsDismemberingHit, bool bWasObliterated)
{
    local float RandY, RandZ;
    local Rotator BaseRot;
    local Vector X, Y, Z;

    if(default.BloodSpread > float(0))
    {
        BaseRot = rotator(HitDirection);
        GetAxes(BaseRot, X, Y, Z);
        RandY = FRand() - 0.5;
        RandZ = Sqrt(0.5 - Square(RandY)) * (FRand() - 0.5);
        HitSpread.AddItem((X + ((RandY * default.BloodSpread) * Y)) + ((RandZ * default.BloodSpread) * Z);        
    }
    else
    {
        HitSpread.AddItem(HitDirection;
    }
}

static simulated function float GetBloodScale(float HitZoneScale, bool bIsDismemberingHit, bool bWasObliterated)
{
    return (default.BloodScale * HitZoneScale) * ((bIsDismemberingHit || bWasObliterated) ? 2 : 1);
}

static function float GetGoreDamageScale(Vector Location, Vector InstigatorLocation)
{
    return 1;
}

static function float GetOnDeathGoreScale()
{
    return 3;
}

static simulated function bool CanDismemberHitZone(name InHitZoneName);

static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
    return true;
}

static simulated function GetBoneToDismember(KFPawn_Monster inPawn, Vector HitDirection, name InHitZoneName, out name OutBoneName);

static simulated function ModifyDismembermentHitImpulse(KFPawn_Monster inPawn, name InHitZoneName, Vector HitDirection, out Vector OutImpulseDir, out Vector OutParentImpulseDir, out float OutImpluseScale, out float OutParentImpulseScale);

static simulated function class<KFProj_PinningBullet> GetPinProjectileClass()
{
    return none;
}

static function int GetKillerDialogID()
{
    return -1;
}

static function int GetDamagerDialogID()
{
    return 106;
}

static function int GetDamageeDialogID()
{
    return -1;
}

static function ApplySecondaryDamage(KFPawn Victim, int DamageTaken, optional Controller InstigatedBy)
{
    if(default.DoT_Type != 0)
    {
        Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, default.Class);
    }
}

static function PlayImpactHitEffects(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
    local KFSkinTypeEffects SkinType;

    if((P.CharacterArch != none) && default.EffectGroup < 22)
    {
        SkinType = P.GetHitZoneSkinTypeEffects(HitZoneIndex);
        if(SkinType != none)
        {
            if(default.OverrideImpactEffect != none)
            {
                P.WorldInfo.MyEmitterPool.SpawnEmitter(default.OverrideImpactEffect, HitLocation, rotator(-HitDirection), P);                
            }
            else
            {
                SkinType.PlayImpactParticleEffect(P, HitLocation, HitDirection, HitZoneIndex, default.EffectGroup);
            }
            if(default.OverrideImpactSound != none)
            {
                P.PlaySoundBase(default.OverrideImpactSound, true,,, HitLocation);                
            }
            else
            {
                SkinType.PlayTakeHitSound(P, HitLocation, HitInstigator, default.EffectGroup);
            }
            return;
        }
    }
    if(default.OverrideImpactEffect != none)
    {
        P.WorldInfo.MyEmitterPool.SpawnEmitter(default.OverrideImpactEffect, HitLocation, rotator(-HitDirection), P);
    }
    if(default.OverrideImpactSound != none)
    {
        P.PlaySoundBase(default.OverrideImpactSound, true,,, HitLocation);
    }
}

static function bool IsNotPerkBound()
{
    return default.bAnyPerk;
}

static function bool CheckObliterate(Pawn P, int Damage)
{
    return (P.Health <= default.ObliterationHealthThreshold) && Damage > default.ObliterationDamageThreshold;
}

static function bool AlwaysPoisons()
{
    return false;
}

static function ApplyKillResults(KFPawn KilledPawn);

static function bool CanPlayDeadHitEffects()
{
    return default.bCanPlayDeadHitEffects;
}

defaultproperties
{
    bCanPlayDeadHitEffects=true
    bHasToSpawnMicrowaveFire=true
    HeadDestructionDamageScale=1
    HeadDestructionImpulseForceScale=1
    EffectGroup=EEffectDamageGroup.None
    BodyWoundDecalWidth=20
    BodyWoundDecalHeight=20
    GibImpulseScale=0.1
    ImpulseOriginScale=50
    BloodScale=1
    bExtraMomentumZ=false
    bCausesFracture=true
    KDamageImpulse=400
}