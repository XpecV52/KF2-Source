//=============================================================================
// KFProj_Thrown_C4
//=============================================================================
// Projectile class for C4 weapon
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFProj_Thrown_C4 extends KFProjectile;

enum EImpactResult
{
	EIR_None,
	EIR_Stick,
	EIR_Bounce,
};

// replicated stick info.
// needed to use a repnotify Actor, because UObjects that fail replication due to not being serializeable on the client will be sent again.
/** Actor C4 is stuck to */
var repnotify Actor	StuckToActor;
/** Index of bone C4 is stuck to (if stuck to actor) */
var int	StuckToBoneIdx;

/** replicated stuck loc/rot (relative for skeletal meshes, absolute otherwise) */
var transient vector StuckToLocation;
var transient rotator StuckToRotation;

/** Actor we were last stuck to */
var Actor PrevStuckToActor;

var KFImpactEffectInfo ImpactEffectInfo;

/** How much to offset the emitter mesh when the grenade has landed so that it doesn't penetrate the ground */
var() vector LandedTranslationOffset;

/** sound to play on "impact" */
var() AkEvent StickAkEvent;
/** "beep" sound to play (on an interval) when instigator is within blast radius */
var() AkEvent ProximityAlertAkEvent;
/** Time between proximity beeps */
var() float ProximityAlertInterval;
/** Time between proximity beeps when the instigator is within "fatal" radius */
var() float ProximityAlertIntervalClose;
/** Time until next alert */
var transient float ProximityAlertTimer;

/** Visual component of this projectile (we don't use ProjEffects particle system because we need to manipulate the MIC) */
var StaticMeshComponent ChargeMesh;
/** Mesh MIC, used to make LED blink */
var MaterialInstanceConstant ChargeMIC;
/** Dynamic light for blinking */
var PointLightComponent BlinkLightComp;
/** Blink colors */
var LinearColor BlinkColorOn, BlinkColorOff;
/** How long LED and dynamic light should stay lit for */
var float BlinkTime;

var ParticleSystem BlinkFX;
var ParticleSystemComponent BlinkPSC;

replication
{
	if( bNetInitial || !bNetOwner )
		StuckToActor, StuckToBoneIdx, StuckToLocation, StuckToRotation;
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameof(StuckToActor) )
	{
		if( StuckToActor == none )
		{
			RestartMovement();
		}
		else if( StuckToActor != PrevStuckToActor )
		{
			ReplicatedStick( StuckToActor, StuckToBoneIdx );
		}
	}
	else
	{
		super.ReplicatedEvent( VarName );
	}
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	ProximityAlertTimer = ProximityAlertInterval;

	AdjustCanDisintigrate();

	ChargeMIC = ChargeMesh.CreateAndSetMaterialInstanceConstant(0);
}

/** Used to check current status of StuckTo actor (to figure out if we should fall) */
simulated event Tick( float DeltaTime )
{
	local int i;
	local Pawn P;
	local KFFracturedMeshActor FracMesh;
	local KFDoorActor Door;
	local KFDestructibleActor Destructible;
	local Actor StuckTo;

	super.Tick( DeltaTime );

	StuckTo = StuckToActor;
	if( StuckTo != none )
	{
		UpdateAlert( DeltaTime );

		// always restart movement if torn off
		if( StuckTo.bTearOff )
		{
			RestartMovement();
			return;
		}

		// if the bone we're stuck to is hidden (just head, probably), detatch
		P = Pawn( StuckTo );
		if( P != none )
		{
			if( P.Mesh.IsBoneHidden(StuckToBoneIdx) )
			{
				RestartMovement();
			}
			return;
		}

		// if the non-pawn actor we're stuck to is going away (could be due to non-relevancy, in which case they will not be torn off), detatch
		if( StuckTo.bDeleteMe || StuckTo.bPendingDelete )
		{
			RestartMovement();
			return;
		}

		// if the glass we're stuck to is fractured, detatch
		FracMesh = KFFracturedMeshActor( StuckTo );
		if( FracMesh != none && FracMesh.bHasLostChunk )
		{
			RestartMovement();
			return;
		}

		// if the door we're stuck to is moving, detatch
		// (we can't set our base to doors because they're world geometry, so we won't follow when they move)
		Door = KFDoorActor( StuckTo );
		if( Door != none && (!Door.bDoorMoveCompleted || Door.bIsDestroyed) )
		{
			RestartMovement();
			return;
		}

		// if the replicated destructible we're stuck to is destroyed, detatch
		Destructible = KFDestructibleActor( StuckTo );
		if( Destructible != none )
		{
			for( i = 0; i < Destructible.SubObjects.Length; ++i )
			{
				if( Destructible.SubObjects[i].Mesh == LastTouchComponent && Destructible.SubObjects[i].Health <= 0 )
				{
					RestartMovement();
					return;
				}
			}
		}
	}
}

