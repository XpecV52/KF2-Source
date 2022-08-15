/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionVertexColor extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Particles"
   MenuCategories(1)="Constants"
   MenuCategories(2)="WorldPosOffset"
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionVertexColor"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
