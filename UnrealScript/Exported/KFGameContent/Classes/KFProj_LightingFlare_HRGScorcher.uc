//=============================================================================
// KFProj_LightingFlare_HRGScorcher
//=============================================================================
// Shotgun pellet class for the HRG Scorcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFProj_LightingFlare_HRGScorcher extends KFProj_RicochetBullet
	hidedropdown;

/** Time projectile is alive after being sticked to an actor or a pawn */
var float StickedTime;

/** This is the effects attached while being sticked to a wall or a pawn */
var ParticleSystemComponent	ProjStickedEffects;
var(Projectile) ParticleSystem ProjStickedTemplate;

/** This is the light attached while being sticked to a wall or a pawn */
var PointLightComponent ProjStickedLight;
var LightPoolPriority ProjStickedLightPriority;

/** Time before particle system parameter is set */
var float FlameDisperalDelay;
/** Last hit normal from Touch() or HitWall() */
var vector LastHitNormal;

/** Impact effects to use when projectile hits a zed */
var KFImpactEffectInfo ImpactEffectsOnZed;

/** Sound to play while projectile is sticked*/
var AKEvent	AmbientSoundPlayEventSticked;

/** (Computed) State if sticked or not projectile */
var bool bSticked;

/** (Computed) Helper variable for Tick() to count sticked time */
var float CurrentStickedTime;

/** Offset time to start fading out light after being sticked */
var float StickedLightFadeStartTime;

/** Time being faded out light after being sticked */
var float StickedLightFadeTime;

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
	Super.SpawnFlightEffects();

	if ( WorldInfo.NetMode != NM_DedicatedServer && WorldInfo.GetDetailMode() > DM_Low  )
	{
		SetTimer(FlameDisperalDelay, false, nameof(MidFlightFXTimer));
	}
}

simulated function MidFlightFXTimer()
{
	if (ProjEffects!=None)
	{
		ProjEffects.SetFloatParameter('Spread', 1.0);
	}
}

simulated protected function StopFlightEffects()
{
	Super.StopFlightEffects();
	ClearTimer(nameof(MidFlightFXTimer));
}


/** Blows up mine immediately */
simulated function Detonate()
{
	//StickHelper.UnPin();
	//StopStickedEffects();
	Shutdown();
}

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();
	AdjustCanDisintigrate(); // TODO needed in order to siren not get rid of proyectile?
}

/**
 * We use Detonate to make disappear the proyectile, but no explosion will show up.
 * We only want to make it disappear.
 */
simulated function Timer_Explode()
{
	Detonate();
}

/** Called when the owning instigator controller has left a game */
/** TODO needed? Innecessary rand for time in timer? */
simulated function OnInstigatorControllerLeft()
{
	if( WorldInfo.NetMode != NM_Client )
	{
		SetTimer( 1.f + Rand(5) + fRand(), false, nameof(Timer_Explode) );
	}
}

// Overriding functions where StickHelper.TryStick is called to start timer to delete the proyectile
simulated event HitWall( vector HitNormal, actor Wall, PrimitiveComponent WallComp )
{
	super.HitWall(HitNormal, Wall, WallComp);
	SetTimer(StickedTime, false, nameof(Timer_Explode));
	StartStickedEffects();
	KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, , ImpactEffects );
	//StopFlightEffects();
}

// Overriding functions where StickHelper.TryStick is called to start timer to delete the proyectile
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	LastHitNormal = HitNormal;
	super.ProcessTouch(Other, HitLocation, HitNormal);
	SetTimer(StickedTime, false, nameof(Timer_Explode));
	StartStickedEffects();
	KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, , ImpactEffects );
	//StopFlightEffects();
}

//We swap effects, sound and light with the appropiate valuess when sticking.
//It has to be done this way because we can't access to AmbientSound to play other sound when sticked.
simulated function StartStickedEffects()
{
	if(WorldInfo.NetMode != NM_DedicatedServer)
	{
		StopFlightEffects();
		ProjFlightLight = ProjStickedLight;
		ProjFlightLightPriority = ProjStickedLightPriority;
		ProjFlightTemplate = ProjStickedTemplate;
		AmbientSoundPlayEvent = AmbientSoundPlayEventSticked;
		SpawnFlightEffects();
		ProjEffects.SetFloatParameter( 'FlareLifetime', StickedTime );
	}
	bSticked=true;
	CurrentStickedTime=0.0;
}

simulated event Tick( float DeltaTime )
{
	local float NewBrightness;
	super.Tick(DeltaTime);
	StickHelper.Tick(DeltaTime); //Used to check current status of StuckTo actor (to figure out if we should fall)

	//Fading out light after being sticked (matching FX decreasing projectile size)
	if (bSticked)
	{
		CurrentStickedTime += DeltaTime;
		
		if (CurrentStickedTime > StickedLightFadeStartTime)
		{
			NewBrightness = 1.5 - Lerp(0, 1.5, (CurrentStickedTime - StickedLightFadeStartTime)/StickedLightFadeTime);
			ProjFlightLight.SetLightProperties(NewBrightness,,);
			ProjFlightLight.UpdateColorAndBrightness();
		}
	}
}

defaultproperties
{
   StickedTime=5.000000
   ProjStickedTemplate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_HRGScorcher_Projectile_Sticked'
   Begin Object Class=PointLightComponent Name=PointLight1
      Radius=350.000000
      FalloffExponent=3.000000
      Brightness=1.500000
      LightColor=(B=80,G=25,R=250,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="PointLight1"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ProjStickedLight=PointLight1
   ProjStickedLightPriority=LPP_High
   FlameDisperalDelay=0.250000
   AmbientSoundPlayEventSticked=AkEvent'WW_WEP_HRG_Scorcher.Stop_WEP_HRG_Scorcher_Burn'
   StickedLightFadeStartTime=4.000000
   StickedLightFadeTime=1.000000
   BouncesLeft=0
   bNoReplicationToInstigator=False
   bCanDisintegrate=True
   bAmbientSoundZedTimeOnly=False
   bWarnAIWhenFired=True
   bCanStick=True
   ProjFlightLightPriority=LPP_High
   GravityScale=0.400000
   TerminalVelocity=5000.000000
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   ProjFlightTemplate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_HRGScorcher_Projectile_01'
   Begin Object Class=PointLightComponent Name=PointLight0
      Radius=350.000000
      FalloffExponent=3.000000
      Brightness=1.500000
      LightColor=(B=80,G=25,R=250,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      Name="PointLight0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ProjFlightLight=PointLight0
   AmbientSoundPlayEvent=AkEvent'WW_WEP_HRG_Scorcher.Stop_WEP_HRG_Scorcher_Flyby'
   AmbientSoundStopEvent=None
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   Begin Object Class=KFProjectileStickHelper Name=StickHelper0
      Name="StickHelper0"
      ObjectArchetype=KFProjectileStickHelper'KFGame.Default__KFProjectileStickHelper'
   End Object
   StickHelper=KFProjectileStickHelper'kfgamecontent.Default__KFProj_LightingFlare_HRGScorcher:StickHelper0'
   Speed=3500.000000
   MaxSpeed=5000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   Physics=PHYS_Falling
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   bCanBeDamaged=False
   NetUpdateFrequency=200.000000
   NetPriority=5.000000
   LifeSpan=20.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_LightingFlare_HRGScorcher"
   ObjectArchetype=KFProj_RicochetBullet'KFGame.Default__KFProj_RicochetBullet'
}
