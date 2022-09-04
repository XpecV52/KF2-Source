/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This class contains a list of thumbnail rendering entries, which can be
 * configured from Editor.ini. The idea is for thumbnail rendering to be
 * extensible without having to modify Epic code.
 */
class ThumbnailManager extends Object
	native
	config(Editor);

/**
 * Types of primitives for drawing thumbnails of resources.
 */
enum EThumbnailPrimType
{
	TPT_None,
	TPT_Sphere,
	TPT_Cube,
	TPT_Plane,
	TPT_Cylinder
};

/**
* Types of backgrounds to use for rendering thumbnails
*/
enum EThumbnailBackgroundType
{
	TBT_None,
	TBT_DefaultBackground,
	TBT_SolidBackground
};

/**
 * Holds the settings for a class that needs a thumbnail renderer. Each entry
 * maps to a corresponding class and holds the information needed
 * to render the thumbnail, including which object to render via and its
 * border color.
 */
struct native ThumbnailRenderingInfo
{
	/**
	 * The name of the class that this thumbnail is for (so we can lazy bind)
	 */
	var String ClassNeedingThumbnailName;
	/**
	 * This is the class that this entry is for, i.e. the class that
	 * will be rendered in the thumbnail views
	 */
	var Class ClassNeedingThumbnail;
	/**
	 * The name of the class to load when rendering this thumbnail
	 * NOTE: This is a string to avoid any dependencies of compilation
	 */
	var String RendererClassName;
	/**
	 * The instance of the renderer class
	 */
	var ThumbnailRenderer Renderer;
	/**
	 * The name of the class to load when rendering labels for this thumbnail
	 * NOTE: This is a string to avoid any dependencies of compilation
	 */
	var String LabelRendererClassName;
	/**
	 * The instance of the label renderer class
	 */
	var ThumbnailLabelRenderer LabelRenderer;
	/**
	 * This is the border color to use for this type
	 */
	var Color BorderColor;
	/**
	 * Icon for objects that don't have specialized drawing needs but still
	 * want to be able to see a thumbnail
	 */
	var String IconName;
};

/**
 * The array of thumbnail rendering information entries. Each type that supports
 * thumbnail rendering has an entry in here.
 */
var const config array<ThumbnailRenderingInfo> RenderableThumbnailTypes;

/**
 * The array of thumbnail rendering information entries which support archetypes. Each type that supports
 * archetype thumbnail rendering must have an entry in the .ini file.
 */
var const config array<ThumbnailRenderingInfo> ArchetypeRenderableThumbnailTypes;

/**
 * Determines whether the initialization function is needed or not
 */
var const bool bIsInitialized;

// The following members are present for performance optimizations

/**
 * Whether to update the map or not (GC usually causes this)
 */
var const bool bMapNeedsUpdate;

/**
 * This holds a map of object type to render info entries
 */
var private{private} native transient const pointer RenderInfoMap;

/**
 * This holds a map of object type to render info entries for archetypes
 */
var private{private} native transient const pointer ArchetypeRenderInfoMap{TMap<UClass *,FThumbnailRenderingInfo *>};

/**
 * The render info to share across all object types when the object doesn't
 * support rendering of thumbnails
 */
var const ThumbnailRenderingInfo NotSupported;

/**
 * Cached background component instead of creating and destroying them for each
 * thumbnail that is rendered
 */
var const StaticMeshComponent BackgroundComponent;

/**
 * Cached static mesh component instead of creating and destroying them for
 * each thumbnail that is rendered
 */
var const StaticMeshComponent SMPreviewComponent;

/**
 * Cached skeletal mesh component instead of creating and destroying them for
 * each thumbnail that is rendered
 */
var const SkeletalMeshComponent SKPreviewComponent;

/**
 *	When TRUE, ParticleSystem thumbnails will render a real-time preview
 */
var bool bPSysRealTime;

// All these meshes/materials/textures are preloaded via default properties

