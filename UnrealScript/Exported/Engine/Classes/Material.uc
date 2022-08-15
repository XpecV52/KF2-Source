/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Material extends MaterialInterface
	native(Material)
	hidecategories(object);

// Material input structs.

struct MaterialInput
{
	/** Material expression that this input is connected to, or NULL if not connected. */
	var MaterialExpression	Expression;

	/** Index into Expression's outputs array that this input is connected to. */
	var int					OutputIndex;

	/** 
	 * Optional name of the input.  
	 * Note that this is the only member which is not derived from the output currently connected. 
	 */
	var string				InputName;
	var int					Mask,
							MaskR,
							MaskG,
							MaskB,
							MaskA;
	var int					GCC64_Padding; // @todo 64: if the C++ didn't mismirror this structure (with ExpressionInput), we might not need this
};

struct ColorMaterialInput extends MaterialInput
{
	var bool	UseConstant;
	var color	Constant;
};

struct ScalarMaterialInput extends MaterialInput
{
	var bool	UseConstant;
	var float	Constant;
};

struct VectorMaterialInput extends MaterialInput
{
	var bool	UseConstant;
	var vector	Constant;
};

struct Vector2MaterialInput extends MaterialInput
{
	var bool	UseConstant;
	var float	ConstantX,
				ConstantY;
};

// Physics.

/** Physical material to use for this graphics material. Used for sounds, effects etc.*/
var(PhysicalMaterial) PhysicalMaterial		PhysMaterial;

/** For backwards compatibility only. */
var class<PhysicalMaterial>	PhysicalMaterial;

/** A 1 bit monochrome texture that represents a mask for what physical material should be used if the collided texel is black or white. */
var(PhysicalMaterial)	Texture2D	PhysMaterialMask;				
/** The UV channel to use for the PhysMaterialMask. */
var(PhysicalMaterial)	INT	PhysMaterialMaskUVChannel;
/** The physical material to use when a black pixel in the PhysMaterialMask texture is hit. */
var(PhysicalMaterial)	PhysicalMaterial BlackPhysicalMaterial;
/** The physical material to use when a white pixel in the PhysMaterialMask texture is hit. */
var(PhysicalMaterial)	PhysicalMaterial WhitePhysicalMaterial;

// Reflection.

//NOTE: If any additional inputs are added/removed WxMaterialEditor::GetVisibleMaterialParameters() must be updated
var ColorMaterialInput		DiffuseColor;
var ScalarMaterialInput		DiffusePower;
var ColorMaterialInput		SpecularColor;
var ScalarMaterialInput		SpecularPower;
var VectorMaterialInput		Normal;

// Emission.

var ColorMaterialInput		EmissiveColor;

// Transmission.

var ScalarMaterialInput		Opacity;
var ScalarMaterialInput		OpacityMask;

/** If BlendMode is BLEND_Masked or BLEND_SoftMasked, the surface is not rendered where OpacityMask < OpacityMaskClipValue. */
var() float OpacityMaskClipValue;

/** Can be used to bias shadows away from the surface. */
var(Misc) float ShadowDepthBias;

/** Allows the material to distort background color by offsetting each background pixel by the amount of the distortion input for that pixel. */
var Vector2MaterialInput	Distortion;

/** Determines how the material's color is blended with background colors. */
var() EBlendMode BlendMode;

/** Determines how inputs are combined to create the material's final color. */
var() EMaterialLightingModel LightingModel;

/** 
 * Use a custom light transfer equation to be factored with light color, attenuation and shadowing. 
 * This is currently only used for Movable, Toggleable and Dominant light contribution.
 * LightVector can be used in this material input and will be set to the tangent space light direction of the current light being rendered.
 */
var ColorMaterialInput		CustomLighting;

/** 
 * Use a custom diffuse factor for attenuation with lights that only support a diffuse term. 
 * This should only be the diffuse color coefficient, and must not depend on LightVector.
 * This is currently used with skylights, SH lights, materials exported to lightmass and directional lightmap contribution.
 */
var ColorMaterialInput		CustomSkylightDiffuse;

/** Specify a vector to use as anisotropic direction */
var VectorMaterialInput		AnisotropicDirection;

