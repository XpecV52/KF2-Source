//=============================================================================
// KFKActor
//=============================================================================
// Base class for all placeable KActors in KF
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFKActor extends KActor
	placeable;

enum EKActorNetworkType
{
	/** figure it out based on size */
	NT_Auto,
	/** client side only (not gameplay relevant) */
	NT_ClientSide,
	/** server side and replicated (gameplay relevant) */
	NT_Replicated,
};

/** type of networking to use */
var() EKActorNetworkType NetworkType;

/*
 * Set network role based on type setting
 * NOTE: If you modify this function, also modify KFKAsset
 */
simulated event PreBeginPlay()
{
	local bool bClientSide;

	switch (NetworkType)
	{
		case NT_Auto:
			// Assumes clientside for now.  Could be dynamically determined based on MeshExtent.
			bClientSide = true;	
			break;
		case NT_Replicated:
			bClientSide = false;
			break;
		default:
			bClientSide = true;	// default to clientside
			break;
	}

	if (WorldInfo.NetMode == NM_Client)
	{
		// on the client, set role to Authority if we're a clientside only KActor
		Role = bClientSide ? ROLE_Authority : ROLE_SimulatedProxy;
	}
	else
	{
		// on the server, set role to SimulatedProxy (i.e. replicate it) only if not clientside
		RemoteRole = bClientSide ? ROLE_None : ROLE_SimulatedProxy;
	}

	if (bClientSide)
	{
		SetCollision(, false);
	}

	Super.PreBeginPlay();
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
      WireframeColor=(B=128,G=255,R=0,A=255)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFKActor:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      bBlockFootPlacement=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__KActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__KActor:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   RemoteRole=ROLE_None
   CollisionComponent=StaticMeshComponent0
   Name="Default__KFKActor"
   ObjectArchetype=KActor'Engine.Default__KActor'
}
