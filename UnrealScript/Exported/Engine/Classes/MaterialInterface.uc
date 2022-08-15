/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialInterface extends Surface
	abstract
	forcescriptorder(true)
	native(Material);

enum EMaterialUsage
{
	MATUSAGE_SkeletalMesh,
	MATUSAGE_FracturedMeshes,
	MATUSAGE_ParticleSprites,
	MATUSAGE_BeamTrails,
	MATUSAGE_ParticleSubUV,
	MATUSAGE_SpeedTree,
	MATUSAGE_StaticLighting,
	MATUSAGE_GammaCorrection,
	MATUSAGE_LensFlare,
	MATUSAGE_InstancedMeshParticles,
	MATUSAGE_FluidSurface,
	MATUSAGE_Decals,
	MATUSAGE_MaterialEffect,
	MATUSAGE_MorphTargets,
	MATUSAGE_FogVolumes,
	MATUSAGE_RadialBlur,
	MATUSAGE_InstancedMeshes,
	MATUSAGE_SplineMesh,
	MATUSAGE_ScreenDoorFade,
	MATUSAGE_APEXMesh,
	MATUSAGE_Terrain,
	MATUSAGE_Landscape,
	MATUSAGE_MobileLandscape,
// NVCHANGE [Begin] [02/24/2011 Lin Nan, NVIDIA, SPH fluid rendering]
	MATUSAGE_SPHFluid,
	MATUSAGE_SPHFluidThickness,
// NVCHANGE [End] [02/24/2011 Lin Nan, NVIDIA, SPH fluid rendering]
};

/** A fence to track when the primitive is no longer used as a parent */
var native const transient RenderCommandFence_Mirror ParentRefFence{FRenderCommandFence};

/** 
 *	Material interface settings for Lightmass
 */
struct native LightmassMaterialInterfaceSettings
{
	/** If TRUE, forces translucency to cast static shadows as if the material were masked. */
	var(Material)	bool		bCastShadowAsMasked;
	/** Scales the emissive contribution of this material to static lighting. */
	var(Material)	float		EmissiveBoost;
	/** Scales the diffuse contribution of this material to static lighting. */
	var(Material)	float		DiffuseBoost;
	/** Scales the specular contribution of this material to static lighting. */
	var				float		SpecularBoost;
	/** 
	 * Scales the resolution that this material's attributes were exported at. 
	 * This is useful for increasing material resolution when details are needed.
	 */
	var(Material)	float		ExportResolutionScale;
	/** Scales the penumbra size of distance field shadows.  This is useful to get softer precomputed shadows on certain material types like foliage. */
	var(Material)	float		DistanceFieldPenumbraScale;
	
	/** Boolean override flags - only used in MaterialInstance* cases. */
	/** If TRUE, override the bCastShadowAsMasked setting of the parent material. */
	var bool bOverrideCastShadowAsMasked;
	/** If TRUE, override the emissive boost setting of the parent material. */
	var bool bOverrideEmissiveBoost;
	/** If TRUE, override the diffuse boost setting of the parent material. */
	var bool bOverrideDiffuseBoost;
	/** If TRUE, override the specular boost setting of the parent material. */
	var bool bOverrideSpecularBoost;
	/** If TRUE, override the export resolution scale setting of the parent material. */
	var bool bOverrideExportResolutionScale;
	/** If TRUE, override the distance field penumbra scale setting of the parent material. */
	var bool bOverrideDistanceFieldPenumbraScale;

	structdefaultproperties
	{
		bCastShadowAsMasked=false
		EmissiveBoost=1.0
		DiffuseBoost=1.0
		SpecularBoost=1.0
		ExportResolutionScale=1.0
		DistanceFieldPenumbraScale=1.0
	}
};

/** The Lightmass settings for this object. */
var(Lightmass)	protected{protected}	LightmassMaterialInterfaceSettings		LightmassSettings <ScriptOrder=true>;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** The mesh used by the material editor to preview the material.*/
var() editoronly string PreviewMesh;

/** Unique ID for this material, used for caching during distributed lighting */
var private const editoronly Guid LightingGuid;

/** Set on materials (and their instances) that have a quality switch expression */
var const bool bHasQualitySwitch;


/**
 * Mobile material properties
 */

/** When enabled, the base texture will be generated automatically by statically 'flattening' the graph network into a texture. */
var (Mobile) bool bAutoFlattenMobile;

/** When enabled, the normal texture will be generated automatically by statically 'flattening' the graph network into a texture. */
var (Mobile) bool bAutoFlattenMobileNormalTexture;

/** Color to use when flattening a material */
var (Mobile) color FlattenBackgroundColor;

