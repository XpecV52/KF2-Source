//=============================================================================
// KFWeapAttach_ShrinkRayGun
//=============================================================================
// Custom weapon attachment for the third person shrink ray gun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2022 Tripwire Interactive LLC
//=============================================================================
class KFWeapAttach_ShrinkRayGun extends KFWeapAttach_SprayBase;

simulated protected function TurnOffPilot()
{
	// Undo the invert of the pilot, so it does really deactivate

	bInvertPilot = false;

    Super.TurnOffPilot();

	bInvertPilot = true;
}

defaultproperties
{
   bInvertPilot=True
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
   PilotLights(0)=(Light=PilotPointLight0,LightAttachBone="MuzzleFlash",FlickerIntensity=25.000000,FlickerInterpSpeed=50.000000)
   PilotLights(1)=(Light=PilotPointLight1,LightAttachBone="MuzzleFlash",FlickerIntensity=4.000000,FlickerInterpSpeed=50.000000)
   Name="Default__KFWeapAttach_ShrinkRayGun"
   ObjectArchetype=KFWeapAttach_SprayBase'KFGame.Default__KFWeapAttach_SprayBase'
}
