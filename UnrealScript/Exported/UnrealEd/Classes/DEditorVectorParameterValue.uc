/**
 * MaterialEditorInstanceConstant.uc: This is derived class for material instance editor parameter represenation.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DEditorVectorParameterValue extends DEditorParameterValue
	native
	hidecategories(Object)
	dependson(UnrealEdTypes)
	collapsecategories
	editinlinenew;

var() LinearColor	ParameterValue;

defaultproperties
{
   ParameterValue=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   Name="Default__DEditorVectorParameterValue"
   ObjectArchetype=DEditorParameterValue'UnrealEd.Default__DEditorParameterValue'
}
