/*******************************************************************************
 * Texture generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Texture extends Surface
    abstract
    native(Texture);

enum TextureCompressionSettings
{
    TC_Default,
    TC_Normalmap,
    TC_Displacementmap,
    TC_NormalmapAlpha,
    TC_Grayscale,
    TC_HighDynamicRange,
    TC_OneBitAlpha,
    TC_NormalmapUncompressed,
    TC_NormalmapBC5,
    TC_OneBitMonochrome,
    TC_SimpleLightmapModification,
    TC_VectorDisplacementmap,
    TC_MAX
};

enum EPixelFormat
{
    PF_Unknown,
    PF_A32B32G32R32F,
    PF_A8R8G8B8,
    PF_G8,
    PF_G16,
    PF_DXT1,
    PF_DXT3,
    PF_DXT5,
    PF_UYVY,
    PF_FloatRGB,
    PF_FloatRGBA,
    PF_DepthStencil,
    PF_ShadowDepth,
    PF_FilteredShadowDepth,
    PF_R32F,
    PF_G16R16,
    PF_G16R16F,
    PF_G16R16F_FILTER,
    PF_G32R32F,
    PF_A2B10G10R10,
    PF_A16B16G16R16,
    PF_D24,
    PF_R16F,
    PF_R16F_FILTER,
    PF_BC5,
    PF_V8U8,
    PF_A1,
    PF_FloatR11G11B10,
    PF_A4R4G4B4,
    PF_R5G6B5,
    PF_MAX
};

enum TextureFilter<TF_Nearest.DisplayName=Nearest|TF_Linear.DisplayName=Linear>
{
    TF_Nearest,
    TF_Linear,
    TF_MAX
};

enum TextureAddress<TA_Wrap.DisplayName=Wrap|TA_Clamp.DisplayName=Clamp|TA_Mirror.DisplayName=Mirror>
{
    TA_Wrap,
    TA_Clamp,
    TA_Mirror,
    TA_MAX
};

enum TextureGroup<TEXTUREGROUP_World.DisplayName=World|TEXTUREGROUP_WorldNormalMap.DisplayName=WorldNormalMap|TEXTUREGROUP_WorldSpecular.DisplayName=WorldSpecular|TEXTUREGROUP_Character.DisplayName=Character|TEXTUREGROUP_CharacterNormalMap.DisplayName=CharacterNormalMap|TEXTUREGROUP_CharacterSpecular.DisplayName=CharacterSpecular|TEXTUREGROUP_Weapon.DisplayName=Weapon|TEXTUREGROUP_WeaponNormalMap.DisplayName=WeaponNormalMap|TEXTUREGROUP_WeaponSpecular.DisplayName=WeaponSpecular|TEXTUREGROUP_Vehicle.DisplayName=Vehicle|TEXTUREGROUP_VehicleNormalMap.DisplayName=VehicleNormalMap|TEXTUREGROUP_VehicleSpecular.DisplayName=VehicleSpecular|TEXTUREGROUP_Cinematic.DisplayName=Cinematic|TEXTUREGROUP_Effects.DisplayName=Effects|TEXTUREGROUP_EffectsNotFiltered.DisplayName=EffectsNotFiltered|TEXTUREGROUP_Skybox.DisplayName=Skybox|TEXTUREGROUP_UI.DisplayName=UI|TEXTUREGROUP_Lightmap.DisplayName=Lightmap|TEXTUREGROUP_RenderTarget.DisplayName=RenderTarget|TEXTUREGROUP_MobileFlattened.DisplayName=MobileFlattened|TEXTUREGROUP_ProcBuilding_Face.DisplayName=ProcBuilding_Face|TEXTUREGROUP_ProcBuilding_LightMap.DisplayName=ProcBuilding_LightMap|TEXTUREGROUP_Shadowmap.DisplayName=Shadowmap|TEXTUREGROUP_ColorLookupTable.DisplayName=ColorLookupTable|TEXTUREGROUP_Terrain_Heightmap.DisplayName=Terrain_Heightmap|TEXTUREGROUP_Terrain_Weightmap.DisplayName=Terrain_Weightmap|TEXTUREGROUP_ImageBasedReflection.DisplayName=ImageBasedReflection|TEXTUREGROUP_Bokeh.DisplayName=Bokeh|TEXTUREGROUP_Creature.DisplayName=Creature|TEXTUREGROUP_CreatureNormalMap.DisplayName=CreatureNormalMap|TEXTUREGROUP_CreatureSpecular.DisplayName=CreatureSpecular|TEXTUREGROUP_Weapon3rd.DisplayName=Weapon3rd|TEXTUREGROUP_Weapon3rdNormalMap.DisplayName=Weapon3rdNormalMap|TEXTUREGROUP_Weapon3rdSpecular.DisplayName=Weapon3rdSpecular|TEXTUREGROUP_Splattermap.DisplayName=Splattermap>
{
    TEXTUREGROUP_World,
    TEXTUREGROUP_WorldNormalMap,
    TEXTUREGROUP_WorldSpecular,
    TEXTUREGROUP_Character,
    TEXTUREGROUP_CharacterNormalMap,
    TEXTUREGROUP_CharacterSpecular,
    TEXTUREGROUP_Weapon,
    TEXTUREGROUP_WeaponNormalMap,
    TEXTUREGROUP_WeaponSpecular,
    TEXTUREGROUP_Vehicle,
    TEXTUREGROUP_VehicleNormalMap,
    TEXTUREGROUP_VehicleSpecular,
    TEXTUREGROUP_Cinematic,
    TEXTUREGROUP_Effects,
    TEXTUREGROUP_EffectsNotFiltered,
    TEXTUREGROUP_Skybox,
    TEXTUREGROUP_UI,
    TEXTUREGROUP_Lightmap,
    TEXTUREGROUP_RenderTarget,
    TEXTUREGROUP_MobileFlattened,
    TEXTUREGROUP_ProcBuilding_Face,
    TEXTUREGROUP_ProcBuilding_LightMap,
    TEXTUREGROUP_Shadowmap,
    TEXTUREGROUP_ColorLookupTable,
    TEXTUREGROUP_Terrain_Heightmap,
    TEXTUREGROUP_Terrain_Weightmap,
    TEXTUREGROUP_ImageBasedReflection,
    TEXTUREGROUP_Bokeh,
    TEXTUREGROUP_Creature,
    TEXTUREGROUP_CreatureNormalMap,
    TEXTUREGROUP_CreatureSpecular,
    TEXTUREGROUP_Weapon3rd,
    TEXTUREGROUP_Weapon3rdNormalMap,
    TEXTUREGROUP_Weapon3rdSpecular,
    TEXTUREGROUP_Splattermap,
    TEXTUREGROUP_MAX
};

enum TextureMipGenSettings<TMGS_FromTextureGroup.DisplayName=FromTextureGroup|TMGS_SimpleAverage.DisplayName=SimpleAverage|TMGS_Sharpen0.DisplayName=Sharpen0|TMGS_Sharpen1.DisplayName=Sharpen1|TMGS_Sharpen2.DisplayName=Sharpen2|TMGS_Sharpen3.DisplayName=Sharpen3|TMGS_Sharpen4.DisplayName=Sharpen4|TMGS_Sharpen5.DisplayName=Sharpen5|TMGS_Sharpen6.DisplayName=Sharpen6|TMGS_Sharpen7.DisplayName=Sharpen7|TMGS_Sharpen8.DisplayName=Sharpen8|TMGS_Sharpen9.DisplayName=Sharpen9|TMGS_Sharpen10.DisplayName=Sharpen10|TMGS_NoMipmaps.DisplayName=NoMipmaps|TMGS_LeaveExistingMips.DisplayName=LeaveExistingMips|TMGS_Blur1.DisplayName=Blur1|TMGS_Blur2.DisplayName=Blur2|TMGS_Blur3.DisplayName=Blur3|TMGS_Blur4.DisplayName=Blur4|TMGS_Blur5.DisplayName=Blur5>
{
    TMGS_FromTextureGroup,
    TMGS_SimpleAverage,
    TMGS_Sharpen0,
    TMGS_Sharpen1,
    TMGS_Sharpen2,
    TMGS_Sharpen3,
    TMGS_Sharpen4,
    TMGS_Sharpen5,
    TMGS_Sharpen6,
    TMGS_Sharpen7,
    TMGS_Sharpen8,
    TMGS_Sharpen9,
    TMGS_Sharpen10,
    TMGS_NoMipmaps,
    TMGS_LeaveExistingMips,
    TMGS_Blur1,
    TMGS_Blur2,
    TMGS_Blur3,
    TMGS_Blur4,
    TMGS_Blur5,
    TMGS_MAX
};

enum ETextureMipCount
{
    TMC_ResidentMips,
    TMC_AllMips,
    TMC_AllMipsBiased,
    TMC_MAX
};

struct native TextureGroupContainer
{
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_World;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_WorldNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_WorldSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Character;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_CharacterNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_CharacterSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Weapon;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_WeaponNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_WeaponSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Vehicle;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_VehicleNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_VehicleSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Cinematic;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Effects;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_EffectsNotFiltered;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Skybox;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_UI;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Lightmap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_RenderTarget;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_MobileFlattened;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_ProcBuilding_Face;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_ProcBuilding_LightMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Shadowmap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_ColorLookupTable;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Terrain_Heightmap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Terrain_Weightmap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_ImageBasedReflection;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Bokeh;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Creature;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_CreatureNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_CreatureSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Weapon3rd;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Weapon3rdNormalMap;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Weapon3rdSpecular;
    /** Select texture group(s) */
    var() const bool TEXTUREGROUP_Splattermap;

    structdefaultproperties
    {
        TEXTUREGROUP_World=false
        TEXTUREGROUP_WorldNormalMap=false
        TEXTUREGROUP_WorldSpecular=false
        TEXTUREGROUP_Character=false
        TEXTUREGROUP_CharacterNormalMap=false
        TEXTUREGROUP_CharacterSpecular=false
        TEXTUREGROUP_Weapon=false
        TEXTUREGROUP_WeaponNormalMap=false
        TEXTUREGROUP_WeaponSpecular=false
        TEXTUREGROUP_Vehicle=false
        TEXTUREGROUP_VehicleNormalMap=false
        TEXTUREGROUP_VehicleSpecular=false
        TEXTUREGROUP_Cinematic=false
        TEXTUREGROUP_Effects=false
        TEXTUREGROUP_EffectsNotFiltered=false
        TEXTUREGROUP_Skybox=false
        TEXTUREGROUP_UI=false
        TEXTUREGROUP_Lightmap=false
        TEXTUREGROUP_RenderTarget=false
        TEXTUREGROUP_MobileFlattened=false
        TEXTUREGROUP_ProcBuilding_Face=false
        TEXTUREGROUP_ProcBuilding_LightMap=false
        TEXTUREGROUP_Shadowmap=false
        TEXTUREGROUP_ColorLookupTable=false
        TEXTUREGROUP_Terrain_Heightmap=false
        TEXTUREGROUP_Terrain_Weightmap=false
        TEXTUREGROUP_ImageBasedReflection=false
        TEXTUREGROUP_Bokeh=false
        TEXTUREGROUP_Creature=false
        TEXTUREGROUP_CreatureNormalMap=false
        TEXTUREGROUP_CreatureSpecular=false
        TEXTUREGROUP_Weapon3rd=false
        TEXTUREGROUP_Weapon3rdNormalMap=false
        TEXTUREGROUP_Weapon3rdSpecular=false
        TEXTUREGROUP_Splattermap=false
    }
};

