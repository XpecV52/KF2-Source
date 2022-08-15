/*******************************************************************************
 * ThumbnailManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ThumbnailManager extends Object
    native
    config(Editor);

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

enum EThumbnailPrimType
{
    TPT_None,
    TPT_Sphere,
    TPT_Cube,
    TPT_Plane,
    TPT_Cylinder,
    TPT_MAX
};

enum EThumbnailBackgroundType
{
    TBT_None,
    TBT_DefaultBackground,
    TBT_SolidBackground,
    TBT_MAX
};

struct native ThumbnailRenderingInfo
{
    var string ClassNeedingThumbnailName;
    var Class ClassNeedingThumbnail;
    var string RendererClassName;
    var ThumbnailRenderer Renderer;
    var string LabelRendererClassName;
    var ThumbnailLabelRenderer LabelRenderer;
    var Color BorderColor;
    var string IconName;

    structdefaultproperties
    {
        ClassNeedingThumbnailName=""
        ClassNeedingThumbnail=none
        RendererClassName=""
        Renderer=none
        LabelRendererClassName=""
        LabelRenderer=none
        BorderColor=(B=0,G=0,R=0,A=0)
        IconName=""
    }
};

var const config array<config ThumbnailRenderingInfo> RenderableThumbnailTypes;
var const config array<config ThumbnailRenderingInfo> ArchetypeRenderableThumbnailTypes;
var const bool bIsInitialized;
var const bool bMapNeedsUpdate;
var bool bPSysRealTime;
var private native const transient Pointer RenderInfoMap;
var private native const transient Pointer ArchetypeRenderInfoMap;
var const ThumbnailRenderingInfo NotSupported;
var const export editinline StaticMeshComponent BackgroundComponent;
var const export editinline StaticMeshComponent SMPreviewComponent;
var const export editinline SkeletalMeshComponent SKPreviewComponent;
var const StaticMesh TexPropCube;
var const StaticMesh TexPropSphere;
var const StaticMesh TexPropCylinder;
var const StaticMesh TexPropPlane;
var const Material ThumbnailBackground;
var const Material ThumbnailBackgroundSolid;
var const MaterialInstanceConstant ThumbnailBackgroundSolidMatInst;
var const array<MaterialInterface> MeshMaterialArray;

defaultproperties
{
    bMapNeedsUpdate=true
    bPSysRealTime=true
    TexPropCube=StaticMesh'EditorMeshes.TexPropCube'
    TexPropSphere=StaticMesh'EditorMeshes.TexPropSphere'
    TexPropCylinder=StaticMesh'EditorMeshes.TexPropCylinder'
    TexPropPlane=StaticMesh'EditorMeshes.TexPropPlane'
    ThumbnailBackground=Material'EditorMaterials.ThumbnailBack'
    ThumbnailBackgroundSolid=Material'EditorMaterials.ThumbnailSolid'
    ThumbnailBackgroundSolidMatInst=MaterialInstanceConstant'EditorMaterials.ThumbnailSolid_MATInst'
}