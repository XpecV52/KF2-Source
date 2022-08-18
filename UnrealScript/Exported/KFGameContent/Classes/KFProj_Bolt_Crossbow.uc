//=============================================================================
// KFProj_Bolt_Crossbow
//=============================================================================
// Bullet class for the crossbow
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFProj_Bolt_Crossbow extends KFProj_Bullet_RackEmUp
	hidedropdown;


// ALL "STICK" FUNCTIONALITY COPIED FROM KFPROJ_BLADE_EVISCERATOR


/** Information on where this blade has stuck */
var repnotify ImpactInfo StickInfo;

/** Information on where this blade has stuck, cached for later use */
var ImpactInfo DelayedStickInfo;

/** This projectile is currently stuck to a wall */
var bool bStuck;

/** Class of the weapon that shot this projectile */
var	class<KFWeapon> WeaponClass;

/** The radius size of the pickup collision when the blade stops moving */
var() float PickupRadius;
/** The height of the pickup collision when the blade stops moving  */
var() float PickupHeight;

/** This is the effect that is played while in flight */
var(Projectile) ParticleSystem ProjPickupTemplate;

/** Sound to play when picking up ammo */
var() AkEvent AmmoPickupSound;

/** This is what LifeSpan is set to after Stick() is called.
	Allows us to set a much shorter LifeSpan to prevent fly-away blades living a long time. */
var float LifeSpanAfterStick;

replication
{
	if ( bNetDirty )
        StickInfo;
}

/* epic ===============================================
* ::ReplicatedEvent
*
* Called when a variable with the property flag "RepNotify" is replicated
*
* =====================================================
*/
simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(StickInfo))
	{
		Stick(StickInfo, true);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
    super.SpawnFlightEffects();

	if (WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
	{
        ProjEffects.SetVectorParameter('Rotation', vect(0,0,1));
	}
}

/**
 * Very small momentum values get truncated during replication. So, we need to scale the
 * momentum vector during replication.
 */
simulated function vector EncodeSmallVector(vector V)	{return V * 256.f;}
simulated function vector DecodeSmallVector(vector V)	{return V / 256.f;}

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
    local ImpactInfo MyStickInfo;

    SetRotation(rotator(Normal(Velocity)));
	SetPhysics(PHYS_Falling);

    // check if we should do a bounce, otherwise stick
    if( !Bounce(HitNormal, Wall) )
    {
        // Turn off the corona when it stops
    	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
    	{
            ProjEffects.DeactivateSystem();
            ProjEffects.SetVectorParameter('Rotation', vect(0,0,0));
        }

        // if our last hit is a destructible, don't stick
        if ( !Wall.bStatic && !Wall.bWorldGeometry && Wall.bProjTarget )
    	{
            Explode(Location, HitNormal);
            ImpactedActor = None;
    	}
        else
        {
            MyStickInfo.HitLocation = Location;
            MyStickInfo.HitNormal = HitNormal;
            MyStickInfo.HitActor = Wall;
            MyStickInfo.RayDir = EncodeSmallVector(Normal(Velocity));
            Stick(MyStickInfo, false);
        }

        bBounce = false;
    }
}

/**
 * Stick on the wall
 */
simulated function Stick(ImpactInfo MyStickInfo, bool bReplicated )
{
    // Turn off the corona and rotation when it stops
	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
	{
        // Turn off the old effects
        ProjEffects.DeactivateSystem();

        // Activate the pickup effects
        ProjEffects.SetTemplate(ProjPickupTemplate);
        ProjEffects.ActivateSystem();
        ProjEffects.SetVectorParameter('Rotation', vect(0,0,0));
    }

	// Play the bullet impact sound and effects
	if ( WorldInfo.NetMode != NM_DedicatedServer && !bStuck )
	{
		KFImpactEffectManager(WorldInfo.MyImpactEffectManager).PlayImpactEffects(Location, Instigator, MyStickInfo.HitNormal, ImpactEffects);
	}

    if( !IsZero(DecodeSmallVector(MyStickInfo.RayDir)) )
    {
        SetRotation(Rotator(DecodeSmallVector(MyStickInfo.RayDir)));
    }
    else
    {
        SetRotation(Rot(0,0,0));
    }

    SetPhysics(PHYS_None);

    if( bReplicated )
    {
        SetLocation(MyStickInfo.HitLocation);
        bStuck = true;
    }
    else if( Role == ROLE_Authority )
    {
        bStuck = true;
        LifeSpan = LifeSpanAfterStick;
    }

	// Stop ambient sounds when this projectile ShutsDown
	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
	{
        AmbientComponent.StopEvents();
	}

    if ( WorldInfo.NetMode == NM_DedicatedServer )
    {
        DelayedStickInfo = MyStickInfo;
        SetTimer(0.01, false, nameof(DelayedStick));
    }
    else
    {
        if( Role == ROLE_Authority )
        {
            StickInfo = MyStickInfo;
        }

    	bForceNetUpdate = TRUE;
    	NetUpdateFrequency = 3;

        GotoState('Pickup');
    }
}


/*********************************************************************************************
 * State Pickup
 * Pickup is active
 *********************************************************************************************/

/**
 * Delay the stick so that client side hit detection doesn't get messed up for close shots
 */
simulated function DelayedStick()
{
	StickInfo = DelayedStickInfo;

    bForceNetUpdate = TRUE;
	NetUpdateFrequency = 3;

    GotoState('Pickup');
}

/**
 * State where this blade is waiting to be picked up
 */
