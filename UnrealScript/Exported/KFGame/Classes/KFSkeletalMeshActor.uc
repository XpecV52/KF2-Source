//=============================================================================
// KFSkeletalMeshActor
//=============================================================================
// Custom placeable SkeletalMeshActor class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFSkeletalMeshActor extends SkeletalMeshActor
	placeable;

/** If set, will SetMaterial clientside instead of replicating */
var() bool bClientsideKismetSetMaterial;

simulated function OnSetMaterial(SeqAct_SetMaterial Action)
{
	if ( !bClientsideKismetSetMaterial )
	{
		Super.OnSetMaterial(Action);
		return;
	}

	SkeletalMeshComponent.SetMaterial( Action.MaterialIndex, Action.NewMaterial );
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'Engine.Default__SkeletalMeshActor:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'KFGame.Default__KFSkeletalMeshActor:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFSkeletalMeshActor:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockZeroExtent=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshActor:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__SkeletalMeshActor:MyLightEnvironment'
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
   Name="Default__KFSkeletalMeshActor"
   ObjectArchetype=SkeletalMeshActor'Engine.Default__SkeletalMeshActor'
}
