/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class SplineActor extends Actor
	placeable
	native(Spline);
	
/** Struct containing information about one connection from this SplineActor to another. */	
struct native SplineConnection
{
	/** Component that stores actual spline points, tangents, reparam table etc */
	var()   SplineComponent     SplineComponent;
	/** Which SplineActor this one connects to - spline is between these locations */
	var()   SplineActor         ConnectTo;	
};

/** Array of connections */
var     array<SplineConnection> Connections;

/** Tangent of spline at this actor - this is in local space */
var()   interp Vector                  SplineActorTangent;

/** Color to use to draw the splines */
var()   Color                   SplineColor;

/** Splines connectin to this SplineActor will be marked as bSplineDisabled */
var()   bool                    bDisableDestination;

/** Set of SplineActors that link to this one */
var     array<SplineActor>      LinksFrom;

var     transient SplineActor   nextOrdered;
var     transient SplineActor   prevOrdered;
var     transient SplineActor   previousPath;
var     transient int           bestPathWeight;
var     transient int           visitedWeight;
var     transient bool          bAlreadyVisited;

/** For actors using this spline, how quickly to move along the spline over time */
var() editinline InterpCurveFloat SplineVelocityOverTime;

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

/** Returns spline tangent at this actor, in world space */
native function vector GetWorldSpaceTangent();

/** Create/destroy/update SplineComponents belonging to this SplineActor. */
native function UpdateSplineComponents();

/** Create/destroy/update SplineComponents belonging to this SplineActor, and all SplineActors that link to this. */
native function UpdateConnectedSplineComponents(bool bFinish);	
	
/** Create a connection to another SplineActor */
native function AddConnectionTo(SplineActor NextActor);

/** Returns TRUE if there is a connection from this SplineActor to NextActor */	
native function bool IsConnectedTo(SplineActor NextActor, bool bCheckForDisableDestination) const;

/** Returns the SplineComponent that connects this SplineActor to NextActor. Returns None if not connected */
native function SplineComponent FindSplineComponentTo(SplineActor NextActor);

/** Returns the SplineActor that this SplineComponent connects to. */
native function SplineActor FindTargetForComponent(SplineComponent SplineComp);

/** Breaks a connection from this SplineActor to NextActor */
native function BreakConnectionTo(SplineActor NextActor);

/** Break all connections to and from this SplineActor */
native function BreakAllConnections();

/** Break all connections from this SplineActor */
native function BreakAllConnectionsFrom();

/** If bUseLinksFrom is false, returns a random SplineActor that is connected to from this SplineActor.  Otherwise, returns a random SplineActor that connects to this SplineActor.  If no connections, returns None. */
native function SplineActor GetRandomConnection(optional bool bUseLinksFrom);

/** Returns a SplineActor that takes you most in the specified direction. If no connections, returns None.  If bUseLinksFrom is true, the best connection TO this spline will be returned */
native function SplineActor GetBestConnectionInDirection(Vector DesiredDir, optional bool bUseLinksFrom);

/** Find a path through network from this point to Goal, and put results into OutRoute. */
native function bool FindSplinePathTo(SplineActor Goal, out array<SplineActor> OutRoute);

/** Find all SplineActors connected to (and including) this one */
native function GetAllConnectedSplineActors(out array<SplineActor> OutSet);


/** Handle Toggle action for setting bDisableDestination */
function OnToggle(SeqAct_Toggle inAction)
{
	if (inAction.InputLinks[0].bHasImpulse)
	{
		bDisableDestination = FALSE;
	}
	else if (inAction.InputLinks[1].bHasImpulse)
	{
		bDisableDestination = TRUE;
	}
	else
	{
		bDisableDestination = !bDisableDestination;
	}
	
	// Need to do this so that splines components change color
	UpdateConnectedSplineComponents(TRUE);
}
	

/** Handler for SeqAct_ToggleHidden, just sets bHidden. */
simulated function OnToggleHidden(SeqAct_ToggleHidden Action)
{
	Super.OnToggleHidden( Action );

	// update all components
	UpdateConnectedSplineComponents( TRUE );
}

	

defaultproperties
{
   SplineActorTangent=(X=300.000000,Y=0.000000,Z=0.000000)
   SplineColor=(B=255,G=0,R=255,A=255)
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Spline'
      SpriteCategoryName="Splines"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Name="Default__SplineActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