/** Checks if deployed charge should play a warning "beep" for the instigator. Beeps faster if the instigator is within "lethal" range. */
simulated function UpdateAlert( float DeltaTime )
{
	local vector ToInstigator, BBoxCenter;
	local float DistToInstigator, DamageScale;
	local Actor TraceActor;
	local Box BBox;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	if( bHasExploded || bHasDisintegrated )
	{
		return;
	}

	if( ProximityAlertTimer <= 0 )
	{
		return;
	}

	ProximityAlertTimer -= DeltaTime;

	if( ProximityAlertTimer > 0 )
	{
		return;
	}

	ProximityAlertTimer = ProximityAlertInterval;

	// only play sound for instigator (based on distance)
	if( Instigator != none && Instigator.IsLocallyControlled() )
	{
		ToInstigator = Instigator.Location - Location;
		DistToInstigator = VSize( ToInstigator );
		if( DistToInstigator <= ExplosionTemplate.DamageRadius )
		{
			Instigator.GetComponentsBoundingBox(BBox);
			BBoxCenter = (BBox.Min + BBox.Max) * 0.5f;
			TraceActor = class'GameExplosionActor'.static.StaticTraceExplosive(BBoxCenter, Location + vect(0,0,20), self);
			if( TraceActor == none || TraceActor == Instigator )
			{
				DamageScale = FClamp(1.f - DistToInstigator/ExplosionTemplate.DamageRadius, 0.f, 1.f);
				DamageScale = DamageScale ** ExplosionTemplate.DamageFalloffExponent;

				if( ExplosionTemplate.Damage * DamageScale > Instigator.Health )
				{
					ProximityAlertTimer = ProximityAlertIntervalClose;
				}

				PlaySoundBase( ProximityAlertAkEvent, true );
			}
		}
	}

	// blink for everyone to see
	BlinkOn();
}

/** Turns on LED and dynamic light */
simulated function BlinkOn()
{
	if( BlinkPSC == none )
	{
		BlinkPSC = WorldInfo.MyEmitterPool.SpawnEmitter(BlinkFX, Location + (vect(0,0,4) + vect(8,0,0) >> Rotation),, self,,, true);
	}

	BlinkPSC.SetFloatParameter('Glow', 1.0);

	ChargeMIC.SetVectorParameterValue('Vector_GlowColor', BlinkColorOn);
	BlinkLightComp.SetEnabled( true );
	SetTimer( BlinkTime, false, nameof(BlinkOff) );
}

/** Turns off LED and dynamic light */
simulated function BlinkOff()
{
	if( BlinkPSC != none )
	{
		BlinkPSC.SetFloatParameter('Glow', 0.0);
	}

	ChargeMIC.SetVectorParameterValue('Vector_GlowColor', BlinkColorOff);
	BlinkLightComp.SetEnabled( false );
}

/** Complete overrides super */
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	TryStick( HitNormal, HitLocation, Other );
}

/** Complete overrides super */
simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	TryStick( HitNormal,, Wall );
}

/** Tries to stick projectile to hit actor. alternatively, tries to bounce it off of hit actor. */
simulated function TryStick( vector HitNormal, optional vector HitLocation, optional Actor HitActor )
{
	local TraceHitInfo HitInfo;

	if( !Instigator.IsLocallyControlled() )
	{
		return;
	}

	GetImpactInfo( Velocity, HitLocation, HitNormal, HitInfo );

	switch( GetImpactResult(HitActor, HitInfo.HitComponent) )
	{
	case EIR_Stick:
		Stick( HitActor, HitLocation, HitNormal, HitInfo );
		break;

	//@todo: add bounce? do we ever need to bounce?
	};
}

