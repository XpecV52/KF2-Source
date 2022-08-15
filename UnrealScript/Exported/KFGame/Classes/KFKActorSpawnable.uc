//=============================================================================
// KFKActorSpawnable
//=============================================================================
// Custom KActorSpawnable that's used by KFDestructibleActor
// Used to set lighting params on the client for replicated KActors
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFKActorSpawnable extends KActorSpawnable
	native(Effect);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// Ideally, these never spawn on dedicated, but just in case destroy here
 	if (WorldInfo.NetMode == NM_DedicatedServer && RemoteRole == ROLE_None)
 	{		
 		Destroy();
 	}
}

simulated function HideForInterval(float Duration)
{
	if ( Duration > 0 )
	{
		StaticMeshComponent.SetHidden(TRUE);
		SetTimer(Duration, false, nameof(UnHideTimer));
	}
}

simulated function UnHideTimer()
{
	StaticMeshComponent.SetHidden(FALSE);
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__KActorSpawnable:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFKActorSpawnable:MyLightEnvironment'
      RBChannel=RBCC_EffectPhysics
      CastShadow=False
      bBlockFootPlacement=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__KActorSpawnable:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__KActorSpawnable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__KActorSpawnable:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   RemoteRole=ROLE_None
   bBlockActors=False
   LifeSpan=30.000000
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFKActorSpawnable"
   ObjectArchetype=KActorSpawnable'Engine.Default__KActorSpawnable'
}
