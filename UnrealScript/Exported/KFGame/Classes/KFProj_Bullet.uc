//=============================================================================
// KFProj_Bullet
//=============================================================================
// Base class for small arms projectiles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet extends KFProjectile
	abstract;

/** Store the current scale of the ProjEffects for procedurally ramping them up/down */
var float ProjEffectsScale;

/** Call ProcessBulletTouch */
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local KFPawn KFP;

	if (Other != Instigator)
	{
		if (!Other.bStatic && DamageRadius == 0.0)
		{
			// check/ignore repeat touch events
			if( CheckRepeatingTouch(Other) )
			{
				return;
			}

			ProcessBulletTouch(Other, HitLocation, HitNormal);

		    // Keep going if we need to keep penetrating
			if( PenetrationPower > 0 || PassThroughDamage(Other) )
			{
                // Reduce penetration power for every KFPawn penetrated
                KFP = KFPawn(Other);
            	if ( KFP != none )
            	{
                    PenetrationPower -= KFP.PenetrationResistance;
            	}
				return; // skip super/shutdown
			}
		}

		Super.ProcessTouch(Other, HitLocation, HitNormal);
	}
}

/** Damage without stopping the projectile */
simulated function bool PassThroughDamage(Actor HitActor)
{
    // Don't stop this projectile for interactive foliage
    if( InteractiveFoliageActor(HitActor) != None )
		return true;
    else
	   return FALSE;
}

/**
 * Explode this Projectile
 */
simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	// If there is an explosion template do the parent version
	if ( ExplosionTemplate != None )
	{
		Super.TriggerExplosion(HitLocation, HitNormal, HitActor);
		return;
	}

	// otherwise use the ImpactEffectManager for material based effects
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
        KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
	}
}

/** Handle flight FX fading */
simulated event Tick(float DeltaTime)
{
    local float DeltaFade;
    local vector ScaleVector;

    super.Tick(DeltaTime);

	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
	{
        // Scale the ProjEffects up over time
        if( !bFadingOutProjEffects )
    	{
            if( ProjEffectsScale < 1.0 )
            {
                // Scale the tracer up based on the speed of the round
                ProjEffectsScale += DeltaTime * (default.Speed/950);
            }
            else
            {
                ProjEffectsScale = 1.0;
            }

            ScaleVector = vect(1.0,1.0,1.0);
            ScaleVector *= ProjEffectsScale;

            ProjEffects.SetVectorParameter('Scale_Tracer', ScaleVector);
            ProjEffects.SetVectorParameter('Scale_Distortion', ScaleVector);
        }
        // Scale the ProjEffects down when the effects are being faded out
        else if( bFadingOutProjEffects && ProjEffectsFadeOutDuration >= 0.0 )
        {
            // Calculate the delta of remaining fade out time
            DeltaFade = (ProjEffectsFadeOutDuration/Default.ProjEffectsFadeOutDuration);

            ScaleVector = vect(1.0,1.0,1.0);

            // Scale down the effects based on how much time is left to fade out
            ScaleVector *= Lerp(ProjEffectsScale,0, (1.0-DeltaFade));
            ProjEffects.SetVectorParameter('Scale_Tracer', ScaleVector);
            ProjEffects.SetVectorParameter('Scale_Distortion', ScaleVector);
        }
	}
}

defaultproperties
{
   bSyncToOriginalLocation=True
   bSyncToThirdPersonMuzzleLocation=True
   bNoReplicationToInstigator=True
   bUseClientSideHitDetection=True
   bDamageDestructiblesOnTouch=True
   bWaitForEffects=True
   bAutoStartAmbientSound=True
   bStopAmbientSoundOnExplode=True
   bAmbientSoundZedTimeOnly=True
   TouchTimeThreshhold=0.150000
   ProjEffectsFadeOutDuration=0.250000
   AmbientSoundPlayEvent=AkEvent'WW_WEP_Bullet_FlyBys.Play_WEP_Bullet_Flyby_Small'
   AmbientSoundStopEvent=AkEvent'WW_WEP_Bullet_FlyBys.Stop_WEP_Bullet_Flyby_Small'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Light_bullet_impact'
   Speed=50000.000000
   MaxSpeed=50000.000000
   bRotationFollowsVelocity=True
   Damage=10.000000
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
   Components(1)=AmbientAkSoundComponent
   bCollideComplex=True
   LifeSpan=4.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bullet"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
