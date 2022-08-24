//=============================================================================
// KFProj_GroundIce
//=============================================================================
// Projectile class for ground ice from freeze thrower, etc
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFProj_GroundIce extends KFProjectile;

var() float DamageInterval;

/** Warns AI that this projectile has been fired */
function WarnAI( vector Direction )
{
	local KFPawn_Monster KFPM;
	local vector DangerPoint;

	DangerPoint = Location;

	foreach WorldInfo.AllPawns( class'KFPawn_Monster', KFPM )
	{
        if( KFPM.MyKFAIC != none && KFPM.IsAliveAndWell() )
        {
        	// Distance check
 			if( VSizeSQ(KFPM.Location - Location) > 90000.f )
 			{
 				continue;
 			}

 			// Visibility check
 			if( class'KFGameEngine'.static.FastTrace_PhysX(Location, KFPM.Location) )
 			{
	        	// Scale danger point up to pawn's Z location
	        	DangerPoint.Z = KFPM.Location.Z;

		        // Tell the zed to evade away from the DangerPoint
		        KFPM.MyKFAIC.ReceiveLocationalWarning( DangerPoint, Location, self );
		    }
	    }
	}
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameof( bHasExploded ) )
	{
		return; // This would trigger another explosion, we don't need to do it for the groundfire.
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	local KFPlayerReplicationInfo InstigatorPRI;

	// Checks if we want to swap the explosion effects
	if( AltExploEffects != none )
	{
		InstigatorPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( InstigatorPRI != none )
		{
			bAltExploEffects = InstigatorPRI.bSplashActive;
		}
	}
	else
	{
		bAltExploEffects = false;
	}

	TriggerExplosion( Location, vector(Rotation), None );

	Super.PostBeginPlay();
}

/*********************************************************************************************
* Collision
********************************************************************************************* */
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	//Super(Projectile).Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated protected function PrepareExplosionActor(GameExplosionActor GEA)
{
	local KFExplosionActorLingering KFE_GroundFire;

	KFE_GroundFire = KFExplosionActorLingering( GEA );
	if( KFE_GroundFire != none )
	{
		KFE_GroundFire.Interval = DamageInterval;
	}
}

/**
 * Force the fire not to burn the instigator, since setting it in the default props is not working for some reason - Ramm
 */
simulated protected function PrepareExplosionTemplate()
{
	ExplosionTemplate.bIgnoreInstigator=true;

	// Swap the ExplosionTemplate's effect if necessary
	if( bAltExploEffects )
	{
		ExplosionTemplate.ExplosionEffects = AltExploEffects;
	}
}

defaultproperties
{
   DamageInterval=0.250000
   bAutoStartAmbientSound=True
   ExplosionActorClass=Class'kfgamecontent.KFExplosion_GroundIce'
   Begin Object Class=KFGameExplosion Name=ExploTemplate0
      ExplosionEffects=KFImpactEffectInfo'WEP_CryoGun_ARCH.GroundCryo_Impacts'
      bAllowPerMaterialFX=True
      Damage=5.000000
      DamageRadius=180.000000
      MyDamageType=Class'KFGame.KFDT_Freeze_Ground'
      KnockDownStrength=0.000000
      MomentumTransferScale=0.000000
      FractureMeshRadius=0.000000
      FracturePartVel=0.000000
      CamShake=None
      Name="ExploTemplate0"
      ObjectArchetype=KFGameExplosion'KFGame.Default__KFGameExplosion'
   End Object
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFProj_GroundIce:ExploTemplate0'
   PostExplosionLifetime=2.500000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   RemoteRole=ROLE_None
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_GroundIce"
   ObjectArchetype=KFProjectile'KFGame.Default__KFProjectile'
}