/** Lerps between lighting color (diffuse * attenuation * Lambertian) and lighting without the Lambertian term color (diffuse * attenuation * TwoSidedLightingColor). */
var ScalarMaterialInput		TwoSidedLightingMask;

/** Modulates the lighting without the Lambertian term in two sided lighting. */
var ColorMaterialInput		TwoSidedLightingColor;

/** Adds to world position in the vertex shader. */
var VectorMaterialInput		WorldPositionOffset;

/** Offset in tangent space applied to tessellated vertices.  A scalar connected to this input will be treated as the z component (float3(0,0,x)). */
var VectorMaterialInput		WorldDisplacement;

/** Multiplies the tessellation factors applied when a tessellation mode is set. */
var ScalarMaterialInput		TessellationMultiplier;

/** Modulates the local contribution to the subsurface scattered lighting of the material. */
var ColorMaterialInput		SubsurfaceInscatteringColor;

/** Light from subsurface scattering is attenuated by SubsurfaceAbsorptionColor^Distance. */
var ColorMaterialInput		SubsurfaceAbsorptionColor;

/** The maximum distance light from subsurface scattering will travel. */
var ScalarMaterialInput		SubsurfaceScatteringRadius;


/** Mask for subsurface scattering.  Non-zero means the pixel should have subsurface scattering applied. */
var ScalarMaterialInput		SubsurfaceScatteringMask;


/** Indicates that the material should be rendered with subsurface scattering. */
var(D3D11) bool EnableSubsurfaceScattering <bShowOnlyWhenTrue=bShowD3D11Properties>;


/** Indicates that the material should mask out AO to prevent artifacts, e.g. from high-frequency depth noise. */
var(D3D11) bool EnableAOMask <bShowOnlyWhenTrue=bShowD3D11Properties>;


/** Indicates that the material should be rendered in the SeparateTranslucency Pass (does not affect bloom, not affected by DOF, requires bAllowSeparateTranslucency to be set in .ini). */
var(Misc) bool EnableSeparateTranslucency;

/** Indicates that the material should be rendered with antialiasing. Opacity is evaluated multiple times (for each MSAA sample). */
var(D3D11) bool bEnableMaskedAntialiasing <bShowOnlyWhenTrue=bShowD3D11Properties>;

/** Indicates that the material should be rendered without backface culling and the normal should be flipped for backfaces. */
var() bool TwoSided;

/** Indicates that the material should be rendered in its own pass. Used for hair renderering */
var(Translucency) bool TwoSidedSeparatePass;

/**
 * Allows the material to disable depth tests, which is only meaningful with translucent blend modes.
 * Disabling depth tests will make rendering significantly slower since no occluded pixels can get zculled.
 */
var(Translucency) bool bDisableDepthTest;

/** 
 * If enabled and this material reads from scene texture, this material will be rendered behind all other translucency, 
 * Instead of the default behavior for materials that read from scene texture, which is for them to render in front of all other translucency in the same DPG.
 * This is useful for placing large spheres around a level that read from scene texture to do chromatic aberration.
 */
var(Translucency) bool bSceneTextureRenderBehindTranslucency;

/** Whether the material should allow fog or be unaffected by fog.  This only has meaning for materials with translucent blend modes. */
var(Translucency) bool bAllowFog;

/** 
 * Whether the material should receive dynamic dominant light shadows from static objects when the material is being lit by a light environment. 
 * This is useful for character hair.
 */
var(Translucency) bool bTranslucencyReceiveDominantShadowsFromStatic;

/** 
 * Whether the material should inherit the dynamic shadows that dominant lights are casting on opaque and masked materials behind this material.
 * This is useful for ground meshes using a translucent blend mode and depth biased alpha to hide seams.
 */
var(Translucency) bool bTranslucencyInheritDominantShadowsFromOpaque;

/** Whether the material should allow Depth of Field or be unaffected by DoF.  This only has meaning for materials with translucent blend modes. */
var(Translucency) bool bAllowTranslucencyDoF;

/**
 * Whether the material should use one-layer distortion, which can be cheaper than normal distortion for some primitive types (mainly fluid surfaces).
 * One layer distortion won't handle overlapping one layer distortion primitives correctly.
 * This causes an extra scene color resolve for the first primitive that uses one layer distortion and so should only be used in very specific circumstances.
 */
