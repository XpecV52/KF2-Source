//=============================================================================
// KFProj_Blade_Eviscerator
//=============================================================================
// Blade class for the Eviscerator
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFProj_Blade_Eviscerator extends KFProj_RicochetBullet
	hidedropdown;

/** Information on where this blade has stuck */
var repnotify ImpactInfo StickInfo;

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
function vector EncodeSmallVector(vector V)				{return V * 256.f;}
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
        StickInfo = MyStickInfo;

        LifeSpan = LifeSpanAfterStick;
    }

	// Stop ambient sounds when this projectile ShutsDown
	if( bStopAmbientSoundOnExplode && AmbientSoundStopEvent != none && AmbientComponent != none )
	{
        AmbientComponent.StopEvents();
	}

	bForceNetUpdate = TRUE;
	NetUpdateFrequency = 3;

    GotoState('Pickup');
}


/*********************************************************************************************
 * State Pickup
 * Pickup is active
 *********************************************************************************************/

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
		if ( !FastTrace(Other.Location, Location,,true) )
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
        CylinderComponent.SetActorCollision(true, false);
        bCollideComplex=false;
        SetOwner( None ); // If the owner is still the weapon (which is owned by the pawn that shot the projectile), then it will not collide at all with the pawn, so set its owner to none!

	}

Begin:
	CheckTouching();
}

//==============
// Touching
// Overriden to get nails bouncing off of destructible meshes
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

                    // Make the blade fall to the ground if it his something it can't penetrate
                    Velocity = vect(0,0,0);
                    BouncesLeft=0;
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

    // Make it start falling faster if it's moving really slow
    if( Physics == PHYS_Projectile && VSizeSq(Velocity) < ((Speed * Speed) * 0.1) )
    {
        SetPhysics(PHYS_Falling);
        GravityScale=1.0;
    }

    if ( WorldInfo.NetMode != NM_DedicatedServer && Physics != PHYS_None )
    {
        SetRotation(Rotator(Normal(Velocity)));
    }
}

defaultproperties
{
   WeaponClass=Class'kfgamecontent.KFWeap_Eviscerator'
   PickupRadius=200.000000
   PickupHeight=50.000000
   ProjPickupTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_pickup_01'
   AmmoPickupSound=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Pickup'
   LifeSpanAfterStick=180.000000
   BouncesLeft=5
   DampingFactor=0.950000
   RicochetEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeImpacts'
   bNoReplicationToInstigator=False
   bAmbientSoundZedTimeOnly=False
   GravityScale=0.750000
   ExtraLineCollisionOffsets(0)=(X=0.000000,Y=-8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(1)=(X=0.000000,Y=8.000000,Z=0.000000)
   ExtraLineCollisionOffsets(2)=()
   ProjFlightTemplate=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
   ProjFlightTemplateZedTime=ParticleSystem'WEP_SawBlade_EMIT.FX_Sawblade_projectile_01'
   AmbientSoundPlayEvent=AkEvent'WW_WEP_SA_SawBlade.Play_WEP_SA_Sawblade_Projectile_Loop'
   AmbientSoundStopEvent=AkEvent'WW_WEP_SA_SawBlade.Stop_WEP_SA_Sawblade_Projectile_Loop'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent Archetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.100000
      Name="AmbientAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFProj_RicochetBullet:AmbientAkSoundComponent'
   End Object
   AmbientComponent=AmbientAkSoundComponent
   ImpactEffects=KFImpactEffectInfo'WEP_Sawblade_ARCH.SawbladeEmbedFX'
   Speed=2500.000000
   MaxSpeed=2500.000000
   bRotationFollowsVelocity=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=6.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFProj_RicochetBullet:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=AmbientAkSoundComponent
   bNetTemporary=False
   bUpdateSimulatedPosition=True
   LifeSpan=8.000000
   CollisionComponent=CollisionCylinder
   Name="Default__KFProj_Blade_Eviscerator"
   ObjectArchetype=KFProj_RicochetBullet'KFGame.Default__KFProj_RicochetBullet'
}
