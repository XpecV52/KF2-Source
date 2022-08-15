//=============================================================================
// KFKAsset
//=============================================================================
// Base class for all placeable KAssets in KF
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFKAsset extends KAsset	
	deprecated;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=KAssetSkelMeshComponent Archetype=SkeletalMeshComponent'Engine.Default__KAsset:KAssetSkelMeshComponent'
      PhysicsWeight=1.000000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bUpdateSkelWhenNotRendered=False
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bUseTickOptimization=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFKAsset:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      bBlockFootPlacement=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="KAssetSkelMeshComponent"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__KAsset:KAssetSkelMeshComponent'
   End Object
   SkeletalMeshComponent=KAssetSkelMeshComponent
   Components(0)=KAssetSkelMeshComponent
   CollisionComponent=KAssetSkelMeshComponent
   Name="Default__KFKAsset"
   ObjectArchetype=KAsset'Engine.Default__KAsset'
}
