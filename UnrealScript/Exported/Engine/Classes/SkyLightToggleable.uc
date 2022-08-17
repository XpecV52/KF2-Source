/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SkyLightToggleable extends SkyLight
	native(Light)
	ClassGroup(Lights,SkyLights)
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

defaultproperties
{
   Begin Object Class=SkyLightComponent Name=SkyLightComponent0 Archetype=SkyLightComponent'Engine.Default__SkyLight:SkyLightComponent0'
      UseDirectLightMap=True
      bCanAffectDynamicPrimitivesOutsideDynamicChannel=True
      Name="SkyLightComponent0"
      ObjectArchetype=SkyLightComponent'Engine.Default__SkyLight:SkyLightComponent0'
   End Object
   LightComponent=SkyLightComponent0
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__SkyLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__SkyLight:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__SkyLight:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__SkyLight:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SkyLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_SkyLight'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SkyLight:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=SkyLightComponent0
   TickGroup=TG_DuringAsyncWork
   bHardAttach=True
   BlockRigidBody=False
   CollisionComponent=LightMeshComponent0
   Name="Default__SkyLightToggleable"
   ObjectArchetype=SkyLight'Engine.Default__SkyLight'
}
