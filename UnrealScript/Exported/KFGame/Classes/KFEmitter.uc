//=============================================================================
// KFEmitter
//=============================================================================
// Custom placeable emitter class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFEmitter extends Emitter
	placeable;

/** If set, will toggle the emitter clientside instead of replicating */
var() bool bClientsideKismetToggle;

/**
 * Handling Toggle event from Kismet.
 */
simulated function OnToggle(SeqAct_Toggle action)
{
	if ( !bClientsideKismetToggle )
	{
		Super.OnToggle(Action);
		return;
	}

	// Turn ON
	if (action.InputLinks[0].bHasImpulse)
	{
		ParticleSystemComponent.ActivateSystem();
		bCurrentlyActive = TRUE;
	}
	// Turn OFF
	else if (action.InputLinks[1].bHasImpulse)
	{
		ParticleSystemComponent.DeactivateSystem();
		bCurrentlyActive = FALSE;
	}
	// Toggle
	else if (action.InputLinks[2].bHasImpulse)
	{
		// If spawning is suppressed or we aren't turned on at all, activate.
		if (ParticleSystemComponent.bSuppressSpawning || !bCurrentlyActive)
		{
			ParticleSystemComponent.ActivateSystem();
			bCurrentlyActive = TRUE;
		}
		else
		{
			ParticleSystemComponent.DeactivateSystem();
			bCurrentlyActive = FALSE;
		}
	}
}

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Emitter:Sprite'
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Emitter:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   Name="Default__KFEmitter"
   ObjectArchetype=Emitter'Engine.Default__Emitter'
}
