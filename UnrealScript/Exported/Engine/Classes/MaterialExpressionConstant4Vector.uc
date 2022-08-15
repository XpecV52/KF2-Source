/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionConstant4Vector extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var() float	R,
			G,
			B,
			A;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MenuCategories(0)="Constants"
   MenuCategories(1)="Vectors"
   Name="Default__MaterialExpressionConstant4Vector"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
