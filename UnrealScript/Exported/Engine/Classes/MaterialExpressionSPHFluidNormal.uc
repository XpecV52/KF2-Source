/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionSPHFluidNormal extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var Texture		DefaultTexture;
var ExpressionInput	DepthMipmapThreshold;

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
   DefaultTexture=Texture2D'EngineResources.DefaultTexture'
   MenuCategories(0)="Texture"
   Name="Default__MaterialExpressionSPHFluidNormal"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
