/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DirectionalLight extends Light
	native(Light)
	ClassGroup(Lights,DirectionalLights)
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

defaultproperties
{
   Begin Object Class=DirectionalLightComponent Name=DirectionalLightComponent0
      UseDirectLightMap=True
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DirectionalLightComponent0"
      ObjectArchetype=DirectionalLightComponent'Engine.Default__DirectionalLightComponent'
   End Object
   LightComponent=DirectionalLightComponent0
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
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Stationary_DynamicsAndStatics'
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
   Components(3)=DirectionalLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(4)=ArrowComponent0
   Rotation=(Pitch=-16384,Yaw=0,Roll=0)
   CollisionComponent=LightMeshComponent0
   Name="Default__DirectionalLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