state Pickup
{
    /** give pickup to player */
    function GiveTo( Pawn P )
    {
    	local KFWeapon W;

    	foreach P.InvManager.InventoryActors( class'KFWeapon', W )
    	{
            // Give the player 1 blade back
    		if( W.Class == WeaponClass )
    		{
                W.AddAmmo(1);

				PlayerController( P.Owner ).ReceiveLocalizedMessage( class'KFLocalMessage_Game', GMT_PickedupWeaponAmmo,,,WeaponClass);
    			P.PlaySoundBase( AmmoPickupSound );

    			ShutDown();
    		}
    	}
    }

	/**
	 * Validate touch (if valid return true to let other pick me up and trigger event).
	 * Overridden to remove call to WorldInfo.Game.PickupQuery(Other, InventoryType, self) since we need this to be client side
	 */
	function bool ValidTouch( Pawn Other )
	{
		// make sure its a live player
		if (Other == None || !Other.bCanPickupInventory || (Other.DrivenVehicle == None && Other.Controller == None))
		{
			return false;
		}

		// make sure not touching through wall
		if ( !FastTrace(Other.Location, Location) )
		{
			return false;
		}

		// make sure game will let player pick me up
		if (WorldInfo.Game.PickupQuery(Other, WeaponClass, self))
		{
			return true;
		}
		return false;
	}

	// When touched by an actor.
	simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
	{
		local Pawn P;

        if( Role == ROLE_Authority )
        {
    		// If touched by a player pawn, let him pick this up.
    		P = Pawn(Other);
    		if( P != None && ValidTouch(P) )
    		{
    			GiveTo(P);
    		}
        }
	}

	// Make sure no pawn already touching .
	function CheckTouching()
	{
		local Pawn P;

		ForEach TouchingActors(class'Pawn', P)
			Touch(P, None, Location, Normal(Location-P.Location) );
	}

	/**
	* Overridden to prevent adding to navigation network.
	*/
	function BeginState(Name PreviousStateName)
	{
        // Modify the collision so it can be picked up by the player
        SetCollisionSize(PickupRadius,PickupHeight);
        CylinderComponent.SetTraceBlocking( true, true );
        CylinderComponent.SetActorCollision( true, false );
        bCollideComplex = false;
        SetOwner( None ); // If the owner is still the weapon (which is owned by the pawn that shot the projectile), then it will not collide at all with the pawn, so set its owner to none!

	}

Begin:
	CheckTouching();
}

//==============
// Touching
// Overriden to get the arrow to bounce and land if hitting a zed it can't penetrate
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
    local KFPawn KFP;
    local bool bPassThrough;

	if ( Other != Instigator && !Other.bWorldGeometry && Other.bCanBeDamaged )
	{
        if ( Pawn(other) != None )
		{
			if( Physics != Phys_Falling )
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
    				bPassThrough = TRUE;
    			}

                if ( !bPassThrough )
                {
                    // Turn off the corona when it stops
                	if ( WorldInfo.NetMode != NM_DedicatedServer && ProjEffects!=None )
                	{
                        ProjEffects.DeactivateSystem();
                        ProjEffects.SetVectorParameter('Rotation', vect(0,0,0));
                    }

                    // Make the arrow fall to the ground if it his something it can't penetrate
                    Velocity = vect(0,0,0);
                    SetPhysics(PHYS_Falling);
                }
            }
		}
		else
		{
			ProcessDestructibleTouchOnBounce( Other, HitLocation, HitNormal );
		}
	}
	else
	{
        Super.ProcessTouch(Other, HitLocation, HitNormal);;
	}
}

simulated function Tick( float DeltaTime )
{
    super.Tick(DeltaTime);

    /*if( Physics == PHYS_Projectile && Physics != PHYS_None )
    {
        DrawDebugSphere( Location, 12, 8, 255, 100, 100, true );

        if( !IsZero(LastLocation) )
        {
            DrawDebugLine( Location, LastLocation, 100, 255, 100, true );
        }
        LastLocation = Location;
    }*/

    // Make it start falling faster if it's moving really slow
    if( Physics == PHYS_Projectile && VSizeSq(Velocity) < ((Speed * Speed) * 0.1) )
    {
        SetPhysics(PHYS_Falling);
        GravityScale=1.0;
    }

    if ( WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None && Physics == PHYS_Projectile )
    {
        SetRotation(Rotator(Normal(Velocity)));
    }
}

defaultproperties
{
   WeaponClass=Class'kfgamecontent.KFWeap_Bow_Crossbow'
   PickupRadius=100.000000
   PickupHeight=50.000000
   ProjPickupTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile_Pickup'
   AmmoPickupSound=AkEvent'WW_WEP_SA_Crossbow.Play_Crossbow_Bolt_Pickup'
   LifeSpanAfterStick=180.000000
   bNoReplicationToInstigator=False
   ProjFlightTemplate=ParticleSystem'WEP_Crossbow_EMIT.FX_Crossbow_Projectile'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_Crossbow.Play_Bolt_Fly_By'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_Crossbow.Stop_Bolt_Fly_By'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_Bullet_RackEmUp:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_Bullet_RackEmUp:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'FX_Impacts_ARCH.Crossbow_impact'
   Speed=15000.000000
   MaxSpeed=15000.000000
   bBlockedByInstigator=False
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_Bullet_RackEmUp:CollisionCylinder'
      CollisionHeight=1.000000
      CollisionRadius=1.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_Bullet_RackEmUp:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bNoEncroachCheck=True
   LifeSpan=8.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Bolt_Crossbow"
   ObjectArchetype=KFProj_Bullet_RackEmUp'KFGame.Default__KFProj_Bullet_RackEmUp'
}