/** Base (diffuse) texture, or a texture that was generated by flattening the graph network */
var(Mobile) texture MobileBaseTexture;
var deprecated duplicatetransient texture FlattenedTexture;

/** Texture coordinates from mesh vertex to use when sampling base texture on mobile platforms */
var(Mobile) EMobileTexCoordsSource MobileBaseTextureTexCoordsSource;

/** Normal map texture.  If specified, this enables per pixel lighting when used in combination with other material features. */
var(Mobile) texture MobileNormalTexture;

/** Enables baked ambient occlusion from mesh vertices and selects which vertex color channel to get the AO data from */
var(Mobile) EMobileAmbientOcclusionSource MobileAmbientOcclusionSource;

/** When enabled, primitives using this material may be fogged.  Disable this to improve performance for primitives that don't need fog. */
var(Mobile) bool bMobileAllowFog;

/** Whether to generate the flattened texture as a subUV texture */
var(Mobile, Generation) bool bGenerateSubUV;
/** The frame rate to capture the subUV images at */
var(Mobile, Generation) float SubUVFrameRate;
/** 
 *	The number of subUV images to capture along each axis of the texture.
 *	Since the generated texture is always going to be square, the same number of sub-images 
 *	will be captured on both the horizontal and vertical axes.
 */
var(Mobile, Generation) int SubUVFrameCountAlongAxes;
/** 
 *	The size of the subUV image to generate.
 *	The generated texture size will be:
 *		(SubUVFrameCountAlongAxes x SubUVFrameSize, SubUVFrameCountAlongAxes x SubUVFrameSize)
 *
 *	This value will auto-adjust according to the SubUVFrameCountAlongAxes setting so that the 
 *  proper texture size (power-of-two) results.
 */
var(Mobile, Generation) float SubUVFrameSize;

/** Enables dynamic specular lighting from the single most prominent light source */
var(Mobile, Specular) bool bUseMobileSpecular;
var deprecated bool bUseMobileVertexSpecular;

/** Enables per-pixel specular for this material (requires normal map) */
var(Mobile, Specular) bool bUseMobilePixelSpecular<EditCondition=bUseMobileSpecular>;

/** Material specular color */
var(Mobile, Specular) LinearColor MobileSpecularColor<EditCondition=bUseMobileSpecular>;

/** When specular is enabled, this sets the specular power.  Lower values yield a wider highlight, higher values yield a sharper highlight */
var(Mobile, Specular) float MobileSpecularPower<EditCondition=bUseMobileSpecular>;

/** Determines how specular values are masked.  Constant: Mask is disabled.  Luminance: Diffuse RGB luminance used as mask.  Diffuse Red/Green/Blue: Use a specific channel of the diffuse texture as the specular mask.  Mask Texture RGB: Uses the color from the mask texture */
var(Mobile, Specular) EMobileSpecularMask MobileSpecularMask;


/** Emissive texture.  If the emissive color source is set to 'Emissive Texture', setting this texture will enable emissive lighting */
var(Mobile, Emissive) texture MobileEmissiveTexture;

/** Mobile emissive color source */
var(Mobile, Emissive) EMobileEmissiveColorSource MobileEmissiveColorSource;

/** Mobile emissive color. IF MobileEmissiveColorSource is set to 'Constant' this acts as the emissive color, IF NOT it blends with the other input to form the final color.*/
var(Mobile, Emissive) LinearColor MobileEmissiveColor;

/** Selects a source for emissive light masking */
var(Mobile, Emissive) EMobileValueSource MobileEmissiveMaskSource;


/** Spherical environment map texture.  When specified, spherical environment mapping will be enabled for this material. */
var(Mobile, Environment) texture MobileEnvironmentTexture;

/** Selects a source for environment map amount */
var(Mobile, Environment) EMobileValueSource MobileEnvironmentMaskSource;

/** Sets how much the environment map texture contributes to the final color */ 
var(Mobile, Environment) float MobileEnvironmentAmount <ClampMin=0.0 | UIMax=1.0>;

/** When environment mapping is enabled, this sets how the environment color is blended with the base color. */
var(Mobile, Environment) EMobileEnvironmentBlendMode MobileEnvironmentBlendMode;

/** Environment map color scale */
var(Mobile, Environment) LinearColor MobileEnvironmentColor;

/** Environment mapping fresnel amount.  Set this to zero for best performance. */
var(Mobile, Environment) float MobileEnvironmentFresnelAmount <ClampMin=0.0 | UIMax=1.0>;

/** Environment mapping fresnel exponent.  Set this to 1.0 for best performance. */
var(Mobile, Environment) float MobileEnvironmentFresnelExponent <ClampMin=0.01 | UIMax=8.0>;


