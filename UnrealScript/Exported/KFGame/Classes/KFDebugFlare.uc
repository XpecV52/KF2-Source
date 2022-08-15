//=============================================================================
// Debug_Flare
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDebugFlare extends Actor;

var PointLightComponent FlareLight;

defaultproperties
{
   Begin Object Class=PointLightComponent Name=FlareLightComponent
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="FlareLightComponent"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   FlareLight=FlareLightComponent
   Components(0)=FlareLightComponent
   Begin Object Class=StaticMeshComponent Name=FlareMesh
      StaticMesh=StaticMesh'EditorMeshes.TexPropSphere'
      ReplacementPrimitive=None
      CastShadow=False
      Scale=0.100000
      Name="FlareMesh"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(1)=FlareMesh
   Begin Object Class=CylinderComponent Name=Cylinder
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="Cylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(2)=Cylinder
   Physics=PHYS_Falling
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=True
   bCollideWorld=True
   CollisionComponent=Cylinder
   Name="Default__KFDebugFlare"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
