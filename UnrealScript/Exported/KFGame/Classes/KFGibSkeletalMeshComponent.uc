//=============================================================================
// KFGibSkeletalMeshComponent
//=============================================================================
// Skeletal mesh component for a giblet mesh
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 8/14/2014
//=============================================================================

class KFGibSkeletalMeshComponent extends SkeletalMeshComponent;

defaultproperties
{
   PhysicsWeight=1.000000
   bUpdateSkelWhenNotRendered=False
   ReplacementPrimitive=None
   MaxDrawDistance=2500.000000
   RBChannel=RBCC_EffectPhysics
   CastShadow=False
   bCastDynamicShadow=False
   CollideActors=True
   BlockRigidBody=True
   RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,DeadPawn=True)
   ScriptRigidBodyCollisionThreshold=5.000000
   Name="Default__KFGibSkeletalMeshComponent"
   ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
}
