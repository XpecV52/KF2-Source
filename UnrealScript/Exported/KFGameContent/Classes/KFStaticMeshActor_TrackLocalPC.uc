//=============================================================================
// KFStaticMeshActor_TrackLocalPC
//=============================================================================
// Custom visual class that tracks and rotates to look towards the local PC.
//      Used for map effects.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFStaticMeshActor_TrackLocalPC extends StaticMeshActor
    placeable;

simulated event Tick(float DeltaTime)
{
    local PlayerController PC;
    super.Tick(DeltaTime);

    if (WorldInfo.NetMode != NM_DedicatedServer)
    {
        PC = GetALocalPlayerController();
        if (PC != none && PC.Pawn != none)
        {
            StaticMeshComponent.SetRotation(Rotator(PC.Pawn.Location - Location));
        }
    }
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      RBCollideWithChannels=(Visibility=True)
      bAcceptReflections=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   bStatic=False
   bUpdateSimulatedPosition=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFStaticMeshActor_TrackLocalPC"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}