var(Translucency) bool bUseOneLayerDistortion;

/** If this is set, a depth-only pass for will be rendered for solid (A=255) areas of dynamic lit translucency primitives. This improves hair sorting at the extra render cost. */
var(Translucency) bool bUseLitTranslucencyDepthPass;

/** If this is set, a depth-only pass for will be rendered for any visible (A>0) areas of dynamic lit translucency primitives. This is necessary for correct fog and DoF of hair */
var(Translucency) bool bUseLitTranslucencyPostRenderDepthPass;

/** Whether to treat the material's opacity channel as a mask rather than fractional translucency in dynamic shadows. */
var(Translucency) bool bCastLitTranslucencyShadowAsMasked;

var(MutuallyExclusiveUsage) const bool bUsedAsLightFunction;
/** Indicates that the material is used on fog volumes.  This usage flag is mutually exclusive with all other mesh type usage flags! */
var(MutuallyExclusiveUsage) const bool bUsedWithFogVolumes;

/** 
 * This is a special usage flag that allows a material to be assignable to any primitive type.
 * This is useful for materials used by code to implement certain viewmodes, for example the default material or lighting only material.
 * The cost is that nearly 20x more shaders will be compiled for the material than the average material, which will greatly increase shader compile time and memory usage.
 * This flag should only be set when absolutely necessary, and is purposefully not exposed to the UI to prevent abuse.
 */
var duplicatetransient const bool bUsedAsSpecialEngineMaterial;
/** 
 * Indicates that the material and its instances can be assigned to skeletal meshes.  
 * This will result in the shaders required to support skeletal meshes being compiled which will increase shader compile time and memory usage.
 */
var(Usage) const bool bUsedWithSkeletalMesh;
var(Usage) const bool bUsedWithTerrain;
var(Usage) const bool bUsedWithLandscape;
var(Usage) const bool bUsedWithMobileLandscape;
var(Usage) const bool bUsedWithFracturedMeshes;
var		   const bool bUsedWithParticleSystem;
var(Usage) const bool bUsedWithParticleSprites;
var(Usage) const bool bUsedWithBeamTrails;
var(Usage) const bool bUsedWithParticleSubUV;
var(Usage) const bool bUsedWithSpeedTree;
var(Usage) const bool bUsedWithStaticLighting;
var(Usage) const bool bUsedWithLensFlare;
/** 
 * Gamma corrects the output of the base pass using the current render target's gamma value. 
 * This must be set on materials used with UIScenes to get correct results.
 */
var(Usage) const bool bUsedWithGammaCorrection;
/** Enables instancing for mesh particles.  Use the "Vertex Color" node when enabled, not "MeshEmit VertColor." */
var(Usage) const bool bUsedWithInstancedMeshParticles;
var(Usage) const bool bUsedWithFluidSurfaces;
/** WARNING: bUsedWithDecals is mutually exclusive with all other mesh type usage flags!  A material with bUsedWithDecals=true will not work on any other mesh type. */
var(MutuallyExclusiveUsage) const bool bUsedWithDecals;
var(Usage) const bool bUsedWithMaterialEffect;
var(Usage) const bool bUsedWithMorphTargets;
var(Usage) const bool bUsedWithRadialBlur;
var(Usage) const bool bUsedWithInstancedMeshes;
var(Usage) const bool bUsedWithSplineMeshes;
var(Usage) const bool bUsedWithAPEXMeshes;
// NVCHANGE [Begin] [02/24/2011 Lin Nan, NVIDIA, SPH fluid rendering]
var(Usage) const bool bUsedWithSPHFluid;
var(Usage) const bool bUsedWithSPHFluidThickness;
// NVCHANGE [End] [02/24/2011 Lin Nan, NVIDIA, SPH fluid rendering]

/** Enables support for screen door fading for primitives rendering with this material.  This adds an extra texture lookup and a few extra instructions. */
var(Usage) const bool bUsedWithScreenDoorFade;

/** The type of tessellation to apply to this object.  Note D3D11 required for anything except MTM_NoTessellation. */
var(D3D11) const EMaterialTessellationMode D3D11TessellationMode <bShowOnlyWhenTrue=bShowD3D11Properties>;

