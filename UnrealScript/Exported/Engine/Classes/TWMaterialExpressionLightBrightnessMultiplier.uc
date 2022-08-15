//=============================================================================
// TWMaterialExpressionLightBrightnessMultiplier
//=============================================================================
// Brightness multiplier for modifying the material of meshes that are used
// as light fixtures for lights with animating brightness.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 2/22/2013
//=============================================================================

class TWMaterialExpressionLightBrightnessMultiplier extends MaterialExpressionScalarParameter
	native(TW)
	collapsecategories
	hidecategories(Object,MaterialExpressionParameter,MaterialExpressionScalarParameter);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   DefaultValue=1.000000
   ParameterName="BrightnessMultiplier"
   MenuCategories(0)="LightAnimation"
   MenuCategories(1)=()
   Name="Default__TWMaterialExpressionLightBrightnessMultiplier"
   ObjectArchetype=MaterialExpressionScalarParameter'Engine.Default__MaterialExpressionScalarParameter'
}
