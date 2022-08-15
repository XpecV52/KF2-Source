/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionSceneDepth extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionSceneDepth: 
 * samples the current scene texture depth target
 * for use in a material
 */

/** texture coordinate inputt expression for this node */
var ExpressionInput	Coordinates;

/** normalize the depth values to [near,far] -> [0,1] */
var() bool bNormalize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Depth"
   Outputs(0)=(Mask=1,MaskR=1)
   Name="Default__MaterialExpressionSceneDepth"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
