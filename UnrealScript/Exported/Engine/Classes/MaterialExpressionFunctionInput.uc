/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionFunctionInput extends MaterialExpression
	native(Material)
	hidecategories(object);

/** Used for previewing when editing the function, also temporarily used to connect to the outside material when compiling that material. */
var ExpressionInput Preview;

/** The input's name, which will be drawn on the connector in function call expressions that use this function. */
var() string InputName;

/** The input's description, which will be used as a tooltip on the connector in function call expressions that use this function. */
var() string Description;

/** Id of this input, used to maintain references through name changes. */
var const guid Id;

/** Supported input types */
enum EFunctionInputType
{
	FunctionInput_Scalar,
	FunctionInput_Vector2,
	FunctionInput_Vector3,
	FunctionInput_Vector4,
	FunctionInput_Texture2D,
	FunctionInput_TextureCube,
	FunctionInput_StaticBool
};

/** 
 * Type of this input.  
 * Input code chunks will be cast to this type, and a compiler error will be emitted if the cast fails.
 */
var() EFunctionInputType InputType;

/** Value used to preview this input when editing the material function. */
var() vector4 PreviewValue;

/** Whether to use the preview value or texture as the default value for this input. */
var() bool bUsePreviewValueAsDefault;

/** Controls where the input is displayed relative to the other inputs. */
var() int SortPriority;

/** 
 * TRUE when this expression is being compiled in a function preview, 
 * FALSE when this expression is being compiled into a material that uses the function.
 * Only valid in Compile()
 */
var transient bool bCompilingFunctionPreview;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   InputName="In"
   InputType=FunctionInput_Vector3
   PreviewValue=(X=0.000000,Y=0.000000,Z=0.000000,W=1.000000)
   BorderColor=(B=172,G=255,R=185,A=0)
   MenuCategories(0)="Functions"
   Name="Default__MaterialExpressionFunctionInput"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
