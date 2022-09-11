//=============================================================================
// KFProj_BrokenFlare_HRGScorcher
//=============================================================================
// Shotgun pellet class for the HRG Scorcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================

class KFProj_BrokenFlare_HRGScorcher extends KFProjectile
	hidedropdown;

/** Speed when residual flames are dropped during projectile flight */
var vector SpeedDirectionResidualFlames;

/** Amount of residual flames to drop during flight
 *  This is the max number, if the projectile is interrupted before reaching the max, the left residual numbers will NOT be spawned.
 *  This value can NOT be 0 or 1.
 */
var int AmountResidualFlamesDuringFlight;

/** Time delay until starting to drop residual flames during flight (should NOT be greater than Lifespan)*/
var float TimeDelayStartDroppingResidualFlames;

/** Class for spawning residual flames **/
var class<KFProjectile> ResidualFlameProjClass;

/** Number of lingering flames to spawn when projectile hits environment or a pawn before reaching max
 *  Note: one flame will always spawn in the place or pawn hit.
 */
var() int AmountResidualFlamesInExplosion;

/** Magnitude to multiply velocity computed for residual flames in explosion */
var float MagnitudeVelocityResidualFlamesInExplosion;

/** Offset added to the final velocity computed for residual flames in explosion */
var vector OffsetVelocityResidualFlamesInExplosion;

/** (Computed) Last Velocity from Explode() */
var vector LastVelocity;

/** (Computed) Time between residual flames drops */
var float IntervalDroppingResidualFlames;

/** Same as Lifespan (but using TimeAlive we assure projectile follows same flow as an explosion) */
var float TimeAlive;

simulated protected function StopSimulating()
{
	if (Instigator != none && Instigator.Role == ROLE_Authority)
	{
		ClearTimer(nameof(Timer_SpawningResidualFlamesDuringFlight));
		ClearTimer(nameof(Timer_StartSpawningResidualFlamesDuringFlight));
	}
	ClearTimer(nameof(Timer_Shutdown));

	super.StopSimulating();
}

simulated function PostBeginPlay()
{
	//Subtract a bit (0.005) from TimeAlive to not match last cycle of the timer with time the projectile has to disappear (causing last flame not to drop then)
	//Subtract 1 from AmountResidualFlamesDuringFlight because the first flame will be spawned manually at the start of the timer.
	IntervalDroppingResidualFlames=((TimeAlive - 0.005) - TimeDelayStartDroppingResidualFlames)/(AmountResidualFlamesDuringFlight - 1);
	if (Instigator != none && Instigator.Role == ROLE_Authority)
	{
		SetTimer(TimeDelayStartDroppingResidualFlames, false, nameof(Timer_StartSpawningResidualFlamesDuringFlight));
	}
	SetTimer(TimeAlive, false, nameof(Timer_Shutdown));

	super.PostBeginPlay();
}

simulated function Init(vector Direction)
{
	super.Init(Direction);
	SpeedDirectionResidualFlames = Velocity/5;
}

/** Timer to spawn residual flames while projectile is flying */
simulated function Timer_SpawningResidualFlamesDuringFlight()
{
	SpawnResidualFlame(ResidualFlameProjClass, Location, SpeedDirectionResidualFlames);
}

/** Timer to act as offset to start spawning residual flames during flight (in order to avoid dropping flames to close to player) */
simulated function Timer_StartSpawningResidualFlamesDuringFlight()
{
	SpawnResidualFlame(ResidualFlameProjClass, Location, SpeedDirectionResidualFlames);
	SetTimer(IntervalDroppingResidualFlames, true, nameof(Timer_SpawningResidualFlamesDuringFlight));
}

/** Timer until calling Shutdown */
simulated function Timer_Shutdown()
{
	Shutdown();
}

/** Spawn several projectiles that explode and linger on impact */
function SpawnResidualFlames (vector HitLocation, vector HitNormal, vector HitVelocity)
{
	local int i;
	local vector HitVelDir;
	local float HitVelMag;
	local vector SpawnLoc, SpawnVel;

	HitVelMag = VSize (HitVelocity)*MagnitudeVelocityResidualFlamesInExplosion;
	HitVelDir = Normal (HitVelocity);

	SpawnLoc = HitLocation + (HitNormal * 10.f);

	// spawn random lingering fires (rather, projectiles that cause little fires)
	for( i = 0; i < AmountResidualFlamesInExplosion; ++i )
	{
		SpawnVel = CalculateResidualFlameVelocity( HitNormal, HitVelDir, HitVelMag );
		SpawnVel = SpawnVel + OffsetVelocityResidualFlamesInExplosion;
		SpawnResidualFlame( ResidualFlameProjClass, SpawnLoc, SpawnVel );
	}
}

/** Spawn several projectiles that explode and linger on impact on explosion and one projectile to explode where this projectile hit */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local bool bDoExplosion;

	if (bHasDisintegrated)
	{
		return;
	}

	bDoExplosion = !bHasExploded && Instigator.Role == ROLE_Authority;

	if (bDoExplosion)
	{
		SpawnResidualFlames (HitLocation, HitNormal, LastVelocity);
		SpawnResidualFlame (ResidualFlameProjClass, Location, LastVelocity);
	}

	super.TriggerExplosion(HitLocation, HitNormal, HitActor);
}


simulated function Explode (vector HitLocation, vector HitNormal)
{
	LastVelocity = Velocity;
	super.Explode (HitLocation, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	ProcessBulletTouch(Other, HitLocation, HitNormal);
	super.ProcessTouch(Other, HitLocation, HitNormal);
}

simulated function SpawnFlightEffects()
{
	super.SpawnFlightEffects();
	
	if (ProjEffects != None)
	{
		ProjEffects.SetFloatParameter( 'FlareLifetime', LifeSpan );
	}
}

defaultproperties
{
   AmountResidualFlamesDuringFlight=8
   TimeDelayStartDroppingResidualFlames=0.005000
   ResidualFlameProjClass=Class'kfgamecontent.KFProj_BrokenFlare_HRGScorcherSplash'
   AmountResidualFlamesInExplosion=3
   MagnitudeVelocityResidualFlamesInExplosion=0.500000
   OffsetVelocityResidualFlamesInExplosion=(X=0.000000,Y=0.000000,Z=200.000000)
   TimeAlive=0.500000
   bDamageDestructiblesOnTouch=True
   bWarnAIWhenFired=True
   GravityScale=0.400000
   TerminalVelocity=7000.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_HRGScorcher_Pistol_ARCH.HRGScorcher_Pistol_Grenade_Explosion'
      Damage=0.000000
      MyDamageType=Class'kfgamecontent.KFDT_Fire_HRGScorcherDoT'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      ExplosionSound=AkEvent'WW_WEP_HRG_Scorcher.Play_WEP_HRG_Scorcher_AltFire_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_BrokenFlare_HRGScorcher:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Misc_Explosions.Light_Explosion_Rumble'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_BrokenFlare_HRGScorcher:ExploTemplate0'
   ProjFlightTemplate=ParticleSystem'WEP_HRGScorcher_Pistol_EMIT.FX_HRGScorcher_Projectile_01_ALT'
   ProjEffectsFadeOutDuration=5.000000
   Begin Object Class=PointLightComponent Name=PointLight0
      Radius=500.000000
      FalloffExponent=10.000000
      Brightness=0.500000
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
   AssociatedPerkClass=Class'KFGame.KFPerk_Firebug'
   Speed=3000.000000
   MaxSpeed=7000.000000
   DamageRadius=0.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Physics=PHYS_Falling
   bCollideComplex=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_BrokenFlare_HRGScorcher"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
