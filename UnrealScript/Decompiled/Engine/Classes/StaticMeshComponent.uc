/*******************************************************************************
 * StaticMeshComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class StaticMeshComponent extends MeshComponent
    native(Mesh)
    editinlinenew
    noexport
    hidecategories(Object);

enum ELightmapModificationFunction
{
    MLMF_Modulate,
    MLMF_ModulateAlpha,
    MLMF_MAX
};

struct PaintedVertex
{
    var Vector Position;
    var PackedNormal Normal;
    var Color Color;

    structdefaultproperties
    {
        Position=(X=0,Y=0,Z=0)
        Normal=
/* Exception thrown while deserializing Normal
System.ArgumentException: Requested value '0_19102' was not found.
   at System.Enum.TryParseEnum(Type enumType, String value, Boolean ignoreCase, EnumResult& parseResult)
   at System.Enum.Parse(Type enumType, String value, Boolean ignoreCase)
   at UELib.Core.UDefaultProperty.DeserializeTagUE3()
   at UELib.Core.UDefaultProperty.Deserialize()
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) */
        Color=(B=0,G=0,R=0,A=0)
    }
};

struct StaticMeshComponentLODInfo
{
    var private const array<ShadowMap2D> ShadowMaps;
    var private const array<Object> ShadowVertexBuffers;
    var private native const Pointer LightMap;
    var private native const Pointer OverrideVertexColors;
    var private const array<PaintedVertex> PaintedVertices;
    var private const TWSplatterMap2D SplatterMap;

    structdefaultproperties
    {
        ShadowMaps=none
        ShadowVertexBuffers=none
        PaintedVertices=none
        SplatterMap=none
    }
};

/** If 0, auto-select LOD level. if >0, force to (ForcedLodModel-1). */
var() int ForcedLodModel;
var int PreviousLODLevel;
var() const StaticMesh StaticMesh;
var() Color WireframeColor;
/**  
 *Ignore this instance of this static mesh when calculating streaming information.
 *       This can be useful when doing things like applying character textures to static geometry,
 *       to avoid them using distance-based streaming.
 */
var() bool bIgnoreInstanceForTextureStreaming;
var const deprecated bool bOverrideLightMapResolution;
/** Auto-generated lightmap resolution based on mesh bounds */
var() const editconst int LightmapRes;
/** Whether to override the lightmap resolution defined in the static mesh. */
var() const bool bOverrideLightMapRes;
var const deprecated int OverriddenLightMapResolution;
/** Light map resolution used if bOverrideLightMapRes is TRUE */
var() const int OverriddenLightMapRes;
/** Auto-generated splattermap resolution based on mesh bounds */
var(PersistentSplats) const editconst int SplatterMapRes;
/** Whether to override the auto-generated splattermap resolution */
var(PersistentSplats) const bool bOverrideSplatterMapRes;
/** Light map resolution used if bOverrideSplatterMapRes is TRUE */
var(PersistentSplats) const int OverriddenSplatterMapRes;
/** With the default value of 0, the LODMaxRange from the UStaticMesh will be used to control LOD transitions, otherwise this value overrides. */
var() float OverriddenLODMaxRange;
/**  
 *Allows adjusting the desired streaming distance of streaming textures that uses UV 0.
 * 1.0 is the default, whereas a higher value makes the textures stream in sooner from far away.
 * A lower value (0.0-1.0) makes the textures stream in later (you have to be closer).
 */
var() float StreamingDistanceMultiplier;
var const int SubDivisionStepSize;
var const bool bUseSubDivisions;
var const transient bool bForceStaticDecals;
var transient bool bCanHighlightSelectedSections;
/** Whether or not to use the optional simple lightmap modification texture */
var(MobileSettings) bool bUseSimpleLightmapModifications;
/** The texture to use when modifying the simple lightmap texture */
var(MobileSettings) editoronly Texture SimpleLightmapModificationTexture<EditCondition=bUseSimpleLightmapModifications>;
/** The function to use when modifying the simple lightmap texture */
var(MobileSettings) StaticMeshComponent.ELightmapModificationFunction SimpleLightmapModificationFunction<EditCondition=bUseSimpleLightmapModifications>;
/** Never become dynamic, even if my mesh has bCanBecomeDynamic=true */
var(Physics) bool bNeverBecomeDynamic;
/** (Advanded) Overrides StaticMesh's 'IgnoreForVisibilityCollision' flag and respects RBCollideWithChannels. */
var(Collision) const bool bOverrideVisibilityCollision<DisplayName=ForceVisibilityCollision>;
var const array<Guid> IrrelevantLights;
var private serializetext native const array<serializetext StaticMeshComponentLODInfo> LODData;
var private const int VertexPositionVersionNumber;
/** The Lightmass settings for this object. */
var(Lightmass) LightmassPrimitiveSettings LightmassSettings<ScriptOrder=true>;

// Export UStaticMeshComponent::execSetStaticMesh(FFrame&, void* const)
native simulated function bool SetStaticMesh(StaticMesh NewMesh, optional bool bForce);

// Export UStaticMeshComponent::execDisableRBCollisionWithSMC(FFrame&, void* const)
native simulated function DisableRBCollisionWithSMC(PrimitiveComponent OtherSMC, bool bDisabled);

// Export UStaticMeshComponent::execSetForceStaticDecals(FFrame&, void* const)
native final function SetForceStaticDecals(bool bInForceStaticDecals);

// Export UStaticMeshComponent::execCanBecomeDynamic(FFrame&, void* const)
native function bool CanBecomeDynamic();

defaultproperties
{
    WireframeColor=(B=255,G=255,R=0,A=255)
    OverriddenLightMapRes=64
    StreamingDistanceMultiplier=1
    SubDivisionStepSize=32
    bUseSubDivisions=true
    LightmassSettings=(bUseTwoSidedLighting=false,bShadowIndirectOnly=false,bUseEmissiveForStaticLighting=false,EmissiveLightFalloffExponent=2,EmissiveLightExplicitInfluenceRadius=0,EmissiveBoost=1,DiffuseBoost=1,SpecularBoost=1,FullyOccludedSamplesFraction=1)
    ReplacementPrimitive=none
    bAcceptsStaticDecals=true
    CollideActors=true
    BlockActors=true
    BlockZeroExtent=true
    BlockNonZeroExtent=true
    BlockRigidBody=true
    bAllowPreshadows=false
    bAllowPersistentSplatters=true
    TickGroup=ETickingGroup.TG_PreAsyncWork
}