/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTextureSample extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var() Texture		Texture;
var ExpressionInput	Coordinates;

/** 
 * Texture object input which overrides Texture if specified. 
 * This only shows up in material functions and is used to implement texture parameters without actually putting the texture parameter in the function.
 */
var ExpressionInput	TextureObject;

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
   MenuCategories(0)="Texture"
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionTextureSample"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
