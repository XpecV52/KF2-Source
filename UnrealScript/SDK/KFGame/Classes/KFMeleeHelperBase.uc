//=============================================================================
// KFMeleeHelperBase
//=============================================================================
// Contains common solutions for melee hit detection and Effects
// @note - Uses "within actor" and instigator so that this object can be
//	associated with either a Pawn or a Weapon.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFMeleeHelperBase extends Object within Actor
	dependson(KFAnimNotify_MeleeImpact)
	native
	config(Game);

/// ABOUT HIT DETECTION
/** #1 FOV (aka Area, Cone) Hit Detection
 * @brief: Optimized method that iterates through pawns and rates them based on 
 *		distance to the center of the cone.  Highly flexible, works well for single 
 *		impact weapons (e.g. pistol whip). Single or multiple targets.
 * @see: FindVictimByFOV, RateMeleeVictim, TraceMeleeAttackHitZones
 */
/** #2 Weapon Instant Trace
 * @brief: Similar to InstantFire used by guns, this is a zero-extent line trace usually to the
 *		center of the screen.  Works well for non critical impacts such as world geometry
 *		and ragdolls.  Single target only.
 * @see: DoWeaponInstantTrace
 */
/** #3 Hitbox Collision Detection
 * @brief: Advanced type that follows the attack animation with moving hit boxes.  Maintains a 
 *		list of actors that have been hit which resets with each new attack.  Multiple targets.
 * @see: TickHitboxCollisionDetection, ProcessHitboxCollision
 */
/** #4 Enemy (aka Direct) Impact
 * @brief: AI can directly damage their target Enemy after some basic validation.
 * @see: CheckEnemyImpact
 */
/** #5 Swipe Hit Detection
 * @brief: A hybrid of FOV collision and Hitbox collision that can be used to hit multiple
 *	targets over a time interval with.  Multiple targets.
 * @see: DoSwipeImpact
 */

/*********************************************************************************************
 * FOV (aka Area, Cone) Hit Detection
 *********************************************************************************************/

/** The maximum rrange at which this attack can be used **/
var() const float		MaxHitRange;
/** Optional dot product check for melee hit detection */
var() const float		DefaultFOVCosine;

/*********************************************************************************************
 * Hitbox Collision Detection
 *********************************************************************************************/

struct native MeleeHitboxInfo
{
	var vector BoneOffset;
	var vector LastLoc;
};

var const array<MeleeHitBoxInfo> HitboxChain;

/** Trace extent used for all hitboxes */
var vector	HitboxExtent;
/** Distance between each new hitbox */
var float	HitboxSpacing;
/** Name of the bone to start the hitbox chain from */
var name	HitboxBoneName;
/** Direction along the bone to create the hitbox chain */
var EAxis	HitboxBoneAxis;

/** If true, use TRACE_ComplexCollision */
var bool bHitboxCollideComplex;
/** If true, only the last hitbox uses extent trace collision */
var bool bOnlyUseHitboxExtentAtHead;
/** If true, perform an extra "fasttrace" before damaging a pawn */
var bool bDoHitboxObstructionTrace;
/** If true, hitboxes only collide with pawns */
var bool bHitboxPawnsOnly;

/** Cached list of actors that have collided with this attack */
var const array<Actor> ActorsCollidedWith;

/*********************************************************************************************
 * Impact effects
 *********************************************************************************************/

/** This is the camera shake that we play when we hit a melee attack **/
var() const CameraShake MeleeVictimCamShake;

/**	If TRUE, meleeing a FSM with this weapons will cause fracture. */
var bool bAllowMeleeToFracture;
/** If TRUE, this attack animation already hit something */
var bool bHasAlreadyHit;

/*********************************************************************************************
* Debug
 ********************************************************************************************* */

// `log conditions.  More efficient than using log tags, because the msg is not evaluated.
var bool bLogMelee;
var bool bDebugShowCollision;

/*********************************************************************************************
 * C++
 *********************************************************************************************/

cpptext
{
}

/**
 * Returns the location that should be the start of traces for MeleeAttackImpact()
 */
simulated function vector GetMeleeStartTraceLocation()
{
	// use eye location instead of GetWeaponStartTraceLocation so it works in third person
	return Instigator.Location + vect(0,0,1) * Instigator.BaseEyeHeight;
}

/**
 * Returns the default melee attack hit detection range for this helper
 */
simulated function float GetMeleeRange()
{
	return MaxHitRange;
}

