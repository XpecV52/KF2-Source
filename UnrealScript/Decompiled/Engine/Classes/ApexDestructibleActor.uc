/*******************************************************************************
 * ApexDestructibleActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ApexDestructibleActor extends Actor
    native(Mesh)
    placeable
    hidecategories(Navigation);

/** Expose LightEnvironment to the user */
var() export editinline DynamicLightEnvironmentComponent LightEnvironment;
/** If set, use this actor's fracture materials instead of the asset's fracture materials. */
var() bool bFractureMaterialOverride;
/** If checked, only a single effect from FractureMaterials is played within the bounding box of all fractured chunks.  The effect chosen will be the one corresponding to the destructible's SupportDepth. */
var() const bool bPlaySingleFractureMaterialEffect;
/** Fracture effects for each fracture level. Used only if Fracture Material Override is set. */
var() const editfixedsize array<FractureMaterial> FractureMaterials;
/** The destructible static component. */
var() const editconst export editinline ApexStaticDestructibleComponent StaticDestructibleComponent;
/** LOD setting.  LOD < 0 enables automatic LOD.  LOD >= 0 forces an LOD setting. */
var() const int LOD;
var init array<init byte> VisibilityFactors;
var transient array<SoundCue> FractureSounds;
var transient array<ParticleSystem> FractureParticleEffects;

event SpawnFractureEmitter(ParticleSystem EmitterTemplate, Vector SpawnLocation, Vector SpawnDirection)
{
    local editinline ParticleSystemComponent PSC;
    local LightingChannelContainer Lights;

    PSC = WorldInfo.MyEmitterPool.SpawnEmitter(EmitterTemplate, SpawnLocation, rotator(SpawnDirection));
    Lights = PSC.LightingChannels;
    Lights.Dynamic = true;
    Lights.bInitialized = true;
    PSC.SetLightingChannels(Lights);
}

// Export UApexDestructibleActor::execCacheFractureEffects(FFrame&, void* const)
native function CacheFractureEffects();

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    CacheFractureEffects();
}

// Export UApexDestructibleActor::execTakeDamage(FFrame&, void* const)
native simulated function TakeDamage(int Damage, Controller EventInstigator, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser);

// Export UApexDestructibleActor::execTakeRadiusDamage(FFrame&, void* const)
native simulated function TakeRadiusDamage(Controller InstigatedBy, float BaseDamage, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HurtOrigin, bool bFullDamage, Actor DamageCauser, optional float DamageFalloffExponent)
{
    DamageFalloffExponent = 1;                                            
}

function OnSetMaterial(SeqAct_SetMaterial Action)
{
    StaticDestructibleComponent.SetMaterial(Action.MaterialIndex, Action.NewMaterial);
}

defaultproperties
{
    LightEnvironment=DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
    begin object name=DestructibleComponent0 class=ApexStaticDestructibleComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bCastDynamicShadow=false
    object end
    // Reference: ApexStaticDestructibleComponent'Default__ApexDestructibleActor.DestructibleComponent0'
    StaticDestructibleComponent=DestructibleComponent0
    LOD=-1
    Components(0)=DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
    begin object name=DestructibleComponent0 class=ApexStaticDestructibleComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bCastDynamicShadow=false
    object end
    // Reference: ApexStaticDestructibleComponent'Default__ApexDestructibleActor.DestructibleComponent0'
    Components(1)=DestructibleComponent0
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bCanBeDamaged=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bNoEncroachCheck=true
    bEdShouldSnap=true
    begin object name=DestructibleComponent0 class=ApexStaticDestructibleComponent
        ReplacementPrimitive=none
        LightEnvironment=DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
        bAllowApproximateOcclusion=true
        bForceDirectLightMap=true
        bCastDynamicShadow=false
    object end
    // Reference: ApexStaticDestructibleComponent'Default__ApexDestructibleActor.DestructibleComponent0'
    CollisionComponent=DestructibleComponent0
}