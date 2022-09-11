//=============================================================================
// KFWeapAttach_ArcGenerator
//=============================================================================
// A custom 3rd person weapon template for the ArcGenerator
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFWeapAttach_ArcGenerator extends KFWeapAttach_SprayBase;

simulated function ChangeMaterial()
{
	if( BarrelHeat != LastBarrelHeat )
	{
	    WeaponMIC.SetScalarParameterValue('Glow_Intensity', 1);
	}
}

defaultproperties
{
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:PilotLight0'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   Begin Object Class=ParticleSystemComponent Name=FlameEndSpray0 Archetype=ParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   Name="Default__KFWeapAttach_ArcGenerator"
   ObjectArchetype=KFWeapAttach_SprayBase'KFGame.Default__KFWeapAttach_SprayBase'
}
