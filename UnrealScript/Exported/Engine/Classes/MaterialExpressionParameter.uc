/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionParameter extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** The name of the parameter */
var() name			ParameterName;

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

defaultproperties
{
   bIsParameterExpression=True
   MenuCategories(0)="Parameters"
   Name="Default__MaterialExpressionParameter"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
