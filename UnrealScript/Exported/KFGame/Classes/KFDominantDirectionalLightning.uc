//=============================================================================
// KFDominantDirectionalLightning
//=============================================================================
// A dominant directional light that represents lightning,
// whose animation can be triggered
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFDominantDirectionalLightning extends DominantDirectionalLight
	ClassGroup(Lights,DirectionalLights)
	placeable;

var repnotify int TriggerCount;

replication
{
	if (bNetDirty)
		TriggerCount;
}

event PostBeginPlay()
{
	super.PostBeginPlay();

	if (AnimationType != LightAnim_ChaoticFlicker)
	{
		WarnInternal(self$": forcing AnimationType to LightAnim_ChaoticFlicker!");
	}

	if (LightComponent != none)
	{
		LightComponent.AnimationType = LightAnim_None;
		LightComponent.SetLightProperties(LightComponent.MinBrightness);
	}
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(TriggerCount))
	{
		TriggerAnimation();
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated function TriggerAnimation()
{
	local float StartPct, StopPct, StartTime, StopTime, Duration, Pct, Time, DeltaTime;

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		// replicate event
		TriggerCount++;
	}
	else
	{
		// This math is mostly pulled from LightComponent::TickLightAnimation. The idea is to set
		// LightComponent.AnimationTimeOffset such that the actual animation part of the animation
		// plays right away.

		LightComponent.AnimationType = LightAnim_ChaoticFlicker;
		Duration = 1.f/FClamp(LightComponent.AnimationFrequency, 0.01f, 20.f);
		Time = WorldInfo.TimeSeconds % Duration;
		Pct = Time / Duration;

		DeltaTime = WorldInfo.DeltaSeconds;
		StartPct = WorldInfo.ChaoticFlickerCurve.Points[1].InVal - DeltaTime * 2.f;
		StopPct = WorldInfo.ChaoticFlickerCurve.Points[WorldInfo.ChaoticFlickerCurve.Points.Length - 1].InVal + DeltaTime * 2.f;

		LightComponent.AnimationTimeOffset = (StartPct - Pct) * Duration;

		StartTime = StartPct * Duration;
		StopTime = StopPct * Duration;
		Duration = StopTime - StartTime;

		class'WorldInfo'.static.GetWorldInfo().TimerHelper.SetTimer(Duration, false, nameof(Timer_CleanupAnimation), self);
	}
}

function Timer_CleanupAnimation()
{
	CleanupAnimation();
}

simulated function CleanupAnimation()
{
	LightComponent.AnimationType = LightAnim_None;
	LightComponent.SetLightProperties(LightComponent.MinBrightness);
}

defaultproperties
{
   Begin Object Class=DominantDirectionalLightComponent Name=DominantDirectionalLightComponent0 Archetype=DominantDirectionalLightComponent'Engine.Default__DominantDirectionalLight:DominantDirectionalLightComponent0'
      LightmassSettings=(LightSourceAngle=0.200000)
      bAllowPreShadow=True
      LightingChannels=(Outdoor=True)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DominantDirectionalLightComponent0"
      ObjectArchetype=DominantDirectionalLightComponent'Engine.Default__DominantDirectionalLight:DominantDirectionalLightComponent0'
   End Object
   LightComponent=DominantDirectionalLightComponent0
   AnimationType=LightAnim_ChaoticFlicker
   Begin Object Class=StaticMeshComponent Name=LightMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__DominantDirectionalLight:LightMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bOverridePrecomputedShadowOcclusion=True
      Name="LightMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__DominantDirectionalLight:LightMeshComponent0'
   End Object
   LightMesh=LightMeshComponent0
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0 Archetype=LensFlareComponent'Engine.Default__DominantDirectionalLight:LensFlareComponent0'
      NextTraceTime=0.0 // Ka v oh
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__DominantDirectionalLight:LensFlareComponent0'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DominantDirectionalLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Stationary_DynamicsAndStatics'
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DominantDirectionalLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DominantDirectionalLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Lighting"
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DominantDirectionalLight:ArrowComponent0'
   End Object
   Components(1)=ArrowComponent0
   Components(2)=DominantDirectionalLightComponent0
   RemoteRole=ROLE_SimulatedProxy
   bAlwaysRelevant=True
   CollisionComponent=LightMeshComponent0
   Name="Default__KFDominantDirectionalLightning"
   ObjectArchetype=DominantDirectionalLight'Engine.Default__DominantDirectionalLight'
}
