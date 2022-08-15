/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionFluidNormal extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** Optional texture coordinates for the fluid normal.  If not specified, the mesh's UV0 will be used. */
var ExpressionInput	Coordinates;

// (cpptext)
// (cpptext)
// (cpptext)
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
   MenuCategories(0)="Texture"
   Name="Default__MaterialExpressionFluidNormal"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
