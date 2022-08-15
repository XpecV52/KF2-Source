/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SpotLight extends Light
	native(Light)
	ClassGroup(Lights,SpotLights)
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

defaultproperties
{
   Begin Object Class=SpotLightComponent Name=SpotLightComponent0
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
      LightSprite=SpriteComponent'Engine.Default__SpotLight:Sprite'
      CastDynamicShadows=False
      UseDirectLightMap=True
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="SpotLightComponent0"
      ObjectArchetype=SpotLightComponent'Engine.Default__SpotLightComponent'
   End Object
   LightComponent=SpotLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__Light:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__Light:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__Light:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__Light:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Light:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Spot_Stationary_Statics'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Light:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=LightMeshComponent0
   Components(2)=LensFlareComponent0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(3)=DrawLightRadius0
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(4)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(5)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(6)=DrawLightSourceRadius0
   Components(7)=SpotLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(8)=ArrowComponent0
   Rotation=(Pitch=-16384,Yaw=0,Roll=0)
   CollisionComponent=LightMeshComponent0
   Name="Default__SpotLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
