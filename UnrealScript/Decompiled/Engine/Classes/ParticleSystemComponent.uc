/*******************************************************************************
 * ParticleSystemComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemComponent extends PrimitiveComponent
    native(Particle)
    editinlinenew
    hidecategories(Object,Physics,Collision);

enum EParticleSysParamType
{
    PSPT_None,
    PSPT_Scalar,
    PSPT_ScalarRand,
    PSPT_Vector,
    PSPT_VectorRand,
    PSPT_Color,
    PSPT_Actor,
    PSPT_Material,
    PSPT_MAX
};

enum ParticleReplayState
{
    PRS_Disabled,
    PRS_Capturing,
    PRS_Replaying,
    PRS_MAX
};

enum EParticleEventType
{
    EPET_Any,
    EPET_Spawn,
    EPET_Death,
    EPET_Collision,
    EPET_WorldAttractorCollision,
    EPET_Kismet,
    EPET_MAX
};

struct ParticleEmitterInstance
{
};

struct native ParticleEmitterInstanceMotionBlurInfo
{
    var native const transient Map_Mirror ParticleMBInfoMap;
};

struct native ViewParticleEmitterInstanceMotionBlurInfo
{
    var native const transient Map_Mirror EmitterInstanceMBInfoMap;
};

struct native ParticleSysParam
{
    /** The name of the parameter */
    var() name Name;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() ParticleSystemComponent.EParticleSysParamType ParamType;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() float Scalar;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() float Scalar_Low;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() Vector Vector;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() Vector Vector_Low;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() Color Color;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() Actor Actor;
    /**  
     *The type of parameters
     *               PSPT_None       - There is no data type
     *               PSPT_Scalar     - Use the scalar value
     *               PSPT_ScalarRand - Select a scalar value in the range [Scalar_Low..Scalar)
     *               PSPT_Vector     - Use the vector value
     *               PSPT_VectorRand - Select a vector value in the range [Vector_Low..Vector)
     *               PSPT_Color      - Use the color value
     *               PSPT_Actor      - Use the actor value
     *               PSPT_Material   - Use the material value
     */
    var() MaterialInterface Material;

    structdefaultproperties
    {
        Name=None
        ParamType=EParticleSysParamType.PSPT_None
        Scalar=0
        Scalar_Low=0
        Vector=(X=0,Y=0,Z=0)
        Vector_Low=(X=0,Y=0,Z=0)
        Color=(B=0,G=0,R=0,A=0)
        Actor=none
        Material=none
    }
};

struct native ParticleEventData
{
    var int Type;
    var name EventName;
    var float EmitterTime;
    var Vector Location;
    var Vector Direction;
    var Vector Velocity;

    structdefaultproperties
    {
        Type=0
        EventName=None
        EmitterTime=0
        Location=(X=0,Y=0,Z=0)
        Direction=(X=0,Y=0,Z=0)
        Velocity=(X=0,Y=0,Z=0)
    }
};

struct native ParticleEventSpawnData extends ParticleEventData
{
};

struct native ParticleEventDeathData extends ParticleEventData
{
    var float ParticleTime;
};

struct native ParticleEventCollideData extends ParticleEventData
{
    var float ParticleTime;
    var Vector Normal;
    var float Time;
    var int Item;
    var name BoneName;
};

struct native ParticleEventAttractorCollideData extends ParticleEventCollideData
{
};

struct native ParticleEventKismetData extends ParticleEventData
{
    var bool UsePSysCompLocation;
    var Vector Normal;
};

struct native FlexEmitterPreSimPositions
{
    var array<Vector> FlexPreSimPositions;
    var int EmitterIndex;

    structdefaultproperties
    {
        FlexPreSimPositions=none
        EmitterIndex=0
    }
};

