/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GameCrowdBehaviorPoint extends GameCrowdInteractionPoint
	native
	placeable
	config(Crowd)
	dependson(GameCrowdAgentBehavior);

/** Raius of this event */
var config float RadiusOfBehaviorEvent;
/** Duration of how long this event will last **/
var config float DurationOfBehaviorEvent;
/** Event type to pass to crowd within radius */
var() ECrowdBehaviorEvent EventType;
var() bool bRequireLOS;

var   Actor     Initiator;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event PostBeginPlay()
{
	Super.PostBeginPlay();

	if( RadiusOfBehaviorEvent > 0.f )
	{
		CylinderComponent.SetCylinderSize( RadiusOfBehaviorEvent, 200.0f );
	}

	if( DurationOfBehaviorEvent > 0.0f )
	{
		SetTimer( DurationOfBehaviorEvent, FALSE, nameof(DestroySelf) );
	}
}

function DestroySelf()
{
	LifeSpan = 0.001f;
}

event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local GameCrowdAgent Agent;
	
	Agent = GameCrowdAgent(Other);
	if( Agent != None )
	{
		if( !bRequireLOS || FastTrace( Other.Location, Location ) )
		{
			Agent.HandleBehaviorEvent( EventType, Initiator, FALSE, TRUE );
		}
	}
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GameCrowdInteractionPoint:CollisionCylinder'
      CollisionHeight=200.000000
      CollisionRadius=512.000000
      CylinderColor=(B=0,G=255,R=0,A=255)
      bDrawNonColliding=True
      ReplacementPrimitive=None
      HiddenGame=False
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GameCrowdInteractionPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'GameFramework.Default__GameCrowdInteractionPoint:Sprite'
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Behavior'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'GameFramework.Default__GameCrowdInteractionPoint:Sprite'
   End Object
   Components(1)=Sprite
   bNoDelete=False
   bCollideActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__GameCrowdBehaviorPoint"
   ObjectArchetype=GameCrowdInteractionPoint'GameFramework.Default__GameCrowdInteractionPoint'
}
