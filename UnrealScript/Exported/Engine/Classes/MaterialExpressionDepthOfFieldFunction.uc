/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDepthOfFieldFunction extends MaterialExpression
	native(Material);


enum EDepthOfFieldFunctionValue
{
	TDOF_NearAndFarMask,		// 0:in Focus .. 1:Near or Far
	TDOF_NearMask,				// 0:in Focus or Far .. 1:Near
	TDOF_FarMask				// 0:in Focus or Near .. 1:Far
};

/** Determines the mapping place to use on the terrain. */
var() EDepthOfFieldFunctionValue	FunctionValue;

/** usually nothing or PixelDepth */
var ExpressionInput	Depth;

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
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionDepthOfFieldFunction"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
