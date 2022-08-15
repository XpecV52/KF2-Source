/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTerrainLayerSwitch extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

//the override that will be set when this expression is being compiled from a static permutation
var const native transient pointer InstanceOverride{const FStaticTerrainLayerWeightParameter};

var ExpressionInput	LayerUsed;
var ExpressionInput	LayerNotUsed;

var() Name ParameterName;
var() bool PreviewUsed;

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
// (cpptext)
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
   PreviewUsed=True
   bIsParameterExpression=True
   bUsedByStaticParameterSet=True
   MenuCategories(0)="Terrain"
   MenuCategories(1)="WorldPosOffset"
   Name="Default__MaterialExpressionTerrainLayerSwitch"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