var() const ParticleSystem Template;
var const transient array<ParticleSystem> ExtensionTemplates;
var class<ParticleLightEnvironmentComponent> LightEnvironmentClass;
var transient Actor LightEnvironmentSharedInstigator;
var transient int MaxLightEnvironmentPooledReuses;
var native const transient array<Pointer> EmitterInstances;
var private duplicatetransient const transient array<export editinline StaticMeshComponent> SMComponents;
var private duplicatetransient const transient array<MaterialInterface> SMMaterialInterfaces;
var private duplicatetransient const transient array<export editinline SkeletalMeshComponent> SkelMeshComponents;
var native const transient array<ViewParticleEmitterInstanceMotionBlurInfo> ViewMBInfoArray;
/** If true, activate on creation. */
var() bool bAutoActivate;
var const transient bool bWasCompleted;
var const transient bool bSuppressSpawning;
var const transient bool bWasDeactivated;
var() bool bResetOnDetach;
var bool bUpdateOnDedicatedServer;
var transient bool bJustAttached;
var transient bool bIsActive;
var transient bool bHasBeenActivated;
var bool bWarmingUp;
var bool bIsCachedInPool;
/** indicates that the component's LODMethod overrides the Template's */
var(LOD) bool bOverrideLODMethod;
var bool bSkipUpdateDynamicDataDuringTick;
var bool bSkipBoundsUpdate;
var bool bUpdateComponentInTick;
var bool bDeferredBeamUpdate;
var transient bool bForcedInActive;
var transient bool bIsWarmingUp;
var transient bool bIsViewRelevanceDirty;
var transient bool bRecacheViewRelevance;
var transient bool bDepthTestEnabled;
var transient bool bLODUpdatePending;
var transient bool bSkipSpawnCountCheck;
/**  
 *Array holding name instance parameters for this ParticleSystemComponent.
 *       Parameters can be used in Cascade using DistributionFloat/VectorParticleParameters.
 */
var() editinline array<editinline ParticleSysParam> InstanceParameters;
var Vector OldPosition;
var Vector PartSysVelocity;
var float WarmupTime;
var float WarmupTickRate;
var private transient int LODLevel;
/**  
 *Number of seconds of emitter not being rendered that need to pass before it
 * no longer gets ticked/ becomes inactive.
 */
var() float SecondsBeforeInactive;
var private transient float TimeSinceLastForceUpdateTransform;
var float MaxTimeBeforeForceUpdateTransform;
var editoronly int EditorLODLevel;
var editoronly int EditorDetailMode;
var transient float AccumTickTime;
/** The method of LOD level determination to utilize for this particle system */
var(LOD) ParticleSystem.ParticleSystemLODMethod LODMethod;
var const transient ParticleSystemComponent.ParticleReplayState ReplayState;
var const transient array<MaterialViewRelevance> CachedViewRelevanceFlags;
/** Array of replay clips for this particle system component.  These are serialized to disk.  You really should never add anything to this in the editor.  It's exposed so that you can delete clips if you need to, but be careful when doing so! */
var() const editinline array<editinline ParticleSystemReplay> ReplayClips;
var const transient int ReplayClipIDNumber;
var const transient int ReplayFrameIndex;
var transient float AccumLODDistanceCheckTime;
var transient array<ParticleEventSpawnData> SpawnEvents;
var transient array<ParticleEventDeathData> DeathEvents;
var transient array<ParticleEventCollideData> CollisionEvents;
var transient array<ParticleEventKismetData> KismetEvents;
var transient array<ParticleEventAttractorCollideData> AttractorCollisionEvents;
var native const transient Pointer ReleaseResourcesFence;
/** Scales DeltaTime in UParticleSystemComponent::Tick(...) */
var() float CustomTimeDilation;
var transient float EmitterDelay;
var const array<FlexEmitterPreSimPositions> FlexEmitterPreSimState;
var delegate<OnSystemFinished> __OnSystemFinished__Delegate;

delegate OnSystemFinished(ParticleSystemComponent PSystem);

// Export UParticleSystemComponent::execSetTemplate(FFrame&, void* const)
native final function SetTemplate(ParticleSystem NewTemplate);

