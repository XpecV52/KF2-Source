//=============================================================================
// KFProj_DynamiteGrenade
//=============================================================================
// Dynamite projectile class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson and Jeff Robinson
//=============================================================================

class KFProj_DynamiteGrenade extends KFProj_Grenade
	hidedropdown;

/** On Contact demo skill can turn our grenade into an insta boom device */
var bool bExplodeOnContact;

/** Ambient sound to play */
var AkEvent FuseEvent;

/** Dynamic light */
var PointLightComponent FuseLight;

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	PlaySoundBase( FuseEvent, true,, true );

	Super.PostBeginPlay();
}

/** Overridden to turn off dynamic light */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	super.TriggerExplosion( HitLocation, HitNormal, HitActor );

	FuseLight.SetEnabled( false );
}

//==============
// Touching
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local Pawn ActorPawn;

	if( Other != Instigator && !Other.bWorldGeometry )
	{
		ActorPawn = Pawn(other);
		if ( ActorPawn != None )
		{
            // For opposing team, make the grenade explode instantly
			if( ActorPawn.GetTeamNum() != GetTeamNum() )
			{
				if (!bHasExploded && !bHasDisintegrated)
				{
					GetExplodeEffectLocation( HitLocation, HitNormal, Other );
        			TriggerExplosion( HitLocation, HitNormal, Other );
        		}
			}
		}
	}

	super.ProcessTouch( Other, HitLocation, HitNormal );
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
    local KFPlayerReplicationInfo InstigatorPRI;
    local KFPlayerController KFPC;
    local KFPerk InstigatorPerk;

    if( Instigator != none )
    {
	    if( bWasTimeDilated )
	    {
	        InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	        if( InstigatorPRI != none )
	        {
	            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
	            {
	                ExplosionTemplate = class'KFPerk_Demolitionist'.static.GetNukeExplosionTemplate();
	                ExplosionTemplate.Damage = default.ExplosionTemplate.Damage * class'KFPerk_Demolitionist'.static.GetNukeDamageModifier();
	                ExplosionTemplate.DamageRadius = default.ExplosionTemplate.DamageRadius * class'KFPerk_Demolitionist'.static.GetNukeRadiusModifier();
	                ExplosionTemplate.DamageFalloffExponent = default.ExplosionTemplate.DamageFalloffExponent;        
	            }
	            else if( InstigatorPRI.bConcussiveActive && AltExploEffects != none )
	            {
	                ExplosionTemplate.ExplosionEffects = AltExploEffects;
	                ExplosionTemplate.ExplosionSound = class'KFPerk_Demolitionist'.static.GetConcussiveExplosionSound();
	            }
	        }
	    }

	    KFPC = KFPlayerController(Instigator.Controller);
	    // Change the radius and damage based on the perk
	    if( Instigator.Role == ROLE_Authority && KFPC != none )
	    {
	        InstigatorPerk = KFPC.GetPerk();
	        ExplosionTemplate.Damage *= InstigatorPerk.GetAeODamageModifier();
	        ExplosionTemplate.DamageRadius *= InstigatorPerk.GetAeORadiusModifier();
	    }
	}

    super.PrepareExplosionTemplate();
}

simulated protected function SetExplosionActorClass()
{
   local KFPlayerReplicationInfo InstigatorPRI;

    if( WorldInfo.TimeDilation < 1.f && Instigator != none )
    {
       InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
        if( InstigatorPRI != none )
        {
            if( InstigatorPRI.bNukeActive && class'KFPerk_Demolitionist'.static.ProjectileShouldNuke( self ) )
            {
                ExplosionActorClass = class'KFPerk_Demolitionist'.static.GetNukeExplosionActorClass();
            }
        }
    }

    super.SetExplosionActorClass();
}

defaultproperties
{
   FuseEvent=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Fuse_LP'
   Begin Object Class=PointLightComponent Name=FusePointLight
      Radius=300.000000
      FalloffExponent=10.000000
      Translation=(X=0.000000,Y=0.000000,Z=6.000000)
      LightColor=(B=63,G=200,R=255,A=255)
      CastShadows=False
      CastStaticShadows=False
      CastDynamicShadows=False
      LightingChannels=(Outdoor=True)
      MaxBrightness=1.500000
      MinBrightness=0.500000
      AnimationType=1
      AnimationFrequency=2.000000
      Name="FusePointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   FuseLight=FusePointLight
   FuseTime=3.000000
   DampenFactor=0.200000
   DampenFactorParallel=0.300000
   LandedTranslationOffset=(X=-8.000000,Y=0.000000,Z=0.000000)
   WeaponSelectTexture=Texture2D'wep_ui_dynamite_tex.UI_WeaponSelect_Dynamite'
   bWarnAIWhenFired=True
   GlassShatterType=FMGS_ShatterNone
   TossZ=400.000000
   ExplosionActorClass=Class'KFGame.KFExplosionActor'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion'
      Damage=300.000000
      DamageRadius=400.000000
      DamageFalloffExponent=2.000000
      MyDamageType=Class'kfgamecontent.KFDT_Explosive_DynamiteGrenade'
      KnockDownStrength=0.000000
      ExplosionSound=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion'
      ExploLight=PointLightComponent'kfgamecontent.Default__KFProj_DynamiteGrenade:ExplosionPointLight'
      ExploLightFadeOutTime=0.200000
      CamShake=KFCameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
      CamShakeInnerRadius=200.000000
      CamShakeFalloff=1.500000
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_DynamiteGrenade:ExploTemplate0'
   ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'
   AltExploEffects=KFImpactEffectInfo'WEP_Dynamite_ARCH.Dynamite_Explosion_Concussive_Force'
   ProjFlightTemplate=ParticleSystem'WEP_Dynamite_EMIT.FX_Dynamite_Grenade_Mesh'
   AssociatedPerkClass=Class'KFGame.KFPerk_Demolitionist'
   Speed=1500.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
      CollisionHeight=10.000000
      CollisionRadius=10.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Grenade:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=FusePointLight
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_DynamiteGrenade"
   ObjectArchetype=KFProj_Grenade'KFGame.Default__KFProj_Grenade'
}
