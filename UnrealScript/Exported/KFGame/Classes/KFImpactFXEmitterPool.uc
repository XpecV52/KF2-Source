//=============================================================================
// KFImpactFXEmitterPool
//=============================================================================
// Separate pool for impact FX
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 7/6/2015
//=============================================================================

class KFImpactFXEmitterPool extends EmitterPool;

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__EmitterPool:ParticleSystemComponent0'
      SecondsBeforeInactive=0.000000
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__EmitterPool:ParticleSystemComponent0'
   End Object
   PSCTemplate=ParticleSystemComponent0
   MaxActiveEffects=60
   Name="Default__KFImpactFXEmitterPool"
   ObjectArchetype=EmitterPool'Engine.Default__EmitterPool'
}
