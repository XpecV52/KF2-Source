// NVCHANGE_BEGIN: TSC -  adding module for spawning force fields
/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleForceFieldRadial extends ParticleModuleForceFieldBase;


// NVCHANGE_END: TSC -  adding module for spawning force fields

defaultproperties
{
   Begin Object Class=NxForceFieldRadialComponent Name=FF
      Begin Object Class=ForceFieldShapeSphere Name=Shape0 Archetype=ForceFieldShapeSphere'Engine.Default__NxForceFieldRadialComponent:Shape0'
         Begin Object Class=DrawSphereComponent Name=DrawSphere0 ObjName=DrawSphere0 Archetype=DrawSphereComponent'Engine.Default__NxForceFieldRadialComponent:Shape0.DrawSphere0'
            SphereRadius=200.000000
            ReplacementPrimitive=None
            Name="DrawSphere0"
            ObjectArchetype=DrawSphereComponent'DrawSphere0'
         End Object
         Shape=DrawSphereComponent'Engine.Default__ParticleModuleForceFieldRadial:FF.Shape0.DrawSphere0'
         Name="Shape0"
         ObjectArchetype=ForceFieldShapeSphere'Engine.Default__NxForceFieldRadialComponent:Shape0'
      End Object
      Shape=ForceFieldShapeSphere'Engine.Default__ParticleModuleForceFieldRadial:FF.Shape0'
      Duration=0.500000
      ReplacementPrimitive=None
      Name="FF"
      ObjectArchetype=NxForceFieldRadialComponent'Engine.Default__NxForceFieldRadialComponent'
   End Object
   ForceField=FF
   Name="Default__ParticleModuleForceFieldRadial"
   ObjectArchetype=ParticleModuleForceFieldBase'Engine.Default__ParticleModuleForceFieldBase'
}
