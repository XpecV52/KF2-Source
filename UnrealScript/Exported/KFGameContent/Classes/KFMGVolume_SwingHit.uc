//=============================================================================
// KFMGVolume_SwingHit
//=============================================================================
// Volume for the swing minigame. Does some shenanigans above our normal
//      systems to throw both a ragdolled Zed, as well as human momentum.
//
// Note: Maintained class after rename/refactor to avoid needing to update
//      the Tragic Kingdom functionality.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================

class KFMGVolume_SwingHit extends KFVolume_RagdollThrow
    placeable;

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'kfgamecontent.Default__KFvolume_RagdollThrow:BrushComponent0'
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
      ObjectArchetype=BrushComponent'kfgamecontent.Default__KFvolume_RagdollThrow:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFMGVolume_SwingHit"
   ObjectArchetype=KFvolume_RagdollThrow'kfgamecontent.Default__KFvolume_RagdollThrow'
}
