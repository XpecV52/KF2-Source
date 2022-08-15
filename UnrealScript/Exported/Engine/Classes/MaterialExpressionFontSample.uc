/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionFontSample extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** font resource that will be sampled */
var() Font Font;
/** allow access to the various font pages */
var() int FontTexturePage;

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
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Font"
   MenuCategories(1)="Texture"
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionFontSample"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
