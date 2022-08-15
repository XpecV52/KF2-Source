/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class LandscapeGizmoActiveActor extends LandscapeGizmoActor
	notplaceable
	native(Terrain);

enum ELandscapeGizmoType
{
	LGT_None,
	LGT_Height,
	LGT_Weight
};

struct native GizmoSelectData
{
	var editoronly float Ratio;
	var editoronly float HeightData;
	var editoronly native map{FName, FLOAT} WeightDataMap;

	structcpptext
	{
		FGizmoSelectData()
			#if WITH_EDITORONLY_DATA
			: Ratio(0.f), HeightData(0.f)
			#endif
		{
		}
	}
};

var transient editoronly ELandscapeGizmoType DataType;
var const private native map{QWORD, FGizmoSelectData} SelectedData;

var editoronly Texture2D GizmoTexture;
var editoronly Vector2D TextureScale;
var editoronly array<Vector> SampledHeight;
var editoronly array<Vector> SampledNormal;
var editoronly int SampleSizeX;
var editoronly int SampleSizeY;
var editoronly float CachedWidth;
var editoronly float CachedHeight;
var editoronly float CachedScaleXY;
var editoronly transient vector FrustumVerts[8];

var editoronly Material GizmoMaterial;
var editoronly MaterialInstance GizmoDataMaterial;
var editoronly Material GizmoMeshMaterial;
var editoronly Material GizmoMeshMaterial2;

var() editoronly editconst array<Name> LayerNames; // only for showing LayerNames currently contained...

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   GizmoMaterial=Material'EditorLandscapeResources.LandscapeGizmo_Mat'
   GizmoDataMaterial=MaterialInstanceConstant'EditorLandscapeResources.LandscapeGizmo_Mat_Copied'
   GizmoMeshMaterial=Material'EditorLandscapeResources.LandscapeGizmoHeight_Mat'
   GizmoMeshMaterial2=Material'EditorLandscapeResources.LandscapeGizmoHeight_UnderMat'
   Begin Object Class=LandscapeGizmoRenderComponent Name=GizmoRenderer
      ReplacementPrimitive=None
      Name="GizmoRenderer"
      ObjectArchetype=LandscapeGizmoRenderComponent'Engine.Default__LandscapeGizmoRenderComponent'
   End Object
   Components(0)=GizmoRenderer
   bEditable=True
   Name="Default__LandscapeGizmoActiveActor"
   ObjectArchetype=LandscapeGizmoActor'Engine.Default__LandscapeGizmoActor'
}
