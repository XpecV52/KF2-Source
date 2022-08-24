//=============================================================================
// Emitter actor class.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Emitter extends Actor
	native
	placeable;

var()	editconst const	ParticleSystemComponent ParticleSystemComponent;
var()	editconst const DynamicLightEnvironmentComponent LightEnvironment;
var						bool					bDestroyOnSystemFinish;

var()					bool					bPostUpdateTickGroup;

/** used to update status of toggleable level placed emitters on clients */
var repnotify bool bCurrentlyActive;


/** Allows particle emitters to omit depth testing (by setting to false) */
var transient bool bDepthTestEnabled;
/** Allow this emitter to be rendered in the depth pass and be used as an occluder */
var(Rendering) const bool bUseAsOccluder;


struct CheckpointRecord
{
	var bool bIsActive;
};

replication
{
	if (bNoDelete)
		bCurrentlyActive;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native noexport event SetTemplate(ParticleSystem NewTemplate, optional bool bDestroyOnFinish);

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// Let them die quickly on a dedicated server
 	if (WorldInfo.NetMode == NM_DedicatedServer && (RemoteRole == ROLE_None || bNetTemporary))
 	{
 		LifeSpan = 0.2;

		// Lifespan won't do us much good for NoDelete actors!
		if ( bNoDelete )
		{
			SetTickIsDisabled(true);
		}

 	}

	// Set Notification Delegate
	if (ParticleSystemComponent != None)
	{
		ParticleSystemComponent.OnSystemFinished = OnParticleSystemFinished;
		bCurrentlyActive = ParticleSystemComponent.bAutoActivate;


		// Allow certain emitters to be rendered in the depth pass and be used as occluders
		ParticleSystemComponent.bUseAsOccluder = bUseAsOccluder;
		ReattachComponent(ParticleSystemComponent);

	}
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bCurrentlyActive')
	{
		ParticleSystemComponent.SetActive(bCurrentlyActive);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated function OnParticleSystemFinished(ParticleSystemComponent FinishedComponent)
{
	if (bDestroyOnSystemFinish)
	{
		Lifespan = 0.0001f;
	}
	bCurrentlyActive = false;
}

/**
 * Handling Toggle event from Kismet.
 */
function OnToggle(SeqAct_Toggle action)
{
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
	ParticleSystemComponent.LastRenderTime = WorldInfo.TimeSeconds;
	ForceNetRelevant();

	if (RemoteRole != ROLE_None)
	{
		// force replicate flag if necessary
		SetForcedInitialReplicatedProperty(Property'Engine.Emitter.bCurrentlyActive', (bCurrentlyActive == default.bCurrentlyActive));
	}
}

/**
 * Handling ParticleEventGenerator event from Kismet.
 * - Does nothing... just here to stop Kismet from complaining
 */
function OnParticleEventGenerator(SeqAct_ParticleEventGenerator action)
{
}

simulated function ShutDown()
{
	Super.ShutDown();

	bCurrentlyActive = false;
}

simulated function SetFloatParameter(name ParameterName, float Param)
{
	if (ParticleSystemComponent != none)
		ParticleSystemComponent.SetFloatParameter(ParameterName, Param);
	else
		LogInternal("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
}

simulated function SetVectorParameter(name ParameterName, vector Param)
{
	if (ParticleSystemComponent != none)
		ParticleSystemComponent.SetVectorParameter(ParameterName, Param);
	else
		LogInternal("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
}

simulated function SetColorParameter(name ParameterName, color Param)
{
	if (ParticleSystemComponent != none)
		ParticleSystemComponent.SetColorParameter(ParameterName, Param);
	else
		LogInternal("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
}

simulated function SetExtColorParameter(name ParameterName, byte Red, byte Green, byte Blue, byte Alpha)
{
	local color c;

	if (ParticleSystemComponent != none)
	{
		c.r = Red;
		c.g = Green;
		c.b = Blue;
		c.a = Alpha;
		ParticleSystemComponent.SetColorParameter(ParameterName, C);
	}
	else
		LogInternal("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
}


simulated function SetActorParameter(name ParameterName, actor Param)
{
	if (ParticleSystemComponent != none)
		ParticleSystemComponent.SetActorParameter(ParameterName, Param);
	else
		LogInternal("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
}

/**
 * Kismet handler for setting particle instance parameters.
 */
simulated function OnSetParticleSysParam(SeqAct_SetParticleSysParam Action)
{
	local int Idx, ParamIdx;
	if (ParticleSystemComponent != None &&
		Action.InstanceParameters.Length > 0)
	{
		for (Idx = 0; Idx < Action.InstanceParameters.Length; Idx++)
		{
			if (Action.InstanceParameters[Idx].ParamType != PSPT_None)
			{
				// look for an existing entry
				ParamIdx = ParticleSystemComponent.InstanceParameters.Find('Name',Action.InstanceParameters[Idx].Name);
				// create one if necessary
				if (ParamIdx == -1)
				{
					ParamIdx = ParticleSystemComponent.InstanceParameters.Length;
					ParticleSystemComponent.InstanceParameters.Length = ParamIdx + 1;
				}
				// update the instance parm
				ParticleSystemComponent.InstanceParameters[ParamIdx] = Action.InstanceParameters[Idx];
				if (Action.bOverrideScalar)
				{
					ParticleSystemComponent.InstanceParameters[ParamIdx].Scalar = Action.ScalarValue;
				}
			}
		}
	}
}

function bool ShouldSaveForCheckpoint()
{
	return (bNoDelete && RemoteRole != ROLE_None);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bIsActive = bCurrentlyActive;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	bCurrentlyActive = Record.bIsActive;
	if (bCurrentlyActive)
	{
		ParticleSystemComponent.ActivateSystem();
	}
	else
	{
		ParticleSystemComponent.DeactivateSystem();
	}
	ForceNetRelevant();
}

/** Function used to have the emitter hide itself and put itself into stasis **/
simulated function HideSelf();

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      SpriteCategoryName="Effects"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(2)=ArrowComponent0
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   bHardAttach=True
   bGameRelevant=True
   bEdShouldSnap=True
   SupportedEvents(6)=Class'Engine.SeqEvent_ParticleEvent'
   Name="Default__Emitter"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
