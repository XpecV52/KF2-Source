/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * Node which creates a texture parameter and outputs the texture object itself, instead of sampling the texture first.
 * This is used with material functions to implement texture parameters without actually putting the parameter in the function.
 */
class MaterialExpressionTextureObjectParameter extends MaterialExpressionTextureSampleParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

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
   Texture=Texture2D'EngineResources.DefaultTexture'
   MenuCategories(0)="Texture"
   MenuCategories(1)="Parameters"
   Outputs(0)=(Mask=0,MaskR=0,MaskG=0,MaskB=0)
   Name="Default__MaterialExpressionTextureObjectParameter"
   ObjectArchetype=MaterialExpressionTextureSampleParameter'Engine.Default__MaterialExpressionTextureSampleParameter'
}