/** @warning: make sure to update UTexture::PostEditChange if you add an option that might require recompression. Texture settings. */
var() bool SRGB;
var bool RGBE;
var bool bIsSourceArtUncompressed;
var() bool CompressionNoAlpha;
var bool CompressionNone;
var deprecated bool CompressionNoMipmaps;
var() bool CompressionFullDynamicRange;
var() bool DeferCompression;
var bool NeverStream;
/** When TRUE, the alpha channel of mip-maps and the base image are dithered for smooth LOD transitions. */
var() bool bDitherMipMapAlpha;
/** If TRUE, the color border pixels are preserved by mipmap generation.  One flag per color channel. */
var() bool bPreserveBorderR;
var() bool bPreserveBorderG;
var() bool bPreserveBorderB;
var() bool bPreserveBorderA;
var const bool bNoTiling;
/** For DXT1 textures, setting this will cause the texture to be twice the size, but better looking, on iPhone */
var(Mobile) bool bForcePVRTC4;
var private const transient bool bAsyncResourceReleaseHasBeenStarted;
var private const transient bool bUseCinematicMipLevels;
var() float UnpackMin[4];
var() float UnpackMax[4];
var native const UntypedBulkData_Mirror SourceArt;
var() Texture.TextureCompressionSettings CompressionSettings;
/** The texture filtering mode to use when sampling this texture. */
var() Texture.TextureFilter Filter;
/** Texture group this texture belongs to for LOD bias */
var() Texture.TextureGroup LODGroup;
var private transient Texture.TextureGroup CachedLODGroup;
/** Per asset specific setting to define the mip-map generation properties like sharpening and kernel size. */
var() Texture.TextureMipGenSettings MipGenSettings;
/** A bias to the index of the top mip level to use. */
var() int LODBias;
var transient int CachedCombinedLODBias;
/** Number of mip-levels to use for cinematic quality. */
var() int NumCinematicMipLevels;
/** Path to the resource used to construct this texture */
var() editoronly string SourceFilePath;
/** The texture's resource. */
var() editoronly editconst string SourceFileTimestamp;
var native const Pointer Resource;
var private editoronly const Guid LightingGuid;
/** Static texture brightness adjustment (scales HSV value.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustBrightness;
/** Static texture curve adjustment (raises HSV value to the specified power.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustBrightnessCurve;
/** Static texture "vibrance" adjustment (0 - 1) (HSV saturation algorithm adjustment.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustVibrance;
/** Static texture saturation adjustment (scales HSV saturation.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustSaturation;
/** Static texture RGB curve adjustment (raises linear-space RGB color to the specified power.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustRGBCurve;
/** Static texture hue adjustment (0 - 360) (offsets HSV hue by value in degrees.)  (Non-destructive; Requires texture source art to be available.) */
var() float AdjustHue;
var const int InternalFormatLODBias;

defaultproperties
{
    SRGB=true
    UnpackMax[0]=1
    UnpackMax[1]=1
    UnpackMax[2]=1
    UnpackMax[3]=1
    Filter=TextureFilter.TF_Linear
    AdjustBrightness=1
    AdjustBrightnessCurve=1
    AdjustSaturation=1
    AdjustRGBCurve=1
}