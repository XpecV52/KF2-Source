//=============================================================================
// KFSFXVolume
//=============================================================================
// A placeable volume that plays sounds at random location within it at random 
// intervals
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================

class KFSFXVolume extends Volume
	placeable
	dontsortcategories(ReverbVolume)
	hidecategories(Advanced, Attachment, Collision, Volume, Toggle, Mobile, Physics, Debug );

// Minimum amount of time to pass before playing next sfx event
var() float MinInterval<ClampMin=0>;
// Maximum amount of time to pass before playing next sfx event
var() float MaxInterval<ClampMin=0>;
// List of possible sfx events to play (chosen from randomly)
var() array<AkEvent> SFXEvents;

simulated event PostBeginPlay()
{
	if( SFXEvents.Length == 0 )
	{
		LogInternal("*** "$self$" does not have any SFXEvents!");
		return;
	}

	if( MaxInterval < MinInterval )
	{
		MaxInterval = MinInterval;
	}

	// volumes are static and don't tick, so set timer on a local player controller
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		WorldInfo.GetALocalPlayerController().SetTimer( GetRandomInterval(), false, nameof(PlaySFX), self );
	}
}

// Picks random position and event and plays event at position
simulated function PlaySFX()
{
	local int SFXIdx;
	local AkEvent SFXEvent;
	local vector SFXLocation, RandVect, BoxExtent;

	SFXIdx = Rand( SFXEvents.Length );
	SFXEvent = SFXEvents[ SFXIdx ];

	RandVect = VRand();
	BoxExtent = BrushComponent.Bounds.BoxExtent;
	SFXLocation = BrushComponent.Bounds.Origin;
	SFXLocation.X += RandVect.X * BoxExtent.X;
	SFXLocation.Y += RandVect.Y * BoxExtent.Y;
	SFXLocation.Z += RandVect.Z * BoxExtent.Z;
	PlayAkEvent( SFXEvent, true,,, SFXLocation );

	// volumes are static and don't tick, so set timer on GRI
	WorldInfo.GetALocalPlayerController().SetTimer( GetRandomInterval(), false, nameof(PlaySFX), self );
}

// Returns random interval between min and max
simulated function float GetRandomInterval()
{
	return MinInterval + Rand(MaxInterval-MinInterval);
}

defaultproperties
{
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
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__KFSFXVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