/** Prevents cracks in the surface of the mesh when using tessellation. */
var(D3D11) const bool bEnableCrackFreeDisplacement <bShowOnlyWhenTrue=bShowD3D11Properties>;

/** 
 * Replaces analytical phong specular highlights on this material with an image based reflection,
 * Specified by the ImageReflection actors placed in the world.  Only works in D3D11.
 */
var(D3D11) bool bUseImageBasedReflections <bShowOnlyWhenTrue=bShowD3D11Properties>;


/** 
 * Whether this material supports screen space reflections. Stores a mask in the G-Buffer for 
 * the reflection pass.
 */
var(D3D11) bool bUseScreenSpaceReflections <bShowOnlyWhenTrue=bShowD3D11Properties>;


/** Values larger than 1 dampen the normal used for image reflections, values smaller than 1 exaggerate the normal used for image reflections. */
var(D3D11) float ImageReflectionNormalDampening  <bShowOnlyWhenTrue=bShowD3D11Properties>;

var(Misc) bool Wireframe;

/** When enabled, the camera vector will be computed in the pixel shader instead of the vertex shader which may improve the quality of the reflection.  Enabling this setting also allows VertexColor expressions to be used alongside Transform expressions. */
var(Misc) bool bPerPixelCameraVector;

/** Controls whether lightmap specular will be rendered or not.  Can be disabled to reduce instruction count. */
var(Misc) bool bAllowLightmapSpecular;

/** Indicates that the material will be used as a fallback on sm2 platforms */
var deprecated bool bIsFallbackMaterial;

// indexed by EMaterialShaderQuality
// Set of compiled materials at all of the MaterialShaderQuality levels
var const native duplicatetransient pointer MaterialResources[2]{FMaterialResource};

// second is used when selected
var const native duplicatetransient pointer DefaultMaterialInstances[3]{class FDefaultMaterialInstance};

var int		EditorX,
			EditorY,
			EditorPitch,
			EditorYaw;

/** Array of material expressions, excluding Comments.  Used by the material editor. */
var array<MaterialExpression>			Expressions;

/** Array of comments associated with this material; viewed in the material editor. */
var editoronly array<MaterialExpressionComment>	EditorComments;

/** Stores information about a function that this material references, used to know when the material needs to be recompiled. */
struct native MaterialFunctionInfo
{
	/** Id that the function had when this material was last compiled. */
	var guid StateId;
	
	/** The function which this material has a dependency on. */
	var MaterialFunction Function;
};

/** Array of all functions this material depends on. */
var array<MaterialFunctionInfo> MaterialFunctionInfos;

var native map{FName, TArray<UMaterialExpression*>} EditorParameters;

/** TRUE if Material uses distortion */
var private bool						bUsesDistortion;

/** TRUE if Material is masked and uses custom opacity */
var private bool						bIsMasked;

/** TRUE if Material is the preview material used in the material editor. */
var transient duplicatetransient private bool bIsPreviewMaterial;

/** Legacy texture references, now handled by FMaterial. */
var deprecated private const array<texture> ReferencedTextures;

var private const editoronly array<guid> ReferencedTextureGuids;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   PhysMaterialMaskUVChannel=-1
   DiffuseColor=(Constant=(B=128,G=128,R=128,A=0))
   DiffusePower=(Constant=1.000000)
   SpecularColor=(Constant=(B=128,G=128,R=128,A=0))
   SpecularPower=(Constant=15.000000)
   Opacity=(Constant=1.000000)
   OpacityMask=(Constant=1.000000)
   OpacityMaskClipValue=0.333300
   TwoSidedLightingColor=(Constant=(B=255,G=255,R=255,A=0))
   SubsurfaceInscatteringColor=(Constant=(B=255,G=255,R=255,A=0))
   SubsurfaceAbsorptionColor=(Constant=(B=200,G=200,R=230,A=0))
   SubsurfaceScatteringMask=(Constant=1.000000)
   bAllowFog=True
   bUseScreenSpaceReflections=True
   bAllowLightmapSpecular=True
   ImageReflectionNormalDampening=5.000000
   Name="Default__Material"
   ObjectArchetype=MaterialInterface'Engine.Default__MaterialInterface'
}
