/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SpotLightComponent extends PointLightComponent
	native(Light)
	hidecategories(Object)
	editinlinenew;

var() float	InnerConeAngle;
var() float OuterConeAngle;

/** Angle from the spot direction that pixels must be in to affect light shafts from this light. */
var(LightShafts) float LightShaftConeAngle;

var const DrawLightConeComponent PreviewInnerCone;
var const DrawLightConeComponent PreviewOuterCone;

var() const rotator Rotation;

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

native final function SetRotation( rotator NewRotation );

defaultproperties
{
   OuterConeAngle=44.000000
   LightShaftConeAngle=89.000000
   Name="Default__SpotLightComponent"
   ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
}
