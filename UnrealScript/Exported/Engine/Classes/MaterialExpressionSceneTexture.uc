/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionSceneTexture extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionSceneTexture: 
 * samples the current scene texture (lighting,etc)
 * for use in a material
 */

/** texture coordinate inputt expression for this node */
var ExpressionInput	Coordinates;

var() enum ESceneTextureType
{
	// 16bit component lighting target
	SceneTex_Lighting
} SceneTextureType;

/** Matches [0,1] UVs to the view within the back buffer. */
var() bool ScreenAlign;

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
   Name="Default__MaterialExpressionSceneTexture"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
