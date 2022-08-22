//=============================================================================
// KFVersusNoTakeoverVolume
//=============================================================================
// Volume which prevents zeds from being taken over while inside it.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFVersusNoTakeoverVolume extends Volume
	placeable;

defaultproperties
{
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
   Name="Default__KFVersusNoTakeoverVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
