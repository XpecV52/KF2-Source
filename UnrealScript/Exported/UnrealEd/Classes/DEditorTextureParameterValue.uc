/**
 * MaterialEditorInstanceConstant.uc: This is derived class for material instance editor parameter represenation.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DEditorTextureParameterValue extends DEditorParameterValue
	native
	hidecategories(Object)
	dependson(UnrealEdTypes)
	collapsecategories;

var() Texture	ParameterValue;

defaultproperties
{
   Name="Default__DEditorTextureParameterValue"
   ObjectArchetype=DEditorParameterValue'UnrealEd.Default__DEditorParameterValue'
}