// Export UParticleSystemComponent::execActivateSystem(FFrame&, void* const)
native final function ActivateSystem(optional bool bFlagAsJustAttached)
{
    bFlagAsJustAttached = false;            
}

// Export UParticleSystemComponent::execDeactivateSystem(FFrame&, void* const)
native final function DeactivateSystem();

// Export UParticleSystemComponent::execKillParticlesForced(FFrame&, void* const)
native final function KillParticlesForced();

// Export UParticleSystemComponent::execKillParticlesInEmitter(FFrame&, void* const)
native final function KillParticlesInEmitter(name InEmitterName);

// Export UParticleSystemComponent::execSetSkipUpdateDynamicDataDuringTick(FFrame&, void* const)
native final function SetSkipUpdateDynamicDataDuringTick(bool bInSkipUpdateDynamicDataDuringTick);

// Export UParticleSystemComponent::execGetSkipUpdateDynamicDataDuringTick(FFrame&, void* const)
native final function bool GetSkipUpdateDynamicDataDuringTick();

// Export UParticleSystemComponent::execSetSkipBoundsUpdate(FFrame&, void* const)
native final function SetSkipBoundsUpdate(bool bInSkipBoundsUpdate);

// Export UParticleSystemComponent::execGetSkipBoundsUpdate(FFrame&, void* const)
native final function bool GetSkipBoundsUpdate();

// Export UParticleSystemComponent::execSetKillOnDeactivate(FFrame&, void* const)
native function SetKillOnDeactivate(int EmitterIndex, bool bKill);

// Export UParticleSystemComponent::execSetKillOnCompleted(FFrame&, void* const)
native function SetKillOnCompleted(int EmitterIndex, bool bKill);

// Export UParticleSystemComponent::execRewindEmitterInstance(FFrame&, void* const)
native function RewindEmitterInstance(int EmitterIndex);

// Export UParticleSystemComponent::execRewindEmitterInstances(FFrame&, void* const)
native function RewindEmitterInstances();

// Export UParticleSystemComponent::execSetBeamType(FFrame&, void* const)
native function SetBeamType(int EmitterIndex, int NewMethod);

// Export UParticleSystemComponent::execSetBeamTessellationFactor(FFrame&, void* const)
native function SetBeamTessellationFactor(int EmitterIndex, float NewFactor);

// Export UParticleSystemComponent::execSetBeamEndPoint(FFrame&, void* const)
native function SetBeamEndPoint(int EmitterIndex, Vector NewEndPoint);

// Export UParticleSystemComponent::execSetBeamDistance(FFrame&, void* const)
native function SetBeamDistance(int EmitterIndex, float Distance);

// Export UParticleSystemComponent::execSetBeamSourcePoint(FFrame&, void* const)
native function SetBeamSourcePoint(int EmitterIndex, Vector NewSourcePoint, int SourceIndex);

// Export UParticleSystemComponent::execSetBeamSourceTangent(FFrame&, void* const)
native function SetBeamSourceTangent(int EmitterIndex, Vector NewTangentPoint, int SourceIndex);

// Export UParticleSystemComponent::execSetBeamSourceStrength(FFrame&, void* const)
native function SetBeamSourceStrength(int EmitterIndex, float NewSourceStrength, int SourceIndex);

// Export UParticleSystemComponent::execSetBeamTargetPoint(FFrame&, void* const)
native function SetBeamTargetPoint(int EmitterIndex, Vector NewTargetPoint, int TargetIndex);

// Export UParticleSystemComponent::execSetBeamTargetTangent(FFrame&, void* const)
native function SetBeamTargetTangent(int EmitterIndex, Vector NewTangentPoint, int TargetIndex);

// Export UParticleSystemComponent::execSetBeamTargetStrength(FFrame&, void* const)
native function SetBeamTargetStrength(int EmitterIndex, float NewTargetStrength, int TargetIndex);

// Export UParticleSystemComponent::execDetermineLODLevelForLocation(FFrame&, void* const)
native function int DetermineLODLevelForLocation(const out Vector EffectLocation);

