//=============================================================================
// KFGibStaticMeshComponent
//=============================================================================
// Static mesh component for a giblet mesh
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 8/14/2014
//=============================================================================

class KFGibStaticMeshComponent extends StaticMeshComponent;

defaultproperties
{
   ReplacementPrimitive=None
   MaxDrawDistance=2500.000000
   RBChannel=RBCC_EffectPhysics
   CastShadow=False
   bCastDynamicShadow=False
   BlockActors=False
   RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,DeadPawn=True)
   ScriptRigidBodyCollisionThreshold=5.000000
   Name="Default__KFGibStaticMeshComponent"
   ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
}
