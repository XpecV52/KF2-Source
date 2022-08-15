/**
 * Movable version of SpotLight.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SpotLightMovable extends SpotLight
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

defaultproperties
{
   Begin Object Class=SpotLightComponent Name=SpotLightComponent0 Archetype=SpotLightComponent'Engine.Default__SpotLight:SpotLightComponent0'
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__SpotLightMovable:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__SpotLightMovable:DrawOuterCone0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__SpotLightMovable:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__SpotLightMovable:DrawLightSourceRadius0'
      LightSprite=SpriteComponent'Engine.Default__SpotLightMovable:Sprite'
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="SpotLightComponent0"
      ObjectArchetype=SpotLightComponent'Engine.Default__SpotLight:SpotLightComponent0'
   End Object
   LightComponent=SpotLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__SpotLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__SpotLight:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__SpotLight:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__SpotLight:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SpotLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Spot_Moveable_DynamicsAndStatics'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpotLight:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=LightMeshComponent0
   Components(2)=LensFlareComponent0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
   End Object
   Components(3)=DrawLightRadius0
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
   End Object
   Components(4)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
   End Object
   Components(5)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
   End Object
   Components(6)=DrawLightSourceRadius0
   Components(7)=SpotLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
   End Object
   Components(8)=ArrowComponent0
   TickGroup=TG_DuringAsyncWork
   bHardAttach=True
   bMovable=True
   CollisionComponent=LightMeshComponent0
   Name="Default__SpotLightMovable"
   ObjectArchetype=SpotLight'Engine.Default__SpotLight'
}
