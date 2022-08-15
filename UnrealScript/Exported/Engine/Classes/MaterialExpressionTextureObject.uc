/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 * Node which outputs a texture object itself, instead of sampling the texture first.
 * This is used with material functions to provide a preview value for a texture function input.
 */
class MaterialExpressionTextureObject extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var() Texture Texture;

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
   MenuCategories(1)="FunctionUtility"
   Name="Default__MaterialExpressionTextureObject"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
