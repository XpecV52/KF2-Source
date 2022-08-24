//=============================================================================
// KFVolume_DamageAdjust
//=============================================================================
// Volume that can be used to modify the final value coming out of
//      KFPawn.AdjustDamage.  Default is 1.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFVolume_DamageAdjust extends Volume
    placeable;

/** Damage scalar for all sources to actors touching this volume */
var() float DamageScale;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    local KFPawn TouchPawn;
    
    TouchPawn = KFPawn(Other);
    if (TouchPawn != none)
    {
        TouchPawn.VolumeDamageScale = DamageScale;
    }
}

event Untouch(Actor Other)
{
    local KFPawn UntouchPawn;

    UntouchPawn = KFPawn(Other);
    if (UntouchPawn != none)
    {
        UntouchPawn.VolumeDamageScale = UntouchPawn.default.VolumeDamageScale;
    }
}

defaultproperties
{
   DamageScale=1.000000
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
   Name="Default__KFVolume_DamageAdjust"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
