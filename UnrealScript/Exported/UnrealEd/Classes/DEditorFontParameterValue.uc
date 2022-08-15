/**
 * MaterialEditorInstanceConstant.uc: This is derived class for material instance editor parameter represenation.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DEditorFontParameterValue extends DEditorParameterValue
	native
	hidecategories(Object)
	dependson(UnrealEdTypes)
	collapsecategories;


var() Font		FontValue;
var() int		FontPage;

defaultproperties
{
   Name="Default__DEditorFontParameterValue"
   ObjectArchetype=DEditorParameterValue'UnrealEd.Default__DEditorParameterValue'
}
