/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTime extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** This time continues advancing regardless of whether the game is paused. */
var() bool bIgnorePause;

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
   MenuCategories(0)="Utility"
   MenuCategories(1)="WorldPosOffset"
   Name="Default__MaterialExpressionTime"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