/** Returns appropriate interaction with HitActor (stick or ignore, for now. add bounce later?) */
simulated function EImpactResult GetImpactResult( Actor HitActor, PrimitiveComponent HitComp )
{
	local KFPawn_Human KFP;
	local KFDestructibleActor D;
	local StaticMeshComponent StaticMeshComp;

	if( HitActor == none )
	{
		return EIR_Stick;
	}

	if( HitActor.RemoteRole == ROLE_None && !HitActor.bWorldGeometry )
	{
		return EIR_None;
	}

	// if we've already been dislodged from an actor, don't keep trying to stick to it while falling
	if( HitActor.bTearOff || HitActor.bDeleteMe || HitActor.bPendingDelete || HitActor == PrevStuckToActor )
	{
		return EIR_None;
	}

	StaticMeshComp = StaticMeshComponent( HitComp );
	if( StaticMeshComp != none )
	{
		// NOTE: Door actors fall into this category!

		// pass through meshes that can move
		return StaticMeshComp.CanBecomeDynamic() ? EIR_None : EIR_Stick;
	}

	KFP = KFPawn_Human( HitActor );
	if( KFP != none )
	{
		// bounce off of player pawns, stick to other pawns
		return EIR_None;
	}

	D = KFDestructibleActor( HitActor );
	if( D != none )
	{
		// don't react to client-side-only destructibles, stick to others
		return (D.ReplicationMode == RT_ClientSide) ? EIR_None : EIR_Stick;
	}

	return EIR_Stick;
}

/** Stops movement of projectile and calculates orientation to surface */
simulated function Stick( Actor HitActor, vector HitLocation, vector HitNormal, const out TraceHitInfo HitInfo )
{
	local int BoneIdx;
	local rotator StickRot;

	// grenades use this, but we don't set LandedTranslationOffset for C4 currently
	if( ProjEffects != none )
	{
        ProjEffects.SetTranslation(LandedTranslationOffset);
    }

    // turn off location/rotation replication, because we'll handle this on the other side (REMEMBER TO TURN IT BACK ON IF WE NEED IT)
    bReplicateMovement = false;

    if( !IsZero(HitLocation) )
    {
    	SetLocation( HitLocation );
    }

    StickRot = CalculateStickOrientation( HitNormal );
    SetRotation( StickRot );

	BoneIdx = INDEX_NONE;

	if( HitInfo.BoneName != '' )
	{
		BoneIdx = GetBoneIndexFromActor( HitActor, HitInfo.BoneName );
	}

    StickToActor( HitActor, HitInfo.HitComponent, BoneIdx, true );

    if( Role < ROLE_Authority )
	{
		ServerStick( HitActor, BoneIdx, StuckToLocation, StuckToRotation );
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PlaySoundBase( StickAkEvent );
	}
}

/** Get all relevant impact info (called after collision occurs to fill in details that we don't get in HitWall or ProcessTouch) */
simulated function GetImpactInfo( vector in_Velocity, out vector out_HitLocation, out vector out_HitNormal, out TraceHitInfo out_HitInfo )
{
	local vector VelNorm;
	local vector VelScaled;

	VelNorm = Normal( in_Velocity );
	VelScaled = VelNorm * 30;
	Trace( out_HitLocation, out_HitNormal, Location + VelScaled, Location - VelScaled, , , out_HitInfo, TRACEFLAG_Bullet /*for complex collision*/ );
}

/** Changes the base of the charge to the stick actor and sets its relative loc/rot */
simulated function StickToActor( Actor StickTo, PrimitiveComponent HitComp, int BoneIdx, optional bool bCalculateRelativeLocRot )
{
	local SkeletalMeshComponent SkelMeshComp;
	local Name BoneName;

	StopMovement();

	PrevStuckToActor = StuckToActor;
	StuckToActor = StickTo;
	StuckToBoneIdx = BoneIdx;

	// if we found a skel mesh, set our base to it and set relative loc/rot
	if( BoneIdx != INDEX_NONE )
	{
		SkelMeshComp = SkeletalMeshComponent( HitComp );

		BoneName = SkelMeshComp.GetBoneName( BoneIdx );

		if( bCalculateRelativeLocRot )
		{
			// set replicated relative loc/rot
			SkelMeshComp.TransformToBoneSpace( BoneName, Location, Rotation, StuckToLocation, StuckToRotation );
		}

		SetBase( StickTo,, SkelMeshComp, BoneName );
		SetRelativeLocation( StuckToLocation );
		SetRelativeRotation( StuckToRotation );
	}
	// otherwise, just set our base
	else
	{
		if( bCalculateRelativeLocRot )
		{
			// set replicated loc/rot
			StuckToLocation = Location;
			StuckToRotation = Rotation;
		}
		else
		{
			// set loc/rot to replicated loc/rot
			SetLocation( StuckToLocation );
			SetRotation( StuckToRotation );
		}

		SetBase( StickTo );
	}
}

