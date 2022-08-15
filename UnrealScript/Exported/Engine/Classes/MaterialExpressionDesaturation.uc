/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDesaturation extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

// Outputs: Lerp(Input,dot(Input,LuminanceFactors)),Percent)

var ExpressionInput	Input;
var ExpressionInput	Percent;
var() LinearColor	LuminanceFactors;	// Color component factors for converting a color to greyscale.

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
   LuminanceFactors=(R=0.300000,G=0.590000,B=0.110000,A=0.000000)
   MenuCategories(0)="Color"
   MenuCategories(1)="Utility"
   Name="Default__MaterialExpressionDesaturation"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
