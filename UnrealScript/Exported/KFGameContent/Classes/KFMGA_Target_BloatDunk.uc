//=============================================================================
// KFMGA_Target_BloatDunk
//=============================================================================
// Extension of target to handle specifics for bloat dunk, particularly for
//      modification of lights to show which one is active.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFMGA_Target_BloatDunk extends KFMGA_Target;

/** Point lights used to visualize on/off state of the target */
var() PointLightComponent OnLight;
var() PointLightComponent OffLight;

/** Additional static mesh component to swap to when in the on state */
var() StaticMeshComponent OnMesh;

function ValidHit(Controller EventInstigator, Actor HitActor)
{
    super.ValidHit(EventInstigator, HitActor);

    if (NumHits <= 0)
    {
        SetHidden(true);
    }    
}

simulated event Reset()
{
    super.Reset();
    SetHidden(false);
    SetInactive();
}

simulated event SetActive()
{
    bActiveTarget = true;
    
    //Green things on
    OnLight.SetEnabled(true);
    OnMesh.SetHidden(false);

    //Red things off
    OffLight.SetEnabled(false);
    Mesh.SetHidden(true);
}

simulated event SetInactive()
{
    bActiveTarget = false;
    if (IsAlive())
    {
        //Green things off
        OnLight.SetEnabled(false);
        OnMesh.SetHidden(true);

        //Red things on
        OffLight.SetEnabled(true);
        Mesh.SetHidden(false);
    }
    else
    {
        //Everything off
        OnLight.SetEnabled(false);
        OnMesh.SetHidden(true);

        OffLight.SetEnabled(false);
        Mesh.SetHidden(true);
    }
}

defaultproperties
{
   Begin Object Class=PointLightComponent Name=PointLight0
      Name="PointLight0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   OnLight=PointLight0
   Begin Object Class=PointLightComponent Name=PointLight1
      Name="PointLight1"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   OffLight=PointLight1
   Begin Object Class=StaticMeshComponent Name=Mesh1
      ReplacementPrimitive=None
      Name="Mesh1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   OnMesh=Mesh1
   Begin Object Class=StaticMeshComponent Name=Mesh0 Archetype=StaticMeshComponent'kfgamecontent.Default__KFMGA_Target:Mesh0'
      ReplacementPrimitive=None
      Name="Mesh0"
      ObjectArchetype=StaticMeshComponent'kfgamecontent.Default__KFMGA_Target:Mesh0'
   End Object
   Mesh=Mesh0
   Begin Object Class=CylinderComponent Name=Cylinder0 Archetype=CylinderComponent'kfgamecontent.Default__KFMGA_Target:Cylinder0'
      CollisionHeight=25.000000
      CollisionRadius=25.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="Cylinder0"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFMGA_Target:Cylinder0'
   End Object
   CollisionCylinder=Cylinder0
   Begin Object Class=AkComponent Name=DeathSFX0 Archetype=AkComponent'kfgamecontent.Default__KFMGA_Target:DeathSFX0'
      Name="DeathSFX0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFMGA_Target:DeathSFX0'
   End Object
   DeathSFXComponent=DeathSFX0
   Components(0)=Cylinder0
   Components(1)=Mesh0
   Components(2)=DeathSFX0
   Components(3)=PointLight0
   Components(4)=PointLight1
   Components(5)=Mesh1
   CollisionComponent=Cylinder0
   Name="Default__KFMGA_Target_BloatDunk"
   ObjectArchetype=KFMGA_Target'kfgamecontent.Default__KFMGA_Target'
}
