/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionLandscapeLayerBlend extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

enum ELandscapeLayerBlendType
{
	LB_AlphaBlend,
	LB_HeightBlend,
};

struct native LayerBlendInput
{
	var() name LayerName;
	var() ELandscapeLayerBlendType BlendType;
	var edithide ExpressionInput LayerInput;
	var edithide ExpressionInput HeightInput;
	var() float PreviewWeight;
	//the override that will be set when this expression is being compiled from a static permutation
	var const native transient pointer InstanceOverride{const FStaticTerrainLayerWeightParameter};
};

var() array<LayerBlendInput> Layers;

/** GUID that should be unique within the material, this is used for parameter renaming. */
var	  const	guid	ExpressionGUID;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   bIsParameterExpression=True
   bUsedByStaticParameterSet=True
   MenuCategories(0)="Terrain"
   MenuCategories(1)="WorldPosOffset"
   Name="Default__MaterialExpressionLandscapeLayerBlend"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
