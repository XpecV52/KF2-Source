/**
 * Dominant version of SpotLight that generates static shadowmaps.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class DominantSpotLight extends SpotLight
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

defaultproperties
{
   Begin Object Class=DominantSpotLightComponent Name=DominantSpotLightComponent0
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__DominantSpotLight:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__DominantSpotLight:DrawOuterCone0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__DominantSpotLight:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__DominantSpotLight:DrawLightSourceRadius0'
      bAllowPreShadow=True
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DominantSpotLightComponent0"
      ObjectArchetype=DominantSpotLightComponent'Engine.Default__DominantSpotLightComponent'
   End Object
   LightComponent=DominantSpotLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__SpotLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
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
      Sprite=Texture2D'EditorResources.LightIcons.Light_Spot_Toggleable_Statics'
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
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
   End Object
   Components(1)=DrawLightRadius0
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
   End Object
   Components(2)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
   End Object
   Components(3)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
   End Object
   Components(4)=DrawLightSourceRadius0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
   End Object
   Components(5)=ArrowComponent0
   Components(6)=DominantSpotLightComponent0
   bHardAttach=True
   CollisionComponent=LightMeshComponent0
   Name="Default__DominantSpotLight"
   ObjectArchetype=SpotLight'Engine.Default__SpotLight'
}
