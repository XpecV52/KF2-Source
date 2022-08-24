//=============================================================================
// KFEmit_ObjectivePath
//=============================================================================
// Scripted path for leading players to map objectives.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//============================================================================
class KFEmit_ObjectivePath extends KFEmit_ScriptedPath;

defaultproperties
{
   EmitterTemplate=ParticleSystem'FX_Gameplay_EMIT.FX_Objective_Trail'
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'KFGame.Default__KFEmit_ScriptedPath:ParticleSystemComponent0'
      bOverrideLODMethod=True
      SecondsBeforeInactive=0.000000
      LODMethod=PARTICLESYSTEMLODMETHOD_DirectSet
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFEmit_ScriptedPath:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   Name="Default__KFEmit_ObjectivePath"
   ObjectArchetype=KFEmit_ScriptedPath'KFGame.Default__KFEmit_ScriptedPath'
}