/** Attempts to retrieve skeletal mesh from actor */
simulated function SkeletalMeshComponent GetActorSkeletalMesh( Actor StickActor )
{
	local Pawn P;
	local SkeletalMeshActor SM;

 	P = Pawn( StickActor );
 	if( P != none )
 	{
 		return P.Mesh;
 	}

 	SM = SkeletalMeshActor( StickActor );
 	if( SM != none )
 	{
 		return SM.SkeletalMeshComponent;
 	}

 	return none;
}

/** Replicates stick to server from client */
reliable server function ServerStick( Actor StickTo, int BoneIdx, vector StickLoc, rotator StickRot )
{
	StuckToLocation = StickLoc;
	StuckToRotation = StickRot;

	ReplicatedStick( StickTo, BoneIdx );
}

/** Calls "Stick" with replicated info */
simulated function ReplicatedStick( Actor StickTo, int BoneIdx )
{
	StickToActor( StickTo, GetActorSkeletalMesh(StickTo), BoneIdx );
}

/** Gets index for passed-in bone name for different kinds of actors that have differently-named skeletalmeshcomponents */
simulated function int GetBoneIndexFromActor( Actor HitActor, Name BoneName )
{
	local Pawn P;
	local SkeletalMeshActor SM;

 	P = Pawn( HitActor );
 	if( P != none )
 	{
 		return P.Mesh.MatchRefBone( BoneName );
 	}

 	SM = SkeletalMeshActor( HitActor );
 	if( SM != none )
 	{
 		return SM.SkeletalMeshComponent.MatchRefBone( BoneName );
 	}

 	return INDEX_NONE;
}

/** Gets location for passed-in bone name for different kinds of actors that have differently-named skeletalmeshcomponents */
simulated function GetBoneLocationFromActor( Actor HitActor, int BoneIdx, out vector BoneLoc )
{
	local Name BoneName;
	local Pawn P;
	local SkeletalMeshActor SM;

	P = Pawn( HitActor );
	if( P != none )
	{
		BoneName = P.Mesh.GetBoneName( BoneIdx );
		BoneLoc = P.Mesh.GetBoneLocation( BoneName );
		return;
	}

	SM = SkeletalMeshActor( HitActor );
	if( SM != none )
	{
		BoneName = SM.SkeletalMeshComponent.GetBoneName( BoneIdx );
		BoneLoc = SM.SkeletalMeshComponent.GetBoneLocation( BoneName );
		return;
	}
}

/** Clears physics/collision vars */
simulated function StopMovement()
{
	SetPhysics(PHYS_None);

	// turning off collision on server can prevent projectile from hitting/sticking to anything on the client

    //SetCollision( false, false );
	//bCollideWorld = false;
}

/** Resets physics/collision vars to defaults */
simulated function RestartMovement()
{
	PrevStuckToActor = StuckToActor;

	StuckToActor = none;
	StuckToBoneIdx = INDEX_NONE;

	StuckToLocation = vect(0,0,0);
	StuckToRotation = rot(0,0,0);

	SetBase( none );
	SetPhysics( default.Physics );

	bReplicateMovement = true;

	// turning off collision on server can prevent projectile from hitting/sticking to anything on the client

    //SetCollision( default.bCollideActors, default.bBlockActors );
	//bCollideWorld = default.bCollideWorld;
}

/** Causes charge to explode */
function Detonate()
{
	local vector ExplosionNormal;

	ExplosionNormal = vect(0,0,1) >> Rotation;
	Explode( Location, ExplosionNormal );
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		BlinkOff();
	}

	super.Explode( HitLocation, HitNormal );
}

simulated function Disintegrate( rotator InDisintegrateEffectRotation )
{
	local KFWeap_Thrown_C4 C4WeaponOwner;

	if( Role == ROLE_Authority )
    {
    	C4WeaponOwner = KFWeap_Thrown_C4( Owner );
    	if( C4WeaponOwner != none )
    	{
    		C4WeaponOwner.RemoveDeployedCharge(, self);
    	}
    }

    if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		BlinkOff();
	}

    super.Disintegrate( InDisintegrateEffectRotation );
}

