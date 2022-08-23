//=============================================================================
// KFProj_MolotovFlare
//=============================================================================
// Flare that is dropped by molotov upon exploding if instigator has medic
// "Flaretov" ability set. It's basically just a light, and it's not actually a projectile.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Jeff Robinson
//=============================================================================
class KFProj_MolotovFlare extends Actor; // NOTE: not actually a projectile

/** This is the effect that is played while in flight */
var ParticleSystemComponent	ProjEffects;
var(Projectile) ParticleSystem ProjFlightTemplate;

/** Point light and related params */
var PointLightComponent PointLight;
var float LightFadeStartTime;
var float LightFadeTime;
var transient float LightFadePerSecond;

/** Ambient sound to play */
var AkEvent FuseEvent;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( ProjFlightTemplate != None )
	    {
	        ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplate);
			if( ProjEffects != none )
			{
		        ProjEffects.SetAbsolute(false, false, false);
				ProjEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
				ProjEffects.bUpdateComponentInTick = true;
				ProjEffects.SetTranslation( vect(0, 0, 2) );
				AttachComponent(ProjEffects);
	  		}
	    }

	    LightFadePerSecond = PointLight.Brightness / LightFadeTime;
	    PlaySoundBase( FuseEvent, true,, true );
	}
}

simulated event Tick( float DeltaTime )
{
	local float NewBrightness;

	super.Tick( DeltaTime );

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		return;
	}

	// gradually fade light
	if( LifeSpan < default.LifeSpan - LightFadeStartTime )
	{
		if( PointLight.Brightness > 0 )
		{
			NewBrightness = FMax( 0, PointLight.Brightness - (LightFadePerSecond * DeltaTime) );
			PointLight.SetLightProperties( NewBrightness );
		}
	}
}

defaultproperties
{
   ProjFlightTemplate=ParticleSystem'WEP_3P_Molotov_EMIT.FX_Flare_fire_01'
   Begin Object Class=PointLightComponent Name=PointLightComponent0
      Radius=800.000000
      FalloffExponent=10.000000
      Brightness=3.000000
      LightColor=(B=140,G=190,R=245,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      Name="PointLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   PointLight=PointLightComponent0
   LightFadeStartTime=27.500000
   LightFadeTime=2.750000
   FuseEvent=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Fuse_LP'
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=PointLightComponent0
   Physics=PHYS_Falling
   RemoteRole=ROLE_SimulatedProxy
   bNetTemporary=True
   bAlwaysRelevant=True
   bReplicateInstigator=True
   bSkipActorPropertyReplication=True
   bCollideActors=True
   bCollideWorld=True
   bCollideComplex=True
   NetPriority=2.500000
   LifeSpan=31.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_MolotovFlare"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
