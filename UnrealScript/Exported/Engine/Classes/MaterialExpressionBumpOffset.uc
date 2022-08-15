/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionBumpOffset extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

// Outputs: Coordinate + Eye.xy * (Height - ReferencePlane) * HeightRatio

var ExpressionInput	Coordinate;
var ExpressionInput	Height;
var ExpressionInput	HeightRatioInput;
var() float			HeightRatio;	// Perceived height as a fraction of width.
var() float			ReferencePlane;	// Height at which no offset is applied.

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
   HeightRatio=0.050000
   ReferencePlane=0.500000
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionBumpOffset"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
