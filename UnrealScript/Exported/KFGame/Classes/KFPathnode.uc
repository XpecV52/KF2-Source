//=============================================================================
// KFPathnode
//=============================================================================
// Base KF NavigationPoint that provides some additional options
//=============================================================================
// Killing Floor 2
// Copyright (C) 2012-2013 Tripwire Interactive LLC
//=============================================================================

class KFPathnode extends PathNode
	native(Waypoint);

/** Used internally, set to true if this node is a jump destination for a KFJumpSpot node */
var() duplicatetransient editconst bool		bIsJumpDest;
var() duplicatetransient editconst bool		bIsDropDownDest;
var() duplicatetransient editconst vector	JumpVelocity;
/** How long the jump should take.  Altering this value changes the JumpVelocity. */
var() duplicatetransient float				JumpTime;
var() duplicatetransient bool				bDebugLogAnchorUsability;
var() duplicatetransient bool				bAutoConnectToOtherFloors;
var() duplicatetransient bool				bPauseWhenReached;
var() duplicatetransient float				PauseDuration;
var() const editconst bool					bHasDoorLOS;
/** If this node is on a wall and connected to a ceiling node, then auto adjust those node's height if too low */
var() bool									bAutoAdjustZToCeiling;
var class<ReachSpec>						WallReachSpecClass;
var bool									bAutoFlushPersistentDebugLines;
/** If checked, this pathnode will not be considered by the trader trail emitter */
var() bool 									bIgnoredByTraderTrail;

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

native function vector ComputeTrajectoryByTime( vector StartPosition, vector EndPosition, float EndTime );

/** Returns this node's "up" direction, or 0 if using default floor. GetUpDir() isn't native and
	this allows script to call it.  As an example, "Up" for KFWallPathnodes is: -(Rotation.Vector()) */
native function vector GetUpVector();

native function bool IsUsableAnchorFor( Pawn P );

/** Returns the nearest valid navigation on the floor to the given actor */
static final function NavigationPoint GetNearestFloorNavToActor(Actor ChkActor, optional class<NavigationPoint> RequiredClass,optional array<NavigationPoint> ExcludeList,optional float MinDist)
{
	local NavigationPoint Nav, BestNav;
	local float			  Dist, BestDist;

	if( ChkActor != None )
	{
		// iterate through all points in the level
		foreach ChkActor.WorldInfo.AllNavigationPoints( class'NavigationPoint', Nav )
		{
			if( Nav.bWallNode )
			{
				continue;
			}

			// if no filter class specified, and
			// if nav is available to the check actor, and
			// if the nav isn't part of the excluded list,
			if ( (RequiredClass == None || Nav.class == RequiredClass) && ExcludeList.Find(Nav) == INDEX_NONE )
			{
				// pick the closest
				Dist = VSize( Nav.Location-ChkActor.Location );
				if( Dist > MinDist )
				{
					if( BestNav == None || Dist < BestDist )
					{
						BestNav = Nav;
						BestDist = Dist;
					}
				}
			}
		}
	}
	return BestNav;
}

/** Returns the nearest valid navigation on the floor to the given actor within a certain radius */
static final function NavigationPoint GetNearestValidFloorNavWithinRadiusToPawn(Pawn ChkPawn, float MinDist, optional class<NavigationPoint> RequiredClass,optional array<NavigationPoint> ExcludeList)
{
	local NavigationPoint BestNav;
	local float			  Dist, BestDist;
	local array<NavigationPoint> ValidNavs;
	local Cylinder PawnCylinder;
	local int i;

	if( ChkPawn != None )
	{

        PawnCylinder.Radius = ChkPawn.GetCollisionRadius();
        PawnCylinder.Height = ChkPawn.GetCollisionHeight();

        GetAllNavInRadius( ChkPawn, ChkPawn.Location, MinDist, ValidNavs, true,, PawnCylinder );


        for( i = 0; i < ValidNavs.Length; i++ )
		{
			if( ValidNavs[i].bWallNode )
			{
				continue;
			}

            if( !ValidNavs[i].IsUsableAnchorFor( ChkPawn ) )
            {
                continue;
            }
			// if no filter class specified, and
			// if nav is available to the check actor, and
			// if the nav isn't part of the excluded list,
			if ( (RequiredClass == None || ValidNavs[i].class == RequiredClass) && ExcludeList.Find(ValidNavs[i]) == INDEX_NONE )
			{
				// pick the closest
				Dist = VSize( ValidNavs[i].Location-ChkPawn.Location );
				if( Dist > MinDist )
				{
					if( BestNav == None || Dist < BestDist )
					{
						BestNav = ValidNavs[i];
						BestDist = Dist;
					}
				}
			}
		}
	}
	return BestNav;
}


event NotifyReachedBy( Pawn P )
{
	if( P.Controller != none && KFAIController(P.Controller) != none )
	{
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && KFAIController(P.Controller)!= None ) { KFAIController(P.Controller).AILog_Internal(GetFuncName()$" by "$P,'PathWarning'); };
	}
}

simulated event string GetDebugAbbrev()
{
	return "KFPN";
}

simulated function DrawDebugInfo( HUD HUD )
{
	local KFDebugLines KFDL;
	local int i;

	KFDL = class'KFDebugLines'.static.GetDebugLines();

	if( KFDL != none )
	{
		for( i = 0; i < PathList.Length; i++ )
		{
			KFDL.AddDebugLine( Location, PathList[i].GetEnd().Location, 0, 100, 150, true,, name, i );
			KFDL.AddDebugText3D( (Location + PathList[i].GetEnd().Location) * 0.5f, string(PathList[i]), true, 50, 100, 150, true,,,, name, i );
		}
	}
}

defaultproperties
{
   bAutoConnectToOtherFloors=True
   JumpTime=0.450000
   WallReachSpecClass=Class'KFGame.FloorToWallReachSpec'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PathNode:Sprite'
      Sprite=Texture2D'EditorResources.S_Pickup'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__PathNode:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__PathNode:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__PathNode:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__PathNode:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__PathNode:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__PathNode:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__PathNode:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__KFPathnode"
   ObjectArchetype=PathNode'Engine.Default__PathNode'
}
