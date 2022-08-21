/**
 * Toggleable version of DirectionalLight.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DirectionalLightToggleable extends DirectionalLight
	native(Light)
	ClassGroup(Lights, DirectionalLights)
	placeable;


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
   Begin Object Class=DirectionalLightComponent Name=DirectionalLightComponent0 Archetype=DirectionalLightComponent'Engine.Default__DirectionalLight:DirectionalLightComponent0'
      LightmassSettings=(IndirectLightingScale=0.000000)
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DirectionalLightComponent0"
      ObjectArchetype=DirectionalLightComponent'Engine.Default__DirectionalLight:DirectionalLightComponent0'
   End Object
   LightComponent=DirectionalLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DirectionalLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DirectionalLight:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__DirectionalLight:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__DirectionalLight:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Toggleable_DynamicsAndStatics'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=DirectionalLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   bHardAttach=True
   CollisionComponent=LightMeshComponent0
   Name="Default__DirectionalLightToggleable"
   ObjectArchetype=DirectionalLight'Engine.Default__DirectionalLight'
}
