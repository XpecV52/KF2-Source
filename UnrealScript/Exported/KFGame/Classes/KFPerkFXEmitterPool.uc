//=============================================================================
// KFPerkFXEmitterPool
//=============================================================================
// Separate pool for perk pawn effects
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Chris "schneidzekk" Schneider 8/1/2016
//=============================================================================

class KFPerkFXEmitterPool extends EmitterPool;

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
   MaxActiveEffects=1
   Name="Default__KFPerkFXEmitterPool"
   ObjectArchetype=EmitterPool'Engine.Default__EmitterPool'
}