/**
 * Separate check for destructible objects, fixes issues with notifies/delays/etc.	Only
 * attack an object once per swing, etc.
 */
function bool MeleeAttackDestructibles()
{
}

/** Use the currently equipped weapon to perform a InstantFire() like line trace */
function DoWeaponInstantTrace(vector StartTrace, vector EndTrace, optional out ImpactInfo out_Impact)
{
	if ( Instigator != None && Instigator.Weapon != None )
	{
		out_Impact = Instigator.Weapon.CalcWeaponFire(StartTrace, EndTrace);
	}
}

/*********************************************************************************************
 * FOV (aka Area, Cone) Hit Detection
 *********************************************************************************************/

/** Returns a victim used to apply melee damage to */
simulated function KFPawn FindVictimByFOV(vector StartTrace, vector EndTrace, optional float Range=MaxHitRange, optional float FOVCosine=DefaultFOVCosine, optional out array<KFPawn> VictimList, optional bool bGetMultipleTargets)
{
	local KFPawn			KFP, BestVictim;
	local float				NewRating, BestRating;

	BestRating = 0.f;

	// @perf - AllPawns is ~ 10X faster than VisibleCollidingActors, 10X TraceActors, 2X CollidingActors
	// - Use AllPawns when we only need pawn collision (fixed cost at any range)
	// - Use CollidingActors when we need to hit pawns and/or world objects
	// - Use TraceActors sparingly! (may give better results than CollidingActors)
	// - Avoid VisibleCollidingActors (RateMeleeVictim handles this)
	foreach WorldInfo.AllPawns( class'KFPawn', KFP, StartTrace, Range )
	{
		NewRating = RateMeleeVictim(KFP, StartTrace, EndTrace, Range, FOVCosine, bGetMultipleTargets ? 0.f : BestRating);
		if ( NewRating > BestRating )
		{
			BestVictim = KFP;
			BestRating = NewRating;
		}

		// If we're returning multiple targets, then add it to the list
		if ( bGetMultipleTargets && NewRating > 0 )
		{
			VictimList[VictimList.Length] = KFP;
		}
	}

	if( bLogMelee )
	{
		DrawDebugCone(StartTrace, EndTrace - StartTrace, Range, Acos(FOVCosine), Acos(FOVCosine), 16, MakeColor(64,64,64,255), TRUE);
	}

	return BestVictim;
}