/** When set to anything other than zero, enables rim lighting for this material and sets the amount of rim lighting to apply */
var(Mobile, RimLighting) float MobileRimLightingStrength <ClampMin=0.0 | UIMax=4.0>;

/** Sets the exponent used for rim lighting */
var(Mobile, RimLighting) float MobileRimLightingExponent <ClampMin=0.01 | UIMax=8.0>;

/** Selects a source for rim light masking */
var(Mobile, RimLighting) EMobileValueSource MobileRimLightingMaskSource;

/** Rim light color */
var(Mobile, RimLighting) LinearColor MobileRimLightingColor;


/** Enables a bump offset effect for this material.  A mask texture must be supplied.  The bump offset amount is stored in the mask texture's RED channel. */
var(Mobile, BumpOffset) bool bUseMobileBumpOffset;

/** Bump offset reference plane */
var(Mobile, BumpOffset) float MobileBumpOffsetReferencePlane <EditCondition=bUseMobileBumpOffset>;

/** Bump height ratio */
var(Mobile, BumpOffset) float MobileBumpOffsetHeightRatio <EditCondition=bUseMobileBumpOffset>;


/** General purpose mask texture used for bump offset amount, texture blending, etc. */
var(Mobile, Masking) texture MobileMaskTexture;

/** Texture coordinates from mesh vertex to use when sampling mask texture */
var(Mobile, Masking) EMobileTexCoordsSource MobileMaskTextureTexCoordsSource;

/** Enables the override of base texture alpha with the red channel of the mask texture to support platforms that don't have alpha texture compression */
var(Mobile, Masking) EMobileAlphaValueSource MobileAlphaValueSource;

/** Acts as a multiplier for the final opacity value*/
var(Mobile, Masking) float MobileOpacityMultiplier  <ClampMin=0.0 | UIMax=1.0>;

/** Detail texture to use for blending the base texture (red channel or mask texture alpha based on MobileTextureBlendFactorSource)*/
var(Mobile, TextureBlending) texture MobileDetailTexture;
/** Detail texture to use for blending the base texture (green of vertex color)*/
var(Mobile, TextureBlending) texture MobileDetailTexture2;
/** Detail texture to use for blending the base texture (blue of vertex color)*/
var(Mobile, TextureBlending) texture MobileDetailTexture3;

/** Texture coordinates from mesh vertex to use when sampling detail texture */
var(Mobile, TextureBlending) EMobileTexCoordsSource MobileDetailTextureTexCoordsSource;

/** Where the blend factor comes from, for blending the base texture with the detail texture */
var(Mobile, TextureBlending) EMobileTextureBlendFactorSource MobileTextureBlendFactorSource;

/** Locks use of the detail texture and does not allow it to be forced off by system settings */
var(Mobile, TextureBlending) bool bLockColorBlending;


/** Whether to use uniform color scaling (mesh particles) or not */
var(Mobile, ColorBlending) bool bUseMobileUniformColorMultiply;

/** Default color to modulate each vertex by */
var deprecated LinearColor DefaultUniformColor;
var(Mobile, ColorBlending) LinearColor MobileDefaultUniformColor;

/** Whether to use per vertex color scaling */
var(Mobile, ColorBlending) bool bUseMobileVertexColorMultiply;

/** Whether to use detail normal for mobile */
var(Mobile, ColorBlending) bool bUseMobileDetailNormal;

/** Enables the user to specify a channel of a texture to use for the Color multiplication **/
var(Mobile, ColorBlending) EMobileColorMultiplySource MobileColorMultiplySource;

/** Which texture UVs to transform */
var(Mobile, TextureTransform) bool bBaseTextureTransformed;
var(Mobile, TextureTransform) bool bEmissiveTextureTransformed;
var(Mobile, TextureTransform) bool bNormalTextureTransformed;
var(Mobile, TextureTransform) bool bMaskTextureTransformed;
var(Mobile, TextureTransform) bool bDetailTextureTransformed;

/** Horizontal center for texture rotation/scale */
var deprecated float TransformCenterX;
var(Mobile, TextureTransform) float MobileTransformCenterX;

/** Vertical center for texture rotation/scale */
var deprecated float TransformCenterY;
var(Mobile, TextureTransform) float MobileTransformCenterY;

/** Horizontal speed for texture panning */
var deprecated float PannerSpeedX;
var(Mobile, TextureTransform) float MobilePannerSpeedX;

/** Vertical speed for texture panning */
var	deprecated float PannerSpeedY;
var(Mobile, TextureTransform) float MobilePannerSpeedY;

