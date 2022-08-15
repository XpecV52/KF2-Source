//=============================================================================
// KFProj_Bullet
//=============================================================================
// Base class for small arms projectiles
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bullet extends KFProjectile
    native
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
        `ImpactEffectManager.PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
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
	// TEMP: Set the speed really high so it looks like a instant fire, but it won't replicate properly at
	// this speed.  With a high ping it will spawn/destroy on the server and never get bNetInitial on the client
	MaxSpeed=50000.0
	Speed=50000.0

	LifeSpan=4.0f

	Damage=10
	DamageRadius=0

	bWaitForEffects=true
	ProjEffectsFadeOutDuration=0.25
	bSyncToOriginalLocation=true
	bSyncToThirdPersonMuzzleLocation=true
	bRotationFollowsVelocity=true
	bNoReplicationToInstigator=true
	bUseClientSideHitDetection=true

	bCollideComplex=TRUE	// Ignore simple collision on StaticMeshes, and collide per poly (same as InstantFire)

    bAutoStartAmbientSound=true
    bStopAmbientSoundOnExplode=true
    bAmbientSoundZedTimeOnly=true

    AmbientSoundPlayEvent=AkEvent'WW_WEP_Bullet_FlyBys.Play_WEP_Bullet_Flyby_Small'
    AmbientSoundStopEvent=AkEvent'WW_WEP_Bullet_FlyBys.Stop_WEP_Bullet_Flyby_Small'

    ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Light_bullet_impact'

    Begin Object Class=AkComponent name=AmbientAkSoundComponent
        bStopWhenOwnerDestroyed=true
        bForceOcclusionUpdateInterval=true
        OcclusionUpdateInterval=0.1f
    End Object
    AmbientComponent=AmbientAkSoundComponent
    Components.Add(AmbientAkSoundComponent)

    TouchTimeThreshhold=0.15
    bDamageDestructiblesOnTouch=true
}


