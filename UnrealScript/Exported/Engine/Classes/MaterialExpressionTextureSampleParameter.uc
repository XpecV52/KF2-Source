/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTextureSampleParameter extends MaterialExpressionTextureSample
	native(Material)
	collapsecategories
	abstract
	hidecategories(Object);

var()	name		ParameterName;

/** GUID that should be unique within the material, this is used for parameter renaming. */
var	  const	guid	ExpressionGUID;

/** The name of the parameter Group to display in MaterialInstance Editor. Default is None group */
var() name Group;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
   MenuCategories(0)="Obsolete"
   Name="Default__MaterialExpressionTextureSampleParameter"
   ObjectArchetype=MaterialExpressionTextureSample'Engine.Default__MaterialExpressionTextureSample'
}