/** Texture rotation speed in radians per second */
var deprecated float RotateSpeed;
var(Mobile, TextureTransform) float MobileRotateSpeed;

/** Fixed horizontal texture scale (around the rotation center) */
var deprecated float FixedScaleX;
var(Mobile, TextureTransform) float MobileFixedScaleX;

/** Fixed vertical texture scale (around the rotation center) */
var deprecated float FixedScaleY;
var(Mobile, TextureTransform) float MobileFixedScaleY;

/** Horizontal texture scale applied to a sine wave */
var deprecated float SineScaleX;
var(Mobile, TextureTransform) float MobileSineScaleX;

/** Vertical texture scale applied to a sine wave */
var deprecated float SineScaleY;
var(Mobile, TextureTransform) float MobileSineScaleY;

/** Multiplier for sine wave texture scaling frequency */
var deprecated float SineScaleFrequencyMultipler;
var(Mobile, TextureTransform) float MobileSineScaleFrequencyMultipler;

/** Fixed offset for texture */
var deprecated float FixedOffsetX;
var(Mobile, TextureTransform) float MobileFixedOffsetX;

/** Fixed offset for texture */
var deprecated float FixedOffsetY;
var(Mobile, TextureTransform) float MobileFixedOffsetY;

/** Enables per-vertex movement on a wave (for use with trees and similar objects) */
var(Mobile, VertexAnimation) bool bUseMobileWaveVertexMovement;

/** Frequency adjustment for wave on vertex positions */
var(Mobile, VertexAnimation) float MobileTangentVertexFrequencyMultiplier<EditCondition=bUseMobileWaveVertexMovement>;

/** Frequency adjustment for wave on vertex positions */
var(Mobile, VertexAnimation) float MobileVerticalFrequencyMultiplier<EditCondition=bUseMobileWaveVertexMovement>;

/** Amplitude of adjustments for wave on vertex positions*/
var(Mobile, VertexAnimation) float MobileMaxVertexMovementAmplitude<EditCondition=bUseMobileWaveVertexMovement>;

/** Frequency of entire object sway */
var(Mobile, VertexAnimation) float MobileSwayFrequencyMultiplier<EditCondition=bUseMobileWaveVertexMovement>;

/** Frequency of entire object sway */
var(Mobile, VertexAnimation) float MobileSwayMaxAngle<EditCondition=bUseMobileWaveVertexMovement>;

/** The direction of the directional light for flattening the mobile material. */
var(Mobile, Flatten) vector MobileDirectionalLightDirection;
/** The brightness of the directional light for flattening the mobile material. */
var(Mobile, Flatten) float MobileDirectionalLightBrightness;
/** The color of the directional light for flattening the mobile material. */
var(Mobile, Flatten) color MobileDirectionalLightColor;
/** If TRUE, use a second directional light to simulate light bouncing when flattening the mobile material. */
var(Mobile, Flatten) bool bMobileEnableBounceLight;
/** The direction of the simulated bounce directional light for flattening the mobile material. */
var(Mobile, Flatten) vector MobileBounceLightDirection;
/** The brightness of the simulated bounce directional light for flattening the mobile material. */
var(Mobile, Flatten) float MobileBounceLightBrightness;
/** The color of the simulated bounce directional light for flattening the mobile material. */
var(Mobile, Flatten) color MobileBounceLightColor;
/** The brightness of the skylight for flattening the mobile material. */
var(Mobile, Flatten) float MobileSkyLightBrightness;
/** The color of the skylight for flattening the mobile material. */
var(Mobile, Flatten) color MobileSkyLightColor;

/** Whether to use monochrome layer Blending or regular Layer Blending */
var(Mobile, Landscape) bool bUseMobileLandscapeMonochromeLayerBlending;
/** The names of the 4 Landscape layers supported on mobile */
var(Mobile, Landscape) name MobileLandscapeLayerNames[4];
/** The RBG colors to colorize each monochome layer when using monochrome layer blending */
var(Mobile, Landscape) color MobileLandscapeMonochomeLayerColors[4];

native final noexport function Material GetMaterial();

/**
* Returns a pointer to the physical material used by this material instance.
* @return The physical material.
*/
native final noexport function PhysicalMaterial GetPhysicalMaterial() const;

// Get*ParameterValue - Gets the entry from the ParameterValues for the named parameter.
// Returns false is parameter is not found.

