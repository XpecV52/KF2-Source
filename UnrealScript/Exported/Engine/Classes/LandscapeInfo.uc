/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class LandscapeInfo extends Object
	native(Terrain);

/** Landscape datas */
var const Guid LandscapeGuid;

var const native map{FName, struct FLandscapeLayerStruct*} LayerInfoMap;

var const native pointer DataInterface{struct FLandscapeDataInterface};

/** Map of the SectionBaseX/Y component offets (in heightmap space) to the component. Valid in editor only. */
var const native map{QWORD,class ULandscapeComponent*} XYtoComponentMap;

/** Map of the SectionBaseX/Y component offets (in heightmap space) to the collison components. Valid in editor only. */
var const native map{QWORD,class ULandscapeHeightfieldCollisionComponent*} XYtoCollisionComponentMap;

var const LandscapeProxy LandscapeProxy;

/** Structure storing Collision for LandscapeComponent Add */
struct native LandscapeAddCollision
{
	var editoronly vector Corners[4];
	structcpptext
	{
		FLandscapeAddCollision()
		{
#if WITH_EDITORONLY_DATA
			Corners[0] = Corners[1] = Corners[2] = Corners[3] = FVector(0.f, 0.f, 0.f);
#endif // WITH_EDITORONLY_DATA
		}
	}
};

/** Map of the SectionBaseX/Y component offets to the newly added collison components. Only available near valid LandscapeComponents. Valid in editor only. */
var const native map{QWORD,struct FLandscapeAddCollision} XYtoAddCollisionMap;

var const private native transient Set_Mirror Proxies{TSet<class ALandscapeProxy*>};

var const private native Set_Mirror SelectedComponents{TSet<class ULandscapeComponent*>};
var const private native Set_Mirror SelectedCollisionComponents{TSet<class ULandscapeHeightfieldCollisionComponent*>};
var const private native Set_Mirror SelectedRegionComponents{TSet<class ULandscapeComponent*>};

var const private native map{QWORD,FLOAT} SelectedRegion;

var editoronly string HeightmapFilePath;

var editoronly transient bool bIsValid;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   Name="Default__LandscapeInfo"
   ObjectArchetype=Object'Core.Default__Object'
}
