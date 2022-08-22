//=============================================================================
// KFPawnBlockingVolume
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawnBlockingVolume extends BlockingVolume
	native(Pawn)
	placeable;

/** whether to block PCs */
var() bool bBlockPlayers<DisplayName=Block Human Players>;
/** whether to block PC controlled zeds (team == 255) */
var() bool bBlockZedPlayers;

/** whether to block NPCs */
var() bool bBlockMonsters<DisplayName=Block AI>;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   bBlockPlayers=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_BlockingVolume
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFPawnBlockingVolume"
   ObjectArchetype=BlockingVolume'Engine.Default__BlockingVolume'
}
