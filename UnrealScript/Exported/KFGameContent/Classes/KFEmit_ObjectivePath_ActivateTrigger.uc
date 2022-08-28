//=============================================================================
// KFEmit_ObjectivePath_Weld
//=============================================================================
// Scripted path for leading players to map objectives.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//============================================================================
class KFEmit_ObjectivePath_ActivateTrigger extends KFEmit_ObjectivePath;

defaultproperties
{
   EmitterTemplate=ParticleSystem'FX_Gameplay_EMIT.FX_Objective_Trigger_Trail'
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'kfgamecontent.Default__KFEmit_ObjectivePath:ParticleSystemComponent0'
      bOverrideLODMethod=True
      SecondsBeforeInactive=0.000000
      LODMethod=PARTICLESYSTEMLODMETHOD_DirectSet
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'kfgamecontent.Default__KFEmit_ObjectivePath:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   Name="Default__KFEmit_ObjectivePath_ActivateTrigger"
   ObjectArchetype=KFEmit_ObjectivePath'kfgamecontent.Default__KFEmit_ObjectivePath'
}
