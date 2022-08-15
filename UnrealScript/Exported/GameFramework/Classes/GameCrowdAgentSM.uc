/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GameCrowdAgentSM extends GameCrowdAgent
	abstract
	native;

var(Rendering) StaticMeshComponent Mesh;
var(Rendering) MaterialInstanceConstant MeshColor;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	MeshColor = Mesh.CreateAndSetMaterialInstanceConstant(0);
}

simulated function InitDebugColor()
{
	Super.InitDebugColor();
	ChangeDebugColor( DebugAgentColor );
}

simulated function ChangeDebugColor( Color InC )
{
	local LinearColor C;

	C.R = float(InC.R) / 255.f;
	C.G = float(InC.G) / 255.f;
	C.B = float(InC.B) / 255.f;
	MeshColor.SetVectorParameterValue( 'CrowdCylinderColor', C );	
}

function ActivateBehavior(GameCrowdAgentBehavior NewBehaviorArchetype, optional Actor LookAtActor )
{
	Super.ActivateBehavior( NewBehaviorArchetype, LookAtActor );

	if( CurrentBehavior != None )
	{
		ChangeDebugColor( CurrentBehavior.DebugBehaviorColor );
	}
	else
	{
		ChangeDebugColor( DebugAgentColor );
	}
}

function StopBehavior()
{
	Super.StopBehavior();

	if( CurrentBehavior == None )
	{
		ChangeDebugColor( DebugAgentColor );
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      bAcceptsDynamicDecals=False
      bCastDynamicShadow=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Mesh=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'GameFramework.Default__GameCrowdAgent:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'GameFramework.Default__GameCrowdAgent:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Components(1)=StaticMeshComponent0
   Name="Default__GameCrowdAgentSM"
   ObjectArchetype=GameCrowdAgent'GameFramework.Default__GameCrowdAgent'
}
