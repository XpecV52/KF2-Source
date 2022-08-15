/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionVectorParameter extends MaterialExpressionParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

var() LinearColor	DefaultValue;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DefaultValue=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   MenuCategories(1)="WorldPosOffset"
   Outputs(0)=(Mask=1,MaskR=1,MaskG=1,MaskB=1)
   Outputs(1)=(Mask=1,MaskR=1)
   Outputs(2)=(Mask=1,MaskG=1)
   Outputs(3)=(Mask=1,MaskB=1)
   Outputs(4)=(Mask=1,MaskA=1)
   Name="Default__MaterialExpressionVectorParameter"
   ObjectArchetype=MaterialExpressionParameter'Engine.Default__MaterialExpressionParameter'
}