var const StaticMesh TexPropCube;
var const StaticMesh TexPropSphere;
var const StaticMesh TexPropCylinder;
var const StaticMesh TexPropPlane;
var const Material ThumbnailBackground;
var const Material ThumbnailBackgroundSolid;
var const MaterialInstanceConstant ThumbnailBackgroundSolidMatInst;
var const array<MaterialInterface> MeshMaterialArray;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	typedef TMap<UClass*,FThumbnailRenderingInfo*> FClassToRenderInfoMap;

protected:
	/**
	 * Returns the pointer to the map as a reference. Creates it if one isn't
	 * already instanced.
	 */
	inline FClassToRenderInfoMap& GetRenderInfoMap(void)
	{
		if (RenderInfoMap == NULL)
		{
			RenderInfoMap = (void*)new FClassToRenderInfoMap();
		}
		return *(FClassToRenderInfoMap*)RenderInfoMap;
	}

	inline FClassToRenderInfoMap& GetArchetypeRenderInfoMap(void)
	{
		if ( ArchetypeRenderInfoMap == NULL )
		{
			ArchetypeRenderInfoMap = new FClassToRenderInfoMap();
		}
		return *ArchetypeRenderInfoMap;
	}

public:
	/**
	 * Returns the component to use for rendering a background. Creates one
	 * if needed.
	 */
	inline UStaticMeshComponent* GetBackgroundComponent(void)
	{
		if (BackgroundComponent == NULL)
		{
			BackgroundComponent = ConstructObject<UStaticMeshComponent>(UStaticMeshComponent::StaticClass());;
		}
		return BackgroundComponent;
	}

	/**
	 * Returns the component to use for rendering a static mesh. Creates one
	 * if needed.
	 */
	inline UStaticMeshComponent* GetStaticMeshPreviewComponent(void)
	{
		if (SMPreviewComponent == NULL)
		{
			SMPreviewComponent = ConstructObject<UStaticMeshComponent>(UStaticMeshComponent::StaticClass());;
		}
		// Reset the static-mesh's CastShadow flag to its default value.
		SMPreviewComponent->CastShadow = TRUE;
		SMPreviewComponent->DepthPriorityGroup = SDPG_UnrealEdBackground;
		return SMPreviewComponent;
	}

	/**
	 * Returns the component to use for rendering a skeletal mesh. Creates one
	 * if needed.
	 */
	inline USkeletalMeshComponent* GetSkeletalMeshPreviewComponent(void)
	{
		if (SKPreviewComponent == NULL)
		{
			SKPreviewComponent = ConstructObject<USkeletalMeshComponent>(USkeletalMeshComponent::StaticClass());;
		}
		return SKPreviewComponent;
	}

	/**
	 * Sets Material Array for meshes
	 */
	void SetMeshPreviewMaterial (TArray<UMaterialInterface*>& InMaterialArray)
	{
		MeshMaterialArray = InMaterialArray;
	}

	/**
	 * Gets Material Array for meshes
	 */
	TArrayNoInit <UMaterialInterface*>& GetStaticMeshMaterialArray(void)
	{
		return MeshMaterialArray;
	}

	/**
	 * Clears Material Array for meshes.  Should be called directly after 
	 */
	void ClearStaticMeshmaterialArray (void)
	{
		MeshMaterialArray.Empty();
	}

	/**
	 * Clears cached components.
	 */
	void ClearComponents(void);

	/**
	 * Cleans up any allocations that won't be GCed (UObject interface)
	 */
	void FinishDestroy(void);

	/**
	 * Serializes any object renferences and sets the map needs update flag
	 *
	 * @param Ar the archive to serialize to/from
	 */
	void Serialize(FArchive& Ar);

	/**
	 * Fixes up any classes that need to be loaded in the thumbnail types
	 */
	void Initialize(void);

	/**
	 * Returns the entry for the specified object
	 *
	 * @param Object the object to find thumbnail rendering info for
	 *
	 * @return A pointer to the rendering info if valid, otherwise NULL
	 */
	FThumbnailRenderingInfo* GetRenderingInfo(UObject* Object);

protected:
	/**
	 * Fixes up any classes that need to be loaded in the thumbnail types per-map type
	 */
	void InitializeRenderTypeArray( TArray<struct FThumbnailRenderingInfo>& ThumbnailRendererTypes, FClassToRenderInfoMap& ThumbnailMap );

}


defaultproperties
{
   RenderableThumbnailTypes(0)=(ClassNeedingThumbnailName="Engine.Prefab",RendererClassName="UnrealEd.PrefabThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_Prefab")
   RenderableThumbnailTypes(1)=(ClassNeedingThumbnailName="Engine.PhysicsAsset",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.PhysicsAssetLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_PhysAsset")
   RenderableThumbnailTypes(2)=(ClassNeedingThumbnailName="Engine.PhysicalMaterial",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=0,R=0,A=255),IconName="EngineMaterials.UnrealEdIcon_PhysMat")
   RenderableThumbnailTypes(3)=(ClassNeedingThumbnailName="Engine.AkBank",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=175,R=0,A=255),IconName="AkResources.AkBank")
   RenderableThumbnailTypes(4)=(ClassNeedingThumbnailName="Engine.AkEvent",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=175,R=0,A=255),IconName="AkResources.AkEvent")
   RenderableThumbnailTypes(5)=(ClassNeedingThumbnailName="Engine.AnimTree",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.AnimTreeLabelRenderer",BorderColor=(B=192,G=128,R=255,A=255),IconName="EngineMaterials.UnrealEdIcon_AnimTree")
   RenderableThumbnailTypes(6)=(ClassNeedingThumbnailName="Engine.SoundNodeWave",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.SoundLabelRenderer",BorderColor=(B=255,G=0,R=0,A=255),IconName="EditorResources.UnrealEdIcon_Sound")
   RenderableThumbnailTypes(7)=(ClassNeedingThumbnailName="Engine.SoundCue",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.SoundLabelRenderer",BorderColor=(B=255,G=175,R=0,A=255),IconName="EditorResources.UnrealEdIcon_SoundCue")
   RenderableThumbnailTypes(8)=(ClassNeedingThumbnailName="Engine.SoundClass",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=175,R=0,A=255),IconName="EditorResources.UnrealEdIcon_SoundCue")
   RenderableThumbnailTypes(9)=(ClassNeedingThumbnailName="Engine.SoundMode",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=0,R=175,A=255),IconName="EditorResources.UnrealEdIcon_SoundCue")
   RenderableThumbnailTypes(10)=(ClassNeedingThumbnailName="Engine.SpeechRecognition",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=0,R=0,A=255),IconName="EditorResources.UnrealEdIcon_SoundCue")
   RenderableThumbnailTypes(11)=(ClassNeedingThumbnailName="Engine.Font",RendererClassName="UnrealEd.FontThumbnailRenderer",LabelRendererClassName="UnrealEd.FontThumbnailLabelRenderer",BorderColor=(B=255,G=0,R=0,A=255),IconName="EditorResources.UnrealEdIcon_Font")
   RenderableThumbnailTypes(12)=(ClassNeedingThumbnailName="Engine.Sequence",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=255,R=255,A=255),IconName="EngineMaterials.UnrealEdIcon_Sequence")
   RenderableThumbnailTypes(13)=(ClassNeedingThumbnailName="Engine.AnimSet",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=128,R=192,A=255),IconName="EngineMaterials.UnrealEdIcon_AnimSet")
   RenderableThumbnailTypes(14)=(ClassNeedingThumbnailName="Engine.TerrainMaterial",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=192,G=255,R=192,A=255),IconName="EditorResources.UnrealEdIcon_TerrainMaterial")
   RenderableThumbnailTypes(15)=(ClassNeedingThumbnailName="Engine.TerrainLayerSetup",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=192,R=128,A=255),IconName="EditorResources.UnrealEdIcon_TerrainLayerSetup")
   RenderableThumbnailTypes(16)=(ClassNeedingThumbnailName="Engine.Texture2D",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(17)=(ClassNeedingThumbnailName="Engine.ShadowMap2D",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(18)=(ClassNeedingThumbnailName="Engine.ShadowMapTexture2D",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(19)=(ClassNeedingThumbnailName="Engine.TextureRenderTarget",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(20)=(ClassNeedingThumbnailName="Engine.TextureRenderTargetCube",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(21)=(ClassNeedingThumbnailName="Engine.TextureFlipBook",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(22)=(ClassNeedingThumbnailName="Engine.TextureMovie",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(23)=(ClassNeedingThumbnailName="Engine.LightMapTexture2D",RendererClassName="UnrealEd.TextureThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(24)=(ClassNeedingThumbnailName="Engine.TextureCube",RendererClassName="UnrealEd.TextureCubeThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=0,R=255,A=255))
   RenderableThumbnailTypes(25)=(ClassNeedingThumbnailName="Engine.Material",RendererClassName="UnrealEd.MaterialInstanceThumbnailRenderer",LabelRendererClassName="UnrealEd.MaterialInstanceLabelRenderer",BorderColor=(B=0,G=255,R=0,A=255))
   RenderableThumbnailTypes(26)=(ClassNeedingThumbnailName="Engine.MaterialFunction",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.MaterialFunctionLabelRenderer",BorderColor=(B=175,G=175,R=0,A=255))
   RenderableThumbnailTypes(27)=(ClassNeedingThumbnailName="Engine.MaterialInterface",RendererClassName="UnrealEd.MaterialInstanceThumbnailRenderer",LabelRendererClassName="UnrealEd.MaterialInstanceLabelRenderer",BorderColor=(B=255,G=50,R=50,A=255))
   RenderableThumbnailTypes(28)=(ClassNeedingThumbnailName="Engine.ParticleSystem",RendererClassName="UnrealEd.ParticleSystemThumbnailRenderer",LabelRendererClassName="UnrealEd.ParticleSystemLabelRenderer",BorderColor=(B=0,G=255,R=255,A=255))
   RenderableThumbnailTypes(29)=(ClassNeedingThumbnailName="Engine.FracturedStaticMesh",RendererClassName="UnrealEd.StaticMeshThumbnailRenderer",LabelRendererClassName="UnrealEd.FracturedStaticMeshLabelRenderer",BorderColor=(B=255,G=200,R=96,A=255))
   RenderableThumbnailTypes(30)=(ClassNeedingThumbnailName="Engine.StaticMesh",RendererClassName="UnrealEd.StaticMeshThumbnailRenderer",LabelRendererClassName="UnrealEd.StaticMeshLabelRenderer",BorderColor=(B=255,G=255,R=0,A=255))
   RenderableThumbnailTypes(31)=(ClassNeedingThumbnailName="Engine.SkeletalMesh",RendererClassName="UnrealEd.SkeletalMeshThumbnailRenderer",LabelRendererClassName="UnrealEd.SkeletalMeshLabelRenderer",BorderColor=(B=255,G=0,R=255,A=255))
   RenderableThumbnailTypes(32)=(ClassNeedingThumbnailName="Engine.MorphTargetSet",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=128,R=192,A=255),IconName="EngineMaterials.UnrealEdIcon_MorphTargetSet")
   RenderableThumbnailTypes(33)=(ClassNeedingThumbnailName="Engine.MorphWeightSequence",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=192,R=128,A=255),IconName="EngineMaterials.UnrealEdIcon_MorphWeightSequence")
   RenderableThumbnailTypes(34)=(ClassNeedingThumbnailName="Engine.PostProcessChain",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.PostProcessLabelRenderer",BorderColor=(B=255,G=128,R=192,A=255),IconName="EngineMaterials.UnrealEdIcon_PostProcessChain")
   RenderableThumbnailTypes(35)=(ClassNeedingThumbnailName="Engine.CurveEdPresetCurve",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=200,G=170,R=30,A=255),IconName="EngineMaterials.UnrealEdIcon_CurveEdPresetCurve")
   RenderableThumbnailTypes(36)=(ClassNeedingThumbnailName="Engine.FaceFXAsset",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=0,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_FaceFXAsset")
   RenderableThumbnailTypes(37)=(ClassNeedingThumbnailName="Engine.FaceFXAnimSet",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=128,R=128,A=255),IconName="EditorResources.UnrealEdIcon_FaceFXAsset")
   RenderableThumbnailTypes(38)=(ClassNeedingThumbnailName="Engine.CameraAnim",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=150,G=125,R=15,A=255),IconName="EditorResources.UnrealEdIcon_Archetype")
   RenderableThumbnailTypes(39)=(ClassNeedingThumbnailName="Engine.SpeedTree",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=64,G=255,R=64,A=255),IconName="EditorResources.SpeedTreeLogoBig")
   RenderableThumbnailTypes(40)=(ClassNeedingThumbnailName="Engine.LensFlare",RendererClassName="UnrealEd.LensFlareThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=64,G=200,R=255,A=255))
   RenderableThumbnailTypes(41)=(ClassNeedingThumbnailName="Engine.PhysXParticleSystem",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_PhysXParticleSystem")
   RenderableThumbnailTypes(42)=(ClassNeedingThumbnailName="Engine.FlexContainer",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_FlexContainer")
   RenderableThumbnailTypes(43)=(ClassNeedingThumbnailName="Engine.FractureMaterial",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255))
   RenderableThumbnailTypes(44)=(ClassNeedingThumbnailName="Engine.ProcBuildingRuleset",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=0,R=0,A=255),IconName="EditorResources.UnrealEdIcon_ProcBuildRules")
   RenderableThumbnailTypes(45)=(ClassNeedingThumbnailName="GFxUI.SwfMovie",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=200,G=120,R=200,A=255))
   RenderableThumbnailTypes(46)=(ClassNeedingThumbnailName="Engine.ApexDestructibleAsset",RendererClassName="UnrealEd.ApexDestructibleAssetThumbnailRenderer",LabelRendererClassName="UnrealEd.ApexDestructibleAssetLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_ApexDestructibleAsset")
   RenderableThumbnailTypes(47)=(ClassNeedingThumbnailName="Engine.ApexClothingAsset",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.ApexClothingAssetLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_ApexClothingAsset")
   RenderableThumbnailTypes(48)=(ClassNeedingThumbnailName="Engine.ApexGenericAsset",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.ApexGenericAssetLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_ApexGenericAsset")
   RenderableThumbnailTypes(49)=(ClassNeedingThumbnailName="Engine.LandscapeLayerInfoObject",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.LandscapeLayerLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255))
   RenderableThumbnailTypes(50)=(ClassNeedingThumbnailName="SubstanceAir.SubstanceAirImageInput",RendererClassName="SubstanceAirEd.ImageInputThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=255,G=175,R=0,A=255))
   RenderableThumbnailTypes(51)=(ClassNeedingThumbnailName="BaseAI.BTTemplate",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=128,R=128,A=255),IconName="BT_AI_EditorResources.Icon.BTTemplate")
   RenderableThumbnailTypes(52)=(ClassNeedingThumbnailName="BaseAI.ETQTemplate",RendererClassName="UnrealEd.IconThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=128,R=128,A=255),IconName="BT_AI_EditorResources.Icon.ETQTemplate")
   ArchetypeRenderableThumbnailTypes(0)=(ClassNeedingThumbnailName="Core.Object",RendererClassName="UnrealEd.ArchetypeThumbnailRenderer",LabelRendererClassName="UnrealEd.GenericThumbnailLabelRenderer",BorderColor=(B=128,G=192,R=255,A=255),IconName="EditorResources.UnrealEdIcon_Archetype")
   bMapNeedsUpdate=True
   bPSysRealTime=True
   TexPropCube=StaticMesh'EditorMeshes.TexPropCube'
   TexPropSphere=StaticMesh'EditorMeshes.TexPropSphere'
   TexPropCylinder=StaticMesh'EditorMeshes.TexPropCylinder'
   TexPropPlane=StaticMesh'EditorMeshes.TexPropPlane'
   ThumbnailBackground=Material'EditorMaterials.ThumbnailBack'
   ThumbnailBackgroundSolid=Material'EditorMaterials.ThumbnailSolid'
   ThumbnailBackgroundSolidMatInst=MaterialInstanceConstant'EditorMaterials.ThumbnailSolid_MATInst'
   Name="Default__ThumbnailManager"
   ObjectArchetype=Object'Core.Default__Object'
}
