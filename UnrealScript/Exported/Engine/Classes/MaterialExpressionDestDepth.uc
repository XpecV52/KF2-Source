/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDestDepth extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionDestDepth: 
 * Gives the depth value at the current screen position destination
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
   MenuCategories(0)="Destination"
   MenuCategories(1)="Depth"
   Outputs(0)=(Mask=1,MaskR=1)
   Name="Default__MaterialExpressionDestDepth"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
