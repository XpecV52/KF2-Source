class KFEmit_ScriptedPath extends KFEmit_TraderPath;

simulated function bool ShouldStopPathing()
{
	return false;
}

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'KFGame.Default__KFEmit_TraderPath:ParticleSystemComponent0'
      bOverrideLODMethod=True
      SecondsBeforeInactive=0.000000
      LODMethod=PARTICLESYSTEMLODMETHOD_DirectSet
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFEmit_TraderPath:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Components(0)=ParticleSystemComponent0
   Name="Default__KFEmit_ScriptedPath"
   ObjectArchetype=KFEmit_TraderPath'KFGame.Default__KFEmit_TraderPath'
}
