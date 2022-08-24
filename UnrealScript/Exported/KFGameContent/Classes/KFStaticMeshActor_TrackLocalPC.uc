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

class KFStaticMeshActor_TrackLocalPC extends DynamicSMActor
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
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'kfgamecontent.Default__KFStaticMeshActor_TrackLocalPC:MyLightEnvironment'
      BlockRigidBody=False
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DynamicSMActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicSMActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   bUpdateSimulatedPosition=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFStaticMeshActor_TrackLocalPC"
   ObjectArchetype=DynamicSMActor'Engine.Default__DynamicSMActor'
}