/** Returns a victim used to apply melee damage to */
simulated function float RateMeleeVictim(KFPawn Victim, vector StartTrace, vector EndTrace, float Range, float FOVCosine, optional float RatingToBeat)
{
	local float VictimRating;
	local vector VictimLocation, DirToVictim, AimDir;

	// First make sure Pawn is relevant (ie not dead)
	if ( Victim == Instigator || Victim.bDeleteMe || Victim.bTearOff )
		return -1.f;

	`log("Melee considering:"@Victim, bLogMelee);

	// Discard if the z-distance is too great
	VictimLocation = Victim.GetMeleeHitTestLocation();
	if ( Abs(VictimLocation.Z - Instigator.Location.Z) > Instigator.CylinderComponent.CollisionHeight * 1.5 )
	{
		`log("rejected within vertical melee range", bLogMelee);
		return -1.f;
	}

	// Add the victim's CollisionRadius - Gives better results (closer to CalcWeaponFire).
	Range += Victim.CylinderComponent.CollisionRadius;

	// Discard if the best victim is closer
	VictimRating = (Range * Range) - VSizeSq2D(VictimLocation - StartTrace);
	if ( VictimRating < RatingToBeat )
	{
		`log("rejected victim with lower rating", bLogMelee);
		return -1.f;
	}

	// If our check FOV is a cone, then perform a simple dot product
	if( FOVCosine > 0.f )
	{
		AimDir = Normal(EndTrace - StartTrace);

		// Make sure victim is in FOV
		if( Normal(VictimLocation - StartTrace) dot AimDir < FOVCosine )
		{
			`log("rejected:"@Victim@"dot:"@DirToVictim dot AimDir, bLogMelee);
			return -1.f;
		}
	}

	// Finally trace to make sure there are no obstructions. ie acquiring someone through a wall
	if ( !FastTrace(EndTrace, StartTrace) )
	{
		`log("rejected:"@Victim@"melee obstruction: ", bLogMelee);
		return -1.f;
	}

	return VictimRating;
}

/**
 * Brute force method to find a valid ImpactList for this victim.
 */
simulated function bool TraceMeleeAttackHitZones(KFPawn KFP, vector StartTrace, vector EndTrace, optional out ImpactInfo out_Impact, optional name BoneName)
{
	local array<ImpactInfo> ImpactList;

	// if we have a bone name (e.g zero-extent hitboxes) we can improve the results by using the bone loc
	if ( BoneName != '' )
	{
		EndTrace = KFP.Mesh.GetBoneLocation(BoneName);
	}

	// First, trace once along the supplied vector to try and find a hit zone
	if ( !TraceAllPhysicsAssetInteractions(KFP.Mesh, EndTrace, StartTrace, ImpactList, vect(0,0,0), true) )
	{
		// As a fallback trace to a generic location on the mesh
		if ( KFP.TorsoBoneName != '' )
		{
			EndTrace = KFP.Mesh.GetBoneLocation(KFP.TorsoBoneName);
		}
		else
		{
			EndTrace = KFP.Location;
		}

		TraceAllPhysicsAssetInteractions(KFP.Mesh, EndTrace, StartTrace, ImpactList, vect(0,0,0), true);
	}

	if ( ImpactList.Length > 0 )
	{
		out_Impact = ImpactList[0];
		return true;
	}

	return false;
}

/*********************************************************************************************
 * Hitbox Collision Detection
 *********************************************************************************************/

/** Called from NotifyTick to trace along each hitbox */
native function TickHitboxCollisionDetection(SkeletalMeshComponent SkelComp, float DeltaTime);
/** Called from Notify to initialize hitbox settings */
native function BeginHitboxCollisionDetection(SkeletalMeshComponent SkelComp);
/** Called once to place hitboxes */
native function CreateHitboxChain(SkeletalMeshComponent SkelComp);
/** returns true if a new actor was successfully added */
//native function bool AddHitboxCollidingActor(Actor A);
native function bool HasCollidedWithHitbox(Actor A);

/** Recieve collision event and register impact with CSHD */
event ProcessHitboxCollision(Actor HitActor, vector StartTrace, vector EndTrace, vector HitLocation, vector HitNormal, const out TraceHitInfo HitInfo, optional out ImpactInfo Impact)
{
	if( HitActor == None )
	{
		return;
	}	

	// Convert Trace Information to ImpactInfo type.
	Impact.HitActor		= HitActor;
	Impact.HitLocation	= HitLocation;
	Impact.HitNormal	= HitNormal;
	Impact.RayDir		= Normal(EndTrace-StartTrace);
	Impact.StartTrace	= StartTrace;
	Impact.HitInfo		= HitInfo;

	`log(GetFuncName()@HitActor@HitInfo.Item@HitInfo.BoneName, bLogMelee);
}

/** Called when a hitbox notify starts to allow script to perform a custom world trace */
event InitWorldTraceForHitboxCollision();

/*********************************************************************************************
 * Impact FX
 *********************************************************************************************/

/**
 * Called by ProcessMeleeHit to spawn effects
 * Network: Local Player and Server
 */
simulated function PlayMeleeHitEffects(Actor Target, vector HitLocation, vector HitDirection)
{
	local Pawn Victim;
	local PlayerController PC;

	// if we hit a pawn
	if ( Target.IsA('Pawn') )
	{
		Victim = Pawn(Target);

		// shake victim (Server)
		if( Victim != None && Victim.Controller != None )
		{
			PC = PlayerController(Victim.Controller);
			if( PC != None )
			{
				PC.ClientPlayCameraShake(MeleeVictimCamShake, 1.f, true);
			}
		}
	}
}

defaultproperties
{
	bAllowMeleeToFracture=true

	Begin Object Class=CameraShake Name=MeleeImpactCamShake0
		OscillationDuration=0.35f
		RotOscillation={(Pitch=(Amplitude=250.f,Frequency=60.f),
						Yaw=(Amplitude=150.f,Frequency=70.f),
						Roll=(Amplitude=150.f,Frequency=100.f))}
	End Object
	MeleeVictimCamShake=MeleeImpactCamShake0

	DefaultFOVCosine=0.6f
	MaxHitRange=150

	//HitboxExtent=(X=8,Y=8,Z=8)
	HitboxSpacing=30
	HitboxBoneName=RW_Damage
	HitboxBoneAxis=AXIS_Z
	bDoHitboxObstructionTrace=TRUE
	//bDebugShowCollision=TRUE
}
