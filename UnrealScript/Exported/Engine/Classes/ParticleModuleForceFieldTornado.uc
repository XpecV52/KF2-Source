// NVCHANGE_BEGIN: TSC -  adding module for spawning force fields
/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleForceFieldTornado extends ParticleModuleForceFieldBase;


// NVCHANGE_END: TSC -  adding module for spawning force fields

defaultproperties
{
   Begin Object Class=NxForceFieldTornadoComponent Name=FF
      Begin Object Class=ForceFieldShapeCapsule Name=Shape0 Archetype=ForceFieldShapeCapsule'Engine.Default__NxForceFieldTornadoComponent:Shape0'
         Begin Object Class=DrawCapsuleComponent Name=DrawCapsule0 ObjName=DrawCapsule0 Archetype=DrawCapsuleComponent'Engine.Default__NxForceFieldTornadoComponent:Shape0.DrawCapsule0'
            ReplacementPrimitive=None
            Rotation=(Pitch=0,Yaw=0,Roll=16384)
            Name="DrawCapsule0"
            ObjectArchetype=DrawCapsuleComponent'DrawCapsule0'
         End Object
         Shape=DrawCapsuleComponent'Engine.Default__ParticleModuleForceFieldTornado:FF.Shape0.DrawCapsule0'
         Name="Shape0"
         ObjectArchetype=ForceFieldShapeCapsule'Engine.Default__NxForceFieldTornadoComponent:Shape0'
      End Object
      Shape=ForceFieldShapeCapsule'Engine.Default__ParticleModuleForceFieldTornado:FF.Shape0'
      Duration=0.500000
      ReplacementPrimitive=None
      Name="FF"
      ObjectArchetype=NxForceFieldTornadoComponent'Engine.Default__NxForceFieldTornadoComponent'
   End Object
   ForceField=FF
   Name="Default__ParticleModuleForceFieldTornado"
   ObjectArchetype=ParticleModuleForceFieldBase'Engine.Default__ParticleModuleForceFieldBase'
}
