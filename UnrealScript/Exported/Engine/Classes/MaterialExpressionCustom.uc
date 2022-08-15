/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionCustom extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

enum ECustomMaterialOutputType
{
	CMOT_Float1,
	CMOT_Float2,
	CMOT_Float3,
	CMOT_Float4,
};

struct native CustomInput
{
	var() string InputName;
	var edithide ExpressionInput Input;
};

var() edittextbox string Code;
var() ECustomMaterialOutputType OutputType;
var() string Description;
var() array<CustomInput> Inputs;

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
   OutputType=CMOT_Float3
   Description="Custom"
   MenuCategories(0)="Custom"
   Name="Default__MaterialExpressionCustom"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
