//=============================================================================
// KFWeapAttach_Flamethrower
//=============================================================================
// Custom weapon attachment for the third person flamethrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeapAttach_Flamethrower extends KFWeapAttach_SprayBase;

/** Effect for the pilot light. */
var() protected KFParticleSystemComponent	PSC_SpineLights[4];
/** Socket to attach the pilot light to. */
var() name SpineLightSocketNames[4];

simulated protected function TurnOnPilot()
{
    local int i;

	if (bPilotLightOn)
		return;

    // Attach and start up the pilot lights
    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		WeapMesh.AttachComponentToSocket( PSC_SpineLights[i], SpineLightSocketNames[i] );

    		PSC_SpineLights[i].ActivateSystem();

    		// Turn on the low flame, turn off the high flame
    		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 1.0);
    		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 0.0);
    	}
	}

    super.TurnOnPilot();
}

simulated protected function TurnOffPilot()
{
    local int i;

    Super.TurnOffPilot();

    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		PSC_SpineLights[i].DeActivateSystem();
    	}
	}
}

simulated protected function TurnOnFireSpray()
{
    local int i;

	if (!bFireSpraying)
	{
        // Start up the pilot lights on top
        for (i = 0; i < 4; i++)
        {
        	if( PSC_SpineLights[i] != None )
        	{
        		// Turn off the low flame, turn on the high flame
        		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 0.0);
        		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 1.0);
        	}
    	}
	}

	Super.TurnOnFireSpray();
}

simulated protected function TurnOffFireSpray()
{
    local int i;

    for (i = 0; i < 4; i++)
    {
    	if( PSC_SpineLights[i] != None )
    	{
    		// Turn on the low flame, turn off the high flame
    		PSC_SpineLights[i].SetFloatParameter('Pilotlow', 1.0);
    		PSC_SpineLights[i].SetFloatParameter('Pilothigh', 0.0);
    	}
	}

	Super.TurnOffFireSpray();
}

defaultproperties
{
   Begin Object Class=KFParticleSystemComponent Name=SpineLight0
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="SpineLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(0)=SpineLight0
   Begin Object Class=KFParticleSystemComponent Name=SpineLight1
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="SpineLight1"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(1)=SpineLight1
   Begin Object Class=KFParticleSystemComponent Name=SpineLight2
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="SpineLight2"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(2)=SpineLight2
   Begin Object Class=KFParticleSystemComponent Name=SpineLight3
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="SpineLight3"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFParticleSystemComponent'
   End Object
   PSC_SpineLights(3)=SpineLight3
   SpineLightSocketNames(0)="FXPilot2"
   SpineLightSocketNames(1)="FXPilot3"
   SpineLightSocketNames(2)="FXPilot4"
   SpineLightSocketNames(3)="FXPilot5"
   FlameSprayArchetype=SprayActor_Flame'WEP_Flamethrower_ARCH.WEP_Flamethrower_Flame'
   PilotLightPlayEvent=AkEvent'WW_WEP_SA_Flamethrower.Play_WEP_SA_Flamethrower_PilotLight_Loop'
   PilotLightStopEvent=AkEvent'WW_WEP_SA_Flamethrower.Stop_WEP_SA_Flamethrower_PilotLight_Loop'
   Begin Object Class=KFParticleSystemComponent Name=PilotLight0 Archetype=KFParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:PilotLight0'
      Template=ParticleSystem'WEP_Flamethrower_EMIT.FX_pilot_light_01'
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="PilotLight0"
      ObjectArchetype=KFParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:PilotLight0'
   End Object
   PSC_PilotLight=PilotLight0
   PilotLightSocketName="FXPilot1"
   Begin Object Class=ParticleSystemComponent Name=FlameEndSpray0 Archetype=ParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:FlameEndSpray0'
      bAutoActivate=False
      ReplacementPrimitive=None
      TickGroup=TG_PostUpdateWork
      Name="FlameEndSpray0"
      ObjectArchetype=ParticleSystemComponent'KFGame.Default__KFWeapAttach_SprayBase:FlameEndSpray0'
   End Object
   PSC_EndSpray=FlameEndSpray0
   PilotLights(0)=(Light=PilotPointLight0,LightAttachBone="LightPilot1",FlickerIntensity=1.500000,FlickerInterpSpeed=0.500000)
   PilotLights(1)=(Light=PilotPointLight1,LightAttachBone="LightPilot2",FlickerIntensity=4.000000,FlickerInterpSpeed=3.000000)
   Name="Default__KFWeapAttach_Flamethrower"
   ObjectArchetype=KFWeapAttach_SprayBase'KFGame.Default__KFWeapAttach_SprayBase'
}