// for nukes && concussive force
simulated protected function PrepareExplosionTemplate()
{
    local KFPlayerReplicationInfo InstigatorPRI;

    if( WorldInfo.TimeDilation < 1.f && Instigator != none )
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
	StuckToBoneIdx=INDEX_NONE

	Physics=PHYS_Falling
	MaxSpeed=1200.0
	Speed=1200.0
	TossZ=100
	GravityScale=1.0

	LifeSpan=0

	bBounce=true
	GlassShatterType=FMGS_ShatterDamaged

	ExplosionActorClass=class'KFExplosionActorC4'

	DamageRadius=0

	bCollideComplex=true

	bIgnoreFoliageTouch=true

	bBlockedByInstigator=false
	bAlwaysReplicateExplosion=true

	bNetTemporary=false

	bCanBeDamaged=true
	bCanDisintegrate=true
	Begin Object Name=CollisionCylinder
		BlockNonZeroExtent=false

		// for siren scream
		CollideActors=true
	End Object

	AlwaysRelevantDistanceSquared=6250000 // 25m, same as grenade

	AltExploEffects=KFImpactEffectInfo'WEP_C4_ARCH.C4_Explosion_Concussive_Force'

	// blink light
	Begin Object Class=PointLightComponent Name=BlinkPointLight
	    LightColor=(R=255,G=63,B=63,A=255)
		Brightness=4.f
		Radius=300.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
		Translation=(X=8, Z=4)
	End Object
	BlinkLightComp=BlinkPointLight
	Components.Add(BlinkPointLight)

	// projectile mesh (use this instead of ProjEffects particle system)
	Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
		StaticMesh=StaticMesh'WEP_3P_C4_MESH.Wep_C4_Projectile'
		bCastDynamicShadow=FALSE
		CollideActors=false
		LightingChannels=(bInitialized=True,Dynamic=True,Indoor=True,Outdoor=True)
	End Object
	ChargeMesh=StaticMeshComponent0
	Components.Add(StaticMeshComponent0)

	// explosion light
	Begin Object Class=PointLightComponent Name=ExplosionPointLight
	    LightColor=(R=252,G=218,B=171,A=255)
		Brightness=4.f
		Radius=2000.f
		FalloffExponent=10.f
		CastShadows=False
		CastStaticShadows=FALSE
		CastDynamicShadows=False
		bEnabled=FALSE
		LightingChannels=(Indoor=TRUE,Outdoor=TRUE,bInitialized=TRUE)
	End Object

	// explosion
	Begin Object Class=KFGameExplosion Name=ExploTemplate0
		Damage=820.000000
	    DamageRadius=800.000000
		DamageFalloffExponent=2.f
		DamageDelay=0.f

		// Damage Effects
		MyDamageType=class'KFDT_Explosive_C4'
		KnockDownStrength=0
		FractureMeshRadius=200.0
		FracturePartVel=500.0
		ExplosionEffects=KFImpactEffectInfo'WEP_C4_ARCH.C4_Explosion'
		ExplosionSound=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Explosion'

        // Dynamic Light
        ExploLight=ExplosionPointLight
        ExploLightStartFadeOutTime=0.0
        ExploLightFadeOutTime=0.2

		// Camera Shake
		CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
		CamShakeInnerRadius=450
		CamShakeOuterRadius=900
		CamShakeFalloff=1.f
		bOrientCameraShakeTowardsEpicenter=true
	End Object
	ExplosionTemplate=ExploTemplate0

	ImpactEffectInfo=KFImpactEffectInfo'WEP_C4_ARCH.C4_Projectile_Impacts'

	ProjDisintegrateTemplate=ParticleSystem'ZED_Siren_EMIT.FX_Siren_grenade_disable_01'

	StickAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Handling_Place'
	ProximityAlertAkEvent=AkEvent'WW_WEP_EXP_C4.Play_WEP_EXP_C4_Prox_Beep'
	ProximityAlertInterval=1.0
	ProximityAlertIntervalClose=0.5

	BlinkTime=0.2f
	BlinkColorOff=(R=0, G=0, B=0)
	BlinkColorOn=(R=1, G=0, B=0)

	BlinkFX=ParticleSystem'WEP_C4_EMIT.FX_C4_Glow'
}