native function bool GetParameterDesc(name ParameterName, out String OutDesc);
native function bool GetFontParameterValue(name ParameterName,out font OutFontValue, out int OutFontPage);
native function bool GetScalarParameterValue(name ParameterName, out float OutValue);
native function bool GetScalarCurveParameterValue(name ParameterName, out InterpCurveFloat OutValue);
native function bool GetTextureParameterValue(name ParameterName, out Texture OutValue);
native function bool GetVectorParameterValue(name ParameterName, out LinearColor OutValue);
native function bool GetVectorCurveParameterValue(name ParameterName, out InterpCurveVector OutValue);
native function bool GetLinearColorParameterValue(name ParameterName, out LinearColor OutValue);
native function bool GetLinearColorCurveParameterValue(name ParameterName, out InterpCurveLinearColor OutValue);
native function bool GetGroupName(name ParameterName, out name GroupName);

native function bool GetMobileScalarParameterValue(name ParameterName, out float OutValue);
native function bool GetMobileTextureParameterValue(name ParameterName, out Texture OutValue);
native function bool GetMobileVectorParameterValue(name ParameterName, out LinearColor OutValue);

/**
 * Forces the streaming system to disregard the normal logic for the specified duration and
 * instead always load all mip-levels for all textures used by this material.
 *
 * @param OverrideForceMiplevelsToBeResident	- Whether to use (TRUE) or ignore (FALSE) the bForceMiplevelsToBeResidentValue parameter.
 * @param bForceMiplevelsToBeResidentValue		- TRUE forces all mips to stream in. FALSE lets other factors decide what to do with the mips.
 * @param ForceDuration							- Number of seconds to keep all mip-levels in memory, disregarding the normal priority logic. Negative value turns it off.
 * @param CinematicTextureGroups				- Bitfield indicating texture groups that should use extra high-resolution mips
 */
native function SetForceMipLevelsToBeResident( bool OverrideForceMiplevelsToBeResident, bool bForceMiplevelsToBeResidentValue, float ForceDuration, optional int CinematicTextureGroups = 0 );

defaultproperties
{
   LightmassSettings=(EmissiveBoost=1.000000,DiffuseBoost=1.000000,SpecularBoost=1.000000,ExportResolutionScale=1.000000,DistanceFieldPenumbraScale=1.000000)
   bMobileAllowFog=True
   FlattenBackgroundColor=(B=0,G=0,R=0,A=255)
   MobileDetailTextureTexCoordsSource=MTCS_TexCoords1
   MobileSpecularColor=(R=1.000000,G=1.000000,B=1.000000,A=1.000000)
   MobileSpecularPower=16.000000
   MobileEmissiveColor=(R=1.000000,G=1.000000,B=1.000000,A=1.000000)
   MobileEnvironmentAmount=1.000000
   MobileEnvironmentColor=(R=1.000000,G=1.000000,B=1.000000,A=1.000000)
   MobileEnvironmentFresnelExponent=1.000000
   MobileRimLightingExponent=2.000000
   MobileRimLightingColor=(R=1.000000,G=1.000000,B=1.000000,A=1.000000)
   MobileBumpOffsetReferencePlane=0.500000
   MobileBumpOffsetHeightRatio=0.050000
   MobileOpacityMultiplier=1.000000
   MobileDefaultUniformColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   MobileTransformCenterX=0.500000
   MobileTransformCenterY=0.500000
   MobileFixedScaleX=1.000000
   MobileFixedScaleY=1.000000
   MobileSineScaleFrequencyMultipler=1.000000
   MobileTangentVertexFrequencyMultiplier=0.125000
   MobileVerticalFrequencyMultiplier=0.100000
   MobileMaxVertexMovementAmplitude=5.000000
   MobileSwayFrequencyMultiplier=0.070000
   MobileSwayMaxAngle=2.000000
   MobileDirectionalLightDirection=(X=0.000000,Y=-45.000000,Z=45.000000)
   MobileDirectionalLightBrightness=2.000000
   MobileDirectionalLightColor=(B=255,G=255,R=255,A=0)
   MobileBounceLightDirection=(X=0.000000,Y=45.000000,Z=-27.500000)
   MobileBounceLightBrightness=0.250000
   MobileBounceLightColor=(B=255,G=255,R=255,A=0)
   MobileSkyLightBrightness=0.250000
   MobileSkyLightColor=(B=255,G=255,R=255,A=0)
   MobileLandscapeMonochomeLayerColors(0)=(B=255,G=255,R=255,A=0)
   MobileLandscapeMonochomeLayerColors(1)=(B=255,G=255,R=255,A=0)
   MobileLandscapeMonochomeLayerColors(2)=(B=255,G=255,R=255,A=0)
   MobileLandscapeMonochomeLayerColors(3)=(B=255,G=255,R=255,A=0)
   Name="Default__MaterialInterface"
   ObjectArchetype=Surface'Engine.Default__Surface'
}
