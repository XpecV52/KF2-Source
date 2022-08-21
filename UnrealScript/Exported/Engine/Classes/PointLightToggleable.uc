/**
 * Toggleable version of PointLight.
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class PointLightToggleable extends PointLight
	native(Light)
	ClassGroup(Lights,PointLights)
	placeable;

struct CheckpointRecord
{
	var bool bEnabled;
};

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

function bool ShouldSaveForCheckpoint()
{
	return (RemoteRole != ROLE_None);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bEnabled = bEnabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	bEnabled = Record.bEnabled;
	LightComponent.SetEnabled(bEnabled);
	ForceNetRelevant();
}

defaultproperties
{
   Begin Object Class=PointLightComponent Name=PointLightComponent0 Archetype=PointLightComponent'Engine.Default__PointLight:PointLightComponent0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__PointLightToggleable:DrawLightRadius0'
      LightmassSettings=(IndirectLightingScale=0.000000)
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__PointLightToggleable:DrawLightSourceRadius0'
      LightSprite=SpriteComponent'Engine.Default__PointLightToggleable:Sprite'
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="PointLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLight:PointLightComponent0'
   End Object
   LightComponent=PointLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__PointLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__PointLight:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__PointLight:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__PointLight:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PointLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Toggleable_Statics'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__PointLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightRadius0'
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightRadius0'
   End Object
   Components(1)=DrawLightRadius0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightSourceRadius0'
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightSourceRadius0'
   End Object
   Components(2)=DrawLightSourceRadius0
   Components(3)=PointLightComponent0
   bHardAttach=True
   CollisionComponent=LightMeshComponent0
   Name="Default__PointLightToggleable"
   ObjectArchetype=PointLight'Engine.Default__PointLight'
}
