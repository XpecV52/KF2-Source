/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionPixelDepth extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionPixelDepth: 
 * Gives the depth of the current pixel being drawn
 * for use in a material
 */

/** normalize the depth values to [near,far] -> [0,1] */
var() bool bNormalize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Depth"
   Outputs(0)=(Mask=1,MaskR=1)
   Name="Default__MaterialExpressionPixelDepth"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
