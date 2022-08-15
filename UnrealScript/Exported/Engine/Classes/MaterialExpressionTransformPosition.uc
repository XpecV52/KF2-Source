/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTransformPosition extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** input expression for this transform */
var ExpressionInput	Input;

/** source format of the position that will be transformed */
var() const enum EMaterialPositionTransformSource
{
	TRANSFORMPOSSOURCE_Local<DisplayName=Local>,
	TRANSFORMPOSSOURCE_PostProjection<DisplayName=Post Projection>
}TransformSourceType<DisplayName=Source>;

/** type of transform to apply to the input expression */
var() const enum EMaterialPositionTransform
{
	// transform from post projection to world space
	TRANSFORMPOS_World<DisplayName=World>
} TransformType<DisplayName=Destination>;

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
   TransformSourceType=TRANSFORMPOSSOURCE_PostProjection
   MenuCategories(0)="VectorOps"
   Name="Default__MaterialExpressionTransformPosition"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
