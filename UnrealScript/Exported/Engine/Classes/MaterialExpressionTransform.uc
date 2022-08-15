/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTransform extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** input expression for this transform */
var ExpressionInput	Input;

/** Source coordinate space of the vector */
var() const enum EMaterialVectorCoordTransformSource
{
	TRANSFORMSOURCE_World<DisplayName=World>,
	TRANSFORMSOURCE_Local<DisplayName=Local>,
	TRANSFORMSOURCE_Tangent<DisplayName=Tangent>,
	TRANSFORMSOURCE_View<DisplayName=View>,
} TransformSourceType<DisplayName=Source>;

/** Destination coordinate space of the vector */
var() const enum EMaterialVectorCoordTransform
{
	TRANSFORM_World<DisplayName=World>,
	TRANSFORM_View<DisplayName=View>,
	TRANSFORM_Local<DisplayName=Local>,
	TRANSFORM_Tangent<DisplayName=Tangent>
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
   TransformSourceType=TRANSFORMSOURCE_Tangent
   MenuCategories(0)="VectorOps"
   Name="Default__MaterialExpressionTransform"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