// Export UParticleSystemComponent::execGetMaxLifespan(FFrame&, void* const)
native function float GetMaxLifespan();

// Export UParticleSystemComponent::execSystemHasCompleted(FFrame&, void* const)
native function bool SystemHasCompleted();

// Export UParticleSystemComponent::execSetLODLevel(FFrame&, void* const)
native final function SetLODLevel(int InLODLevel);

// Export UParticleSystemComponent::execSetEditorLODLevel(FFrame&, void* const)
native final function SetEditorLODLevel(int InLODLevel);

// Export UParticleSystemComponent::execGetLODLevel(FFrame&, void* const)
native final function int GetLODLevel();

// Export UParticleSystemComponent::execGetEditorLODLevel(FFrame&, void* const)
native final function int GetEditorLODLevel();

// Export UParticleSystemComponent::execSetFloatParameter(FFrame&, void* const)
native final function SetFloatParameter(name ParameterName, float Param);

// Export UParticleSystemComponent::execSetFloatRandParameter(FFrame&, void* const)
native final function SetFloatRandParameter(name ParameterName, float Param, float ParamLow);

// Export UParticleSystemComponent::execSetVectorParameter(FFrame&, void* const)
native final function SetVectorParameter(name ParameterName, Vector Param);

// Export UParticleSystemComponent::execSetVectorRandParameter(FFrame&, void* const)
native final function SetVectorRandParameter(name ParameterName, const out Vector Param, const out Vector ParamLow);

// Export UParticleSystemComponent::execSetColorParameter(FFrame&, void* const)
native final function SetColorParameter(name ParameterName, Color Param);

// Export UParticleSystemComponent::execSetActorParameter(FFrame&, void* const)
native final function SetActorParameter(name ParameterName, Actor Param);

// Export UParticleSystemComponent::execSetMaterialParameter(FFrame&, void* const)
native final function SetMaterialParameter(name ParameterName, MaterialInterface Param);

// Export UParticleSystemComponent::execGetFloatParameter(FFrame&, void* const)
native function bool GetFloatParameter(const name InName, out float OutFloat);

// Export UParticleSystemComponent::execGetVectorParameter(FFrame&, void* const)
native function bool GetVectorParameter(const name InName, out Vector OutVector);

// Export UParticleSystemComponent::execGetColorParameter(FFrame&, void* const)
native function bool GetColorParameter(const name InName, out Color OutColor);

// Export UParticleSystemComponent::execGetActorParameter(FFrame&, void* const)
native function bool GetActorParameter(const name InName, out Actor OutActor);

// Export UParticleSystemComponent::execGetMaterialParameter(FFrame&, void* const)
native function bool GetMaterialParameter(const name InName, out MaterialInterface OutMaterial);

// Export UParticleSystemComponent::execClearParameter(FFrame&, void* const)
native final function ClearParameter(name ParameterName, optional ParticleSystemComponent.EParticleSysParamType ParameterType);

// Export UParticleSystemComponent::execSetActive(FFrame&, void* const)
native final function SetActive(bool bNowActive, optional bool bFlagAsJustAttached);

// Export UParticleSystemComponent::execResetToDefaults(FFrame&, void* const)
native final function ResetToDefaults();

// Export UParticleSystemComponent::execSetStopSpawning(FFrame&, void* const)
native final function SetStopSpawning(int InEmitterIndex, bool bInStopSpawning);

defaultproperties
{
    LightEnvironmentClass=Class'ParticleLightEnvironmentComponent'
    MaxLightEnvironmentPooledReuses=10
    bAutoActivate=true
    bIsViewRelevanceDirty=true
    bDepthTestEnabled=true
    SecondsBeforeInactive=1
    MaxTimeBeforeForceUpdateTransform=5
    EditorDetailMode=-1
    CustomTimeDilation=1
    ReplacementPrimitive=none
    bTickInEditor=true
}