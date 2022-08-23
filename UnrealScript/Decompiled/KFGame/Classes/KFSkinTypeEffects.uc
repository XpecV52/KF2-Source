/*******************************************************************************
 * KFSkinTypeEffects generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSkinTypeEffects extends Object
    native(Effect)
    config(Engine)
    hidecategories(Object);

enum EEffectDamageGroup
{
    FXG_Ballistic,
    FXG_Bludgeon,
    FXG_Piercing,
    FXG_Slashing,
    FXG_Fire,
    FXG_Toxic,
    FXG_Healing,
    FXG_Sawblade,
    FXG_DrainLife,
    FXG_IncendiaryRound,
    FXG_UnexplodedGrenade,
    FXG_MicrowaveBlast,
    FXG_ShieldBash,
    FXG_MetalMace,
    FXG_MAX
};

struct native SkinEffectInfo
{
    /** type for readability in editor */
    var() editoronly editconst KFSkinTypeEffects.EEffectDamageGroup Type;
    /** particle system used for this impact */
    var() ParticleSystem DefaultParticle;
    /** If true, attach particle to the hit bone (e.g. fire) */
    var() bool bAttachParticle<DisplayName=Attach FX To Hit Bone|EditCondition=!bAttachToHitLocation>;
    /** If true, attach particle to hit bone but offset to the location of the hit (e.g. electricity) */
    var() bool bAttachToHitLocation<DisplayName=Attach FX to Hit Location|EditCondition=!bAttachParticle>;
    /** Sound used for this impact */
    var() AkEvent DefaultSound;
    /** Sounds used for local player (1st person) impacts only */
    var() AkEvent LocalSound;

    structdefaultproperties
    {
        Type=EEffectDamageGroup.FXG_Ballistic
        DefaultParticle=none
        bAttachParticle=false
        bAttachToHitLocation=false
        DefaultSound=none
        LocalSound=none
    }
};

/** Container for effects per type of damage/weapon */
var() editfixedsize array<SkinEffectInfo> ImpactFX;
/** Dynamic container for additional modability */
var() array<SkinEffectInfo> CustomEffects;
var config float ImpactParticleEffectInterval;
var float ImpactSoundInterval;

function PlayImpactParticleEffect(KFPawn P, Vector HitLocation, Vector HitDirection, byte HitZoneIndex, KFSkinTypeEffects.EEffectDamageGroup EffectGroup)
{
    local ParticleSystem ParticleTemplate;

    ParticleTemplate = GetImpactParticleEffect(EffectGroup);
    if(ParticleTemplate == none)
    {
        return;
    }
    if(ImpactFX[EffectGroup].bAttachParticle)
    {
        AttachEffectToBone(P, ParticleTemplate, HitZoneIndex);        
    }
    else
    {
        if(ImpactFX[EffectGroup].bAttachToHitLocation)
        {
            AttachEffectToHitLocation(P, ParticleTemplate, HitZoneIndex, HitLocation, HitDirection);            
        }
        else
        {
            switch(EffectGroup)
            {
                case 1:
                case 2:
                case 3:
                case 7:
                    MeleeSpawnEffect(P, ParticleTemplate, HitLocation, HitDirection);
                    break;
                default:
                    DefaultSpawnEffect(P, ParticleTemplate, HitLocation, HitDirection);
                    break;
                    break;
            }
        }
    }
}

function ParticleSystemComponent AttachEffectToBone(KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex)
{
    local name HitBoneName;
    local editinline ParticleSystemComponent PSC;

    if((P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval)
    {
        return none;
    }
    P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
    HitBoneName = ((HitZoneIndex != 255) ? P.HitZones[HitZoneIndex].BoneName : P.TorsoBoneName);
    PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitterMeshAttachment(ParticleTemplate, P.Mesh, HitBoneName, false);
    PSC.SetAbsolute(false, true, true);
    return PSC;
}

function ParticleSystemComponent AttachEffectToHitLocation(KFPawn P, ParticleSystem ParticleTemplate, int HitZoneIndex, Vector HitLocation, Vector HitDirection)
{
    local name HitBoneName;
    local int HitBoneIdx;
    local Vector BoneSpaceHitLocation, EmitterLocationOffset;
    local editinline ParticleSystemComponent PSC;

    if((P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) < ImpactParticleEffectInterval)
    {
        return none;
    }
    if(HitZoneIndex != 255)
    {
        HitBoneName = P.HitZones[HitZoneIndex].BoneName;
        HitBoneIdx = P.Mesh.MatchRefBone(HitBoneName);
        if(HitBoneIdx != -1)
        {
            BoneSpaceHitLocation = InverseTransformVector(P.Mesh.GetBoneMatrix(HitBoneIdx), HitLocation);
            EmitterLocationOffset = BoneSpaceHitLocation;
            PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitterMeshAttachment(ParticleTemplate, P.Mesh, HitBoneName, false, EmitterLocationOffset);
            if(PSC != none)
            {
                P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
                PSC.SetAbsolute(false, true, true);
                return PSC;
            }
        }
    }
}

function ParticleSystemComponent MeleeSpawnEffect(KFPawn P, ParticleSystem ParticleTemplate, Vector HitLocation, Vector HitDirection)
{
    local editinline ParticleSystemComponent PSC;

    if((P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) == float(0))
    {
        return none;
    }
    P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
    PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(-HitDirection));
    if(PSC != none)
    {
        PSC.SetLightingChannels(P.PawnLightingChannel);
    }
    return PSC;
}

function ParticleSystemComponent DefaultSpawnEffect(KFPawn P, ParticleSystem ParticleTemplate, Vector HitLocation, Vector HitDirection)
{
    local Vector EmitterDir, EmitterDirRight, EmitterDirLeft, RelativeHitLoc;
    local editinline ParticleSystemComponent PSC;

    if(P.WorldInfo.bDropDetail || P.WorldInfo.GetDetailMode() == 0)
    {
        if((P.WorldInfo.TimeSeconds - P.LastImpactParticleEffectTime) == float(0))
        {
            return none;
        }
        P.LastImpactParticleEffectTime = P.WorldInfo.TimeSeconds;
    }
    HitDirection.Z = 0;
    EmitterDirRight = HitDirection Cross vect(0, 0, 1);
    EmitterDirLeft = -EmitterDirRight;
    RelativeHitLoc = HitLocation - P.Location;
    EmitterDir = (((EmitterDirRight Dot RelativeHitLoc) >= float(0)) ? EmitterDirRight : EmitterDirLeft);
    PSC = P.WorldInfo.ImpactFXEmitterPool.SpawnEmitter(ParticleTemplate, HitLocation, rotator(EmitterDir));
    if(PSC != none)
    {
        PSC.SetLightingChannels(P.PawnLightingChannel);
    }
    return PSC;
}

function ParticleSystem GetImpactParticleEffect(KFSkinTypeEffects.EEffectDamageGroup EffectGroup)
{
    return ImpactFX[EffectGroup].DefaultParticle;
}

function PlayTakeHitSound(KFPawn P, Vector HitLocation, Pawn DamageCauser, KFSkinTypeEffects.EEffectDamageGroup EffectGroup)
{
    local AkEvent ImpactSound;

    if(P.ActorEffectIsRelevant(DamageCauser, false, 4000))
    {
        if((P.WorldInfo.TimeSeconds - P.LastImpactSoundTime) < ImpactSoundInterval)
        {
            return;
        }
        ImpactSound = GetImpactSound(EffectGroup, DamageCauser);
        if(ImpactSound != none)
        {
            P.LastImpactSoundTime = P.WorldInfo.TimeSeconds;
            P.PlaySoundBase(ImpactSound, true,,, HitLocation);
        }
    }
}

function AkEvent GetImpactSound(KFSkinTypeEffects.EEffectDamageGroup EffectGroup, Pawn DamageCauser)
{
    if((((ImpactFX[EffectGroup].LocalSound != none) && DamageCauser != none) && DamageCauser.IsLocallyControlled()) && DamageCauser.IsHumanControlled())
    {
        return ImpactFX[EffectGroup].LocalSound;
    }
    return ImpactFX[EffectGroup].DefaultSound;
}

defaultproperties
{
    ImpactParticleEffectInterval=0.5
    ImpactSoundInterval=0.05
}