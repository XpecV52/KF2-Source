/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class Landscape extends LandscapeProxy
	dependson(LightComponent)
	native(Terrain)
	hidecategories(LandscapeProxy)
	showcategories(Display, Movement, Collision, Lighting, LOD);

enum ELandscapeSetupErrors
{
	LSE_None,
	LSE_NoLandscapeInfo, // No Landscape Info available
	LSE_CollsionXY, // There was already component with same X,Y
	LSE_NoLayerInfo // No Layer Info, need to add proper layers
};

/** Layers that can be painted on the landscape */
var deprecated array<Name> LayerNames;

/** Structure storing Layer Data */
struct native LandscapeLayerInfo
{
	var() Name LayerName;
	// Used to erosion caculation?
	var() float Hardness;
	var editoronly bool bNoWeightBlend;
	var() PhysicalMaterial PhysMaterial;
	var editoronly MaterialInstanceConstant ThumbnailMIC;
	var editoronly transient bool bSelected;
	var editoronly transient int DebugColorChannel;
	var editoronly transient string LayerSourceFile;

	structcpptext
	{
		// tor
		FLandscapeLayerInfo(FName InName, FLOAT InHardness=0.5f, UBOOL InNoWeightBlend=FALSE, const TCHAR* SourceFile=NULL)
		:	LayerName(InName)
		,	Hardness(InHardness)
		,	bNoWeightBlend(InNoWeightBlend)
		,	PhysMaterial(NULL)
#if WITH_EDITORONLY_DATA
		,	ThumbnailMIC(NULL)
		,	bSelected(FALSE)
		,	DebugColorChannel(0)
		,	LayerSourceFile(E_ForceInit)
#endif // WITH_EDITORONLY_DATA
		{
#if WITH_EDITORONLY_DATA
			LayerSourceFile = SourceFile;
#endif // WITH_EDITORONLY_DATA
		}

		// for TArray::FindItemIndexByKey
		UBOOL operator==( const FLandscapeLayerInfo& Other ) const
		{
			return LayerName == Other.LayerName;
		}
	}
};

var deprecated array<LandscapeLayerInfo> LayerInfos;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   SplatterMapResolution=1.000000
   bIsProxy=False
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__LandscapeProxy:Sprite'
      Sprite=Texture2D'EditorResources.S_Terrain'
      SpriteCategoryName="Landscape"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__LandscapeProxy:Sprite'
   End Object
   Components(0)=Sprite
   bLockLocation=False
   Name="Default__Landscape"
   ObjectArchetype=LandscapeProxy'Engine.Default__LandscapeProxy'
}
