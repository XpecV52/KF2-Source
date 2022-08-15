/**
 * Version of SkeletalMeshActor intended to be used in cinematics, when SkeletalMeshActorMAT is too heavyweight.
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class SkeletalMeshCinematicActor extends SkeletalMeshActor
	native(Anim)
	placeable;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'Engine.Default__SkeletalMeshCinematicActor:SkeletalMeshComponent0.AnimNodeSeq0'
      bPerBoneMotionBlur=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshCinematicActor:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      bAcceptsStaticDecals=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      bAllowDynamicShadowsOnTranslucency=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'Engine.Default__SkeletalMeshActor:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=SkeletalMeshComponent0
   Components(1)=FaceAudioComponent
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__SkeletalMeshCinematicActor"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
