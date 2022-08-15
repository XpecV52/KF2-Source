//=============================================================================
// TWOutdoorLightingVolume
//=============================================================================
// Volume to section off outdoor areas. All objects placed within this volume
// will use the outdoor lighting channel, unless this functionality is overridden.
// Typical cases when this will be overridden is when you want an object to use
// both indoor or outdoor lighting channels.
// NOTE : Most of the functionality has been copied over from TWIndoorLightingVolume.
// It would be nice to not have this code duplication but I also don't want to invalidate
// the indoor volumes already placed in the maps.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 8/5/2014
//=============================================================================

class TWOutdoorLightingVolume extends Volume
	native(TW)
	placeable;

var const LightingChannelContainer	IndoorLightingChannel;
var const LightingChannelContainer	OutdoorLightingChannel;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local Pawn P;

	Super.Touch(Other,OtherComp,HitLocation,HitNormal);

    // Note: We're using Pawn instead of KFPawn because TWIndoorLightingVolume is part of
    // the engine package. Hence, we cannot access KFPawn. It needs to be part of engine
    // because it is required to tag primitives at light build time.
	P = Pawn(Other);
	if( P != none )
	{
	    P.LightingVolumeEnterCount++;
		P.SetMeshLightingChannels(OutdoorLightingChannel);
	}
}

simulated event UnTouch(Actor Other)
{
	local Pawn P;

	Super.UnTouch(Other);

    // Note: We're using Pawn instead of KFPawn because TWIndoorLightingVolume is part of
    // the engine package. Hence, we cannot access KFPawn. It needs to be part of engine
    // because it is required to tag primitives at light build time.
	P = Pawn(Other);
	if( P != none )
	{
	   	if ( P.LightingVolumeEnterCount > 0 )
		{
			P.LightingVolumeEnterCount--;
		}

        // Because the sequence of touch and untouch events are not reliable, keep
        // a counter to track whether the pawn is actually outside of the volume or not,
        // and switch channels only when it is not inside ANY indoor lighting volume
        if( P.LightingVolumeEnterCount == 0 )
        {
		    P.SetMeshLightingChannels(IndoorLightingChannel);
		}
	}
}

defaultproperties
{
   IndoorLightingChannel=(bInitialized=True,Indoor=True)
   OutdoorLightingChannel=(bInitialized=True,Outdoor=True)
   bPawnsOnly=True
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
   CollisionComponent=BrushComponent0
   Name="Default__TWOutdoorLightingVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
