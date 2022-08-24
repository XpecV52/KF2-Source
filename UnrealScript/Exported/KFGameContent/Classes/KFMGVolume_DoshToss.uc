//=============================================================================
// KFMGVolume_DoshToss
//=============================================================================
// Volume to sit inside the dosh game bounds. On touch w/ an appropriate 
//      dropped pickup, the pickup will be flagged to run the rigid body sim on
//      client only.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGVolume_DoshToss extends Volume
    placeable;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    super.Touch(Other, OtherComp, HitLocation, HitNormal);

    if (Role == ROLE_Authority && KFDroppedPickup(Other) != none)
    {
        KFDroppedPickup(Other).DisableAuthorityRBSim();
    }
}

defaultproperties
{
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
   Name="Default__KFMGVolume_DoshToss"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
