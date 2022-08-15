/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class GameCrowdInfoVolume extends Volume
	native
	placeable;

/** List of all GameCrowdDestinations that are PotentialSpawnPoints */
var() array<GameCrowdDestination> PotentialSpawnPoints;

simulated function Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local Pawn P;
	local GameCrowdPopulationManager PopMgr;

	Super.Touch( Other, OtherComp, HitLocation, HitNormal );

	P = Pawn(Other);
	if( P != None && P.IsHumanControlled() )
	{
		PopMgr = GameCrowdPopulationManager(WorldInfo.PopulationManager);
		if( PopMgr != None )
		{
			PopMgr.SetCrowdInfoVolume( self );
		}
	}
}

simulated function UnTouch( Actor Other )
{
	local Pawn P;
	local GameCrowdPopulationManager PopMgr;

	Super.UnTouch( Other );

	P = Pawn(Other);
	if( P != None && P.IsHumanControlled() )
	{
		PopMgr = GameCrowdPopulationManager(WorldInfo.PopulationManager);
		if( PopMgr != None )
		{
			PopMgr.SetCrowdInfoVolume( None );
		}
	}
}

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__GameCrowdInfoVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
