//=============================================================================
// KFPhysicsVolume
//=============================================================================
// Replacement for PhysicsVolume that throttles touch/untouch events that occur
//      to the same actor in the same frame.  Implementation as a result of 
//      touch/untouch pairs happening due to pawn physics attempting to step up
//      on slope or when colliding with walls.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================
class KFPhysicsVolume extends PhysicsVolume
    placeable;

struct TouchThrottling
{
    var Actor HitActor;
    var float HitTime;
};
var array<TouchThrottling> RecentUntouchEvents;

var() float ThrottleTime;

function CausePainTo(Actor Other)
{
    local int RecentHitIdx;

    RecentHitIdx = RecentUntouchEvents.Find('HitActor', Other);

    //If this is a valid touch, call super and cause pain
    if (RecentHitIdx == INDEX_NONE || (WorldInfo.TimeSeconds - RecentUntouchEvents[RecentHitIdx].HitTime) > ThrottleTime)
    {
        super.CausePainTo(Other);
    }
}

simulated event UnTouch(Actor Other)
{
    local int RecentHitIdx;
    super.UnTouch(Other);

    RecentHitIdx = RecentUntouchEvents.Find('HitActor', Other);

    //Add new instance
    if (RecentHitIdx == INDEX_NONE)
    {
        RecentUntouchEvents.Insert(0, 1);
        RecentUntouchEvents[RecentUntouchEvents.Length - 1].HitActor = Other;
        RecentUntouchEvents[RecentUntouchEvents.Length - 1].HitTime = WorldInfo.TimeSeconds;
    }
    //Update old instance
    else
    {
        RecentUntouchEvents[RecentHitIdx].HitTime = WorldInfo.TimeSeconds;
    }
}

simulated event Tick(float DeltaTime)
{
    local int i;
    super.Tick(DeltaTime);

    for (i = RecentUntouchEvents.Length - 1; i >= 0; --i)
    {
        if ((WorldInfo.TimeSeconds - RecentUntouchEvents[i].HitTime) > ThrottleTime)
        {
            RecentUntouchEvents.Remove(i, 1);
        }
    }
}

defaultproperties
{
   ThrottleTime=0.010000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFPhysicsVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
