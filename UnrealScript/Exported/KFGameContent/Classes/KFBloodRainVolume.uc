//=============================================================================
// KFBloodRainVolume
//=============================================================================
// Volume that is used to simulate drops of blood rain hitting the ground
// (via the blood splatter map system)
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFBloodRainVolume extends Volume
	placeable;

// How many seconds should pass between blood splats
var() float Frequency<ClampMin=0.05>;
// How many blood splats to apply per frequency interval (limited by config: [KFGame.KFGoreManager] MaxPersistentSplatsPerFrame)
var() int SplatsPerInterval<ClampMin=1>;
// How much to scale the default blood splat size
var() float Scale<ClampMin=0.01>;
// How far below the volume to check for surfaces to splatter
var() float TraceLength<ClampMin=100>;

var transient box AABB;
var transient KFGoreManager GoreMan;

simulated event PostBeginPlay()
{
	// cache bounding box and goremanager
	if (BrushComponent != none)
	{
		AABB.Min = BrushComponent.Bounds.Origin - BrushComponent.Bounds.BoxExtent;
		AABB.Max = BrushComponent.Bounds.Origin + BrushComponent.Bounds.BoxExtent;
		GoreMan = KFGoreManager(WorldInfo.MyGoreEffectManager);
	}
}

simulated function AddSplatter()
{
	local vector V, D;
	local int SplatCount;

	D = AABB.Max - AABB.Min;
	V.Z = AABB.Min.Z + (D.Z / 2.0); // mid-z is safe

	while (SplatCount < SplatsPerInterval)
	{
		V.X = AABB.Min.X + D.X * FRand();
		V.Y = AABB.Min.Y + D.Y * FRand();

		while (!EncompassesPoint(V))
		{
			V.X = AABB.Min.X + D.X * FRand();
			V.Y = AABB.Min.Y + D.Y * FRand();
		}

		GoreMan.LeaveAPersistentBloodSplat(V, vect(0,0,-1), Scale,,, TraceLength);
		SplatCount++;
	}
}

simulated function SetActive(bool bActive)
{
	if (GoreMan == none)
	{
		WarnInternal("Cannot set "$self$" active - incomplete initialization");
		return;
	}

	if (bActive)
	{
		// allow volumes activated on the same frame to spread out their cadences
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(FRand() * 2.f, false, nameof(Timer_SetActive), self);
	}
	else
	{
		class'WorldInfo'.static.GetWorldInfo().TimerHelper.ClearTimer(nameof(AddSplatter), self);
	}
}

protected simulated function Timer_SetActive()
{
	class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(Frequency, true, nameof(AddSplatter), self);
}

defaultproperties
{
   Frequency=1.000000
   SplatsPerInterval=1
   Scale=1.000000
   TraceLength=10000.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_NoCollision
   bPushedByEncroachers=False
   bCanStepUpOn=False
   bReplicateMovement=False
   bMovable=False
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__KFBloodRainVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
