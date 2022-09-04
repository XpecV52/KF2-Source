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

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Initialize the Projectile
 */
function Init(vector Direction)
{
    super.Init( Direction );

    // Scale lifespan by time dilation
    if( LifeSpan == default.LifeSpan && WorldInfo.TimeDilation < 1.f )
    {
        LifeSpan *= WorldInfo.TimeDilation;
    }
}

/** Call ProcessBulletTouch */
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local KFPawn KFP;
    local bool bPassThrough, bNoPenetrationDmgReduction;
	local KFPerk CurrentPerk;
	local InterpCurveFloat PenetrationCurve;
	local KFWeapon KFW;

	if (Other != Instigator)
	{
		if(IgnoreTouchActor == Other)
		{
			return;
		}

		if (!Other.bStatic && DamageRadius == 0.0)
		{
			// check/ignore repeat touch events
			if( CheckRepeatingTouch(Other) )
			{
				return;
			}

			KFW = KFWeapon(Instigator.Weapon);
			// Keep going if we need to keep penetrating
			if (KFW == none || KFW.GetInitialPenetrationPower(Instigator.FiringMode) > 0.0f)
			{
				if (PenetrationPower > 0 || PassThroughDamage(Other))
				{
					if (KFW != none)
					{
						CurrentPerk = KFW.GetPerk();
						if (CurrentPerk != none)
						{
							bNoPenetrationDmgReduction = CurrentPerk.IgnoresPenetrationDmgReduction();
						}

						PenetrationCurve = KFW.PenetrationDamageReductionCurve[Instigator.FiringMode];
						if (!bNoPenetrationDmgReduction)
						{
							Damage *= EvalInterpCurveFloat(PenetrationCurve, PenetrationPower / KFW.GetInitialPenetrationPower(Instigator.FiringMode));
						}
					}

					ProcessBulletTouch(Other, HitLocation, HitNormal);

					// Reduce penetration power for every KFPawn penetrated
					KFP = KFPawn(Other);
					if (KFP != none)
					{
						PenetrationPower -= KFP.PenetrationResistance;
					}

					bPassThrough = TRUE;
				}
			}
			else
			{
				ProcessBulletTouch(Other, HitLocation, HitNormal);
			}
		}
        // handle water pass through damage/hitfx
        else if ( DamageRadius == 0.f && !Other.bBlockActors && Other.IsA('KFWaterMeshActor') )
        {
            if ( WorldInfo.NetMode != NM_DedicatedServer )
            {
                KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(HitLocation, Instigator,, ImpactEffects);
            }
            bPassThrough = TRUE;
        }

        if ( !bPassThrough )
        {
    		Super.ProcessTouch(Other, HitLocation, HitNormal);
        }
	}
}

/** Damage without stopping the projectile (see also Weapon.PassThroughDamage)*/
simulated function bool PassThroughDamage(Actor HitActor)
{
    // Don't stop this projectile for interactive foliage
	if ( !HitActor.bBlockActors && HitActor.IsA('InteractiveFoliageActor') )
	{
		return true;
	}

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
