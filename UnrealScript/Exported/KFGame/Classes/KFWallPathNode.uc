//=============================================================================
// KFWallPathNode
//=============================================================================
// Pathnode type that can be placed on walls (for PHYS_Spider)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// Based on GearWallPathNode
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class KFWallPathNode extends KFPathnode
	placeable
	native(Waypoint);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var duplicatetransient const float					MaxJumpDist;
/** If true, Crawlers will attempt to jump from the floor to this node when attempting to move from the floor to a wall */
var() duplicatetransient bool						bMustJumpTo;
var	duplicatetransient bool							bAutoConnectDropDownNodes;
/** KFPathnodes on the default floor will not add a floor-to-wall connection to this wall node if the distance between the nodes exceeds this value. */
var() duplicatetransient float						MaxFloorToWallDistance;
/** Maximum allowed distance (Unreal units) to nodes on the ground - this is almost always going to be for KFWallPathNode to KFPathnode connections.
	Pawns can drop to floor if within distance. */
var() duplicatetransient float						Max2DDistToFloorNodes;
/** Maximum allowed distance (Unreal units) to nodes on other walls or ceiling if I'm not on a ceiling (excluding the real floor, which is handled by MaxDistToFloorNodes */
var() duplicatetransient float						MaxDistToNodesOnOtherFloors;
/** Maximum height distance (UU) to create a wall-to-floor dropdown reachspec from this node to nearby pathnodes on the floor */
var() duplicatetransient float						MaxDropFromWallDistance;
/** Auto-generated during pathbuilding. This is a reference to the KFPathNode, if any, that a Crawler can drop down to from this wall node. */
var() duplicatetransient editconst KFPathNode		DropDownNode;

native function bool IsUsableAnchorFor( Pawn P );

simulated event string GetDebugAbbrev()
{
	return "WPN";
}

/**
 * SpecialCost()
 * Event allowing cost of this path to be modified based on who's pathing and which
 * ReachSpec is in use.
 * 
 * @param	Seeker	The pawn who is pathfinding
 * @param	Path	ReachSpec connecting this navigation point to the end navigation point
 * @return	int		Special cost to apply
 */
event int SpecialCost( Pawn Seeker, ReachSpec Path )
{
	return super.SpecialCost(Seeker, Path);
}

/**
 * Accept()
 * Event that accepts or rejects an actor that has teleported to this node.
 * 
 * @param	Incoming
 * @param	Source
 * @return	function bool
 */
event bool Accept( actor Incoming, actor Source )
{
	return Super.Accept( Incoming, Source );
}

/**
 * DetourWeight()
 * Value of this path to take a quick detour (usually 0, used when on route to distant objective)
 * 
 * @param	Other		Detouring pawn
 * @param	PathWeight	
 * @return	float
 */
event float DetourWeight( Pawn Other, float PathWeight )
{
	return super.DetourWeight( Other, PathWeight );
}

/**
 * SuggestMovePreparation()
 * Optionally tell Pawn any special instructions to prepare for moving to this goal.
 * (Called by Pawn.PrepareForMove() if this node's bSpecialMove==true) 
 * 
 * @param	Other	Pathfinding NPC
 */
event bool SuggestMovePreparation( Pawn Other )
{
	// If special move was taken to get to this link
	return Other.SpecialMoveTo(Other.Anchor, self, Other.Controller.MoveTarget);
}

defaultproperties
{
   MaxJumpDist=512.000000
   MaxFloorToWallDistance=100.000000
   Max2DDistToFloorNodes=96.000000
   MaxDistToNodesOnOtherFloors=300.000000
   MaxDropFromWallDistance=350.000000
   WallReachSpecClass=Class'KFGame.WallReachSpec'
   bSpecialMove=True
   bWallNode=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPathnode:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPathnode:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite'
      Sprite=Texture2D'EditorResources.S_Pickup'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPathnode:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPathnode:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPathnode:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'KFGame.Default__KFPathnode:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'KFGame.Default__KFPathnode:PathRenderer'
   End Object
   Components(4)=PathRenderer
   EditorIconColor=(B=255,G=50,R=50,A=255)
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=CollisionCylinder
   Name="Default__KFWallPathNode"
   ObjectArchetype=KFPathnode'KFGame.Default__KFPathnode'
}
