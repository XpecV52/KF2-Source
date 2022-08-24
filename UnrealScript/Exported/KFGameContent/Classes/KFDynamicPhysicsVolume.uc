//=============================================================================
// KFDynamicPhysicsVolume
//=============================================================================
// Replacement for DynamicPhysicsVolume extended from our KFPhysicsVolume.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================
class KFDynamicPhysicsVolume extends KFPhysicsVolume
    showcategories(Movement)
    placeable;

/** Is the volume enabled by default? */
var() bool bEnabled;

/**
* Overriden to set the default collision state.
*/
simulated event PostBeginPlay()
{
    Super.PostBeginPlay();

    SetCollision(bEnabled, bBlockActors);
}

defaultproperties
{
   bEnabled=True
   BrushColor=(B=255,G=255,R=100,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'kfgamecontent.Default__KFPhysicsVolume:BrushComponent0'
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
      ObjectArchetype=BrushComponent'kfgamecontent.Default__KFPhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   Physics=PHYS_Interpolating
   bStatic=False
   CollisionComponent=BrushComponent0
   Name="Default__KFDynamicPhysicsVolume"
   ObjectArchetype=KFPhysicsVolume'kfgamecontent.Default__KFPhysicsVolume'
}
