//=============================================================================
// KFVolume_DisableZedJump
//=============================================================================
// Volume for toggling off Zed jump capabilities.  Used to fix areas where we
//      want to force zeds to not be able to jump over obstacles in the event
//      they are straight lining.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================

class KFVolume_DisableZedJump extends Volume
    placeable;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    super.Touch(Other, OtherComp, HitLocation, HitNormal);

    if (KFPawn_Monster(Other) != None && !KFPawn_Monster(Other).bVersusZed)
    {
        KFPawn_Monster(Other).bCanJump = false;
    }
}

simulated event Untouch(Actor Other)
{
    super.untouch(Other);

    if (KFPawn_Monster(Other) != None && !KFPawn_Monster(Other).bVersusZed)
    {
        KFPawn_Monster(Other).bCanJump = true;
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
   Name="Default__KFVolume_DisableZedJump"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
