//=============================================================================
// KFWireConnector
//=============================================================================
// Beam emitter wire system along with KFWireStart
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//============================================================================
class KFWireConnector extends Emitter
	notplaceable
	native(Effect);

/** Beam tangent at source and target locations.  Typically one is negative of other */
var() vector StartTangent;
var() vector EndTangent;

// @todo: SetBeamTessellationFactor() is missing implementation!
var float TessellationFactor;

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

/** One-time init */
native function ApplyBeamProperties();

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// If Super didn't sentence us to death
	if ( !bTickIsDisabled )
	{
		ApplyBeamProperties();

		// Frame delay. After the PSC has been updated once we're 
		// basically static geometry and can stop ticking
		SetTimer(0.01f, false);
	}
}

// Disable tick after one frame
simulated function Timer()
{
	SetTickIsDisabled(true);
}

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
      Template=ParticleSystem'FX_Environmental_EMIT_TWO.FX_Cable_beam_01'
      InstanceParameters(0)=(Name="WireStart",ParamType=PSPT_Actor)
      InstanceParameters(1)=(Name="WireEnd",ParamType=PSPT_Actor)
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Emitter:Sprite'
      Sprite=Texture2D'FX_Environmental_TEX.WireTool.KF_WireTool_Icon'
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
   CollisionType=COLLIDE_CustomDefault
   Name="Default__KFWireConnector"
   ObjectArchetype=Emitter'Engine.Default__Emitter'
}
