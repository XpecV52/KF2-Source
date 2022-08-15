/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTextureSampleParameterNormal extends MaterialExpressionTextureSampleParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

//the override that will be set when this expression is being compiled from a static permutation
var const native transient pointer InstanceOverride{const FNormalParameter};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   Texture=Texture2D'EngineMaterials.DefaultNormal'
   bUsedByStaticParameterSet=True
   MenuCategories(0)="Texture"
   MenuCategories(1)="Parameters"
   Name="Default__MaterialExpressionTextureSampleParameterNormal"
   ObjectArchetype=MaterialExpressionTextureSampleParameter'Engine.Default__MaterialExpressionTextureSampleParameter'
}
