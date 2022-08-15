/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionSPHFluidVertexColor extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var Texture		DefaultTexture;

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
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionSPHFluidVertexColor"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
