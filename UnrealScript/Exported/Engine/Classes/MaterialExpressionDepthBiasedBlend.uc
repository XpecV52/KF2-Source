/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDepthBiasedBlend extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionDepthBiasBlend: 
 * Blends the pixel with the destination pixel based on the following formula:
 *	Color = (SrcZ < (DstZ - ((1 - Bias) * BiasScale))) ? SrcColor :
 *			(DstZ < SrcZ) ? DstColor :
 *			Lerp(DstColor, SrcColor, (DstZ - SrcZ) / ((1 - Bias) * BiasScale))
 * for use in a material
 */

/** normalize the depth values to [near,far] -> [0,1]	*/
var()	bool		bNormalize;

/** 
 *	The bias scale value
 */
var()	float		BiasScale;

/** 
 *	The source color input
 */
var ExpressionInput	RGB;

/** 
 *	The source alpha input
 *	NOT REQUIRED
 */
var ExpressionInput	Alpha;

/** 
 *	The depth bias input
 *	This can be a constant, texture sample, etc.
 *
 *	NOTE: No bias expression indicates a bias of 1.0f.
 */
var ExpressionInput	Bias;

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
   BiasScale=1.000000
   MenuCategories(0)="Obsolete"
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionDepthBiasedBlend"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
