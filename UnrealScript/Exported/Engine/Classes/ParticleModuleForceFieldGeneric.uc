// NVCHANGE_BEGIN: TSC -  adding module for spawning force fields
/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleForceFieldGeneric extends ParticleModuleForceFieldBase;


// NVCHANGE_END: TSC -  adding module for spawning force fields

defaultproperties
{
   Begin Object Class=NxForceFieldGenericComponent Name=FF
      Begin Object Class=ForceFieldShapeBox Name=Shape0 Archetype=ForceFieldShapeBox'Engine.Default__NxForceFieldGenericComponent:Shape0'
         Begin Object Class=DrawBoxComponent Name=DrawBox0 ObjName=DrawBox0 Archetype=DrawBoxComponent'Engine.Default__NxForceFieldGenericComponent:Shape0.DrawBox0'
            ReplacementPrimitive=None
            Name="DrawBox0"
            ObjectArchetype=DrawBoxComponent'DrawBox0'
         End Object
         Shape=DrawBoxComponent'Engine.Default__ParticleModuleForceFieldGeneric:FF.Shape0.DrawBox0'
         Name="Shape0"
         ObjectArchetype=ForceFieldShapeBox'Engine.Default__NxForceFieldGenericComponent:Shape0'
      End Object
      Shape=ForceFieldShapeBox'Engine.Default__ParticleModuleForceFieldGeneric:FF.Shape0'
      Duration=0.500000
      ReplacementPrimitive=None
      Name="FF"
      ObjectArchetype=NxForceFieldGenericComponent'Engine.Default__NxForceFieldGenericComponent'
   End Object
   ForceField=FF
   Name="Default__ParticleModuleForceFieldGeneric"
   ObjectArchetype=ParticleModuleForceFieldBase'Engine.Default__ParticleModuleForceFieldBase'
}
