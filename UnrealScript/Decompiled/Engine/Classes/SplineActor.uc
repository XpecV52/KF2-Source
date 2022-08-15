/*******************************************************************************
 * SplineActor generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SplineActor extends Actor
    native(Spline)
    placeable
    hidecategories(Navigation);

struct native SplineConnection
{
    /** Component that stores actual spline points, tangents, reparam table etc */
    var() export editinline SplineComponent SplineComponent;
    /** Which SplineActor this one connects to - spline is between these locations */
    var() SplineActor ConnectTo;

    structdefaultproperties
    {
        SplineComponent=none
        ConnectTo=none
    }
};

var array<SplineConnection> Connections;
/** Tangent of spline at this actor - this is in local space */
var() interp Vector SplineActorTangent;
/** Color to use to draw the splines */
var() Color SplineColor;
/** Splines connectin to this SplineActor will be marked as bSplineDisabled */
var() bool bDisableDestination;
var transient bool bAlreadyVisited;
var array<SplineActor> LinksFrom;
var transient SplineActor nextOrdered;
var transient SplineActor prevOrdered;
var transient SplineActor previousPath;
var transient int bestPathWeight;
var transient int visitedWeight;
/** For actors using this spline, how quickly to move along the spline over time */
var() editinline InterpCurveFloat SplineVelocityOverTime;

// Export USplineActor::execGetWorldSpaceTangent(FFrame&, void* const)
native function Vector GetWorldSpaceTangent();

// Export USplineActor::execUpdateSplineComponents(FFrame&, void* const)
native function UpdateSplineComponents();

// Export USplineActor::execUpdateConnectedSplineComponents(FFrame&, void* const)
native function UpdateConnectedSplineComponents(bool bFinish);

// Export USplineActor::execAddConnectionTo(FFrame&, void* const)
native function AddConnectionTo(SplineActor NextActor);

// Export USplineActor::execIsConnectedTo(FFrame&, void* const)
native function bool IsConnectedTo(SplineActor NextActor, bool bCheckForDisableDestination);

// Export USplineActor::execFindSplineComponentTo(FFrame&, void* const)
native function SplineComponent FindSplineComponentTo(SplineActor NextActor);

// Export USplineActor::execFindTargetForComponent(FFrame&, void* const)
native function SplineActor FindTargetForComponent(SplineComponent SplineComp);

// Export USplineActor::execBreakConnectionTo(FFrame&, void* const)
native function BreakConnectionTo(SplineActor NextActor);

// Export USplineActor::execBreakAllConnections(FFrame&, void* const)
native function BreakAllConnections();

// Export USplineActor::execBreakAllConnectionsFrom(FFrame&, void* const)
native function BreakAllConnectionsFrom();

// Export USplineActor::execGetRandomConnection(FFrame&, void* const)
native function SplineActor GetRandomConnection(optional bool bUseLinksFrom);

// Export USplineActor::execGetBestConnectionInDirection(FFrame&, void* const)
native function SplineActor GetBestConnectionInDirection(Vector DesiredDir, optional bool bUseLinksFrom);

// Export USplineActor::execFindSplinePathTo(FFrame&, void* const)
native function bool FindSplinePathTo(SplineActor Goal, out array<SplineActor> OutRoute);

// Export USplineActor::execGetAllConnectedSplineActors(FFrame&, void* const)
native function GetAllConnectedSplineActors(out array<SplineActor> OutSet);

function OnToggle(SeqAct_Toggle inAction)
{
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bDisableDestination = false;        
    }
    else
    {
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bDisableDestination = true;            
        }
        else
        {
            bDisableDestination = !bDisableDestination;
        }
    }
    UpdateConnectedSplineComponents(true);
}

simulated function OnToggleHidden(SeqAct_ToggleHidden Action)
{
    super.OnToggleHidden(Action);
    UpdateConnectedSplineComponents(true);
}

defaultproperties
{
    SplineActorTangent=(X=300,Y=0,Z=0)
    SplineColor=(B=255,G=0,R=255,A=255)
    begin object name=Sprite class=SpriteComponent
        Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Spline'
        SpriteCategoryName=Splines
        ReplacementPrimitive=none
        HiddenGame=true
        AlwaysLoadOnClient=false
        AlwaysLoadOnServer=false
        Scale=0.5
    object end
    // Reference: SpriteComponent'Default__SplineActor.Sprite'
    Components(0)=Sprite
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}