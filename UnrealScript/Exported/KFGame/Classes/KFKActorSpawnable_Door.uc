//=============================================================================
// KFKActorSpawnable_Door
//=============================================================================
// A custom KActor that will hide if it lands in an akward position
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Author 4/15/2014
//=============================================================================

class KFKActorSpawnable_Door extends KFKActorSpawnable;

event OnSleepRBPhysics()
{
	HideNonFlatMesh();
}

/** If a door lands at an awkward angle, hide it as soon as we can no longer see it */
simulated function HideNonFlatMesh()
{
	if ( !CheckOnFlatGround() )
	{
		StaticMeshComponent.SetActorCollision(false, false);

		if ( (WorldInfo.TimeSeconds - LastRenderTime) > 1.0 )
		{
			StaticMeshComponent.SetHidden(TRUE);
		}
		else
		{
			SetTimer(1.0f, false, nameof(HideNonFlatMesh), self);
		}
	}
}

/** Check if the door is laying flat on the ground after being destroyed */
function bool CheckOnFlatGround()
{
	local vector DoorX, DoorY, DoorZ;

    GetAxes(Rotation, DoorX, DoorY, DoorZ);
	return ( DoorX.Z < 0.95f ) ? false : true; 
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'KFGame.Default__KFKActorSpawnable:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFKActorSpawnable_Door:MyLightEnvironment'
      RBChannel=RBCC_EffectPhysics
      CastShadow=False
      bBlockFootPlacement=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'KFGame.Default__KFKActorSpawnable:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'KFGame.Default__KFKActorSpawnable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'KFGame.Default__KFKActorSpawnable:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   bCallRigidBodyWakeEvents=True
   LifeSpan=0.000000
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFKActorSpawnable_Door"
   ObjectArchetype=KFKActorSpawnable'KFGame.Default__KFKActorSpawnable'
}
