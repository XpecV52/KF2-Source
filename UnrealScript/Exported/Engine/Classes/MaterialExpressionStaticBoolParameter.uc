/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionStaticBoolParameter extends MaterialExpressionParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

var() bool	DefaultValue;
var() bool	ExtendedCaptionDisplay;

//the override that will be set when this expression is being compiled from a static permutation
var const native transient pointer InstanceOverride{const FStaticSwitchParameter};

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
   bUsedByStaticParameterSet=True
   Name="Default__MaterialExpressionStaticBoolParameter"
   ObjectArchetype=MaterialExpressionParameter'Engine.Default__MaterialExpressionParameter'
}
