//=============================================================================
// KFMeleeHelperAI
//=============================================================================
// Manages melee attack related functionality for AI controlled pawns
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFMeleeHelperAI extends KFMeleeHelperBase within Actor
	native;

/** The default damage applied to each melee hit **/
var() float						BaseDamage;
/** Default DamageType class */
var() const class<KFDamageType> MyDamageType;
/** how much knockback an attack could cause */
var() float						MomentumTransfer;

/** Struct to keep track of the actors we hit with the move and when it happened */
struct native SwipeHitActorData
{
	/** The actor who was hit */
	var transient KFPawn HitActor;
	/** Last time the actor was hit */
	var transient float LastHitTime;
};

/** List of actors hit by a swipe attack (see UpdateStabbedActors) */
var transient array<SwipeHitActorData> SwipedActors;
/** If set, track all swiped actors to prevent giving damage too frequently */
var bool bTrackSwipeHits;

/*********************************************************************************************
 * Player ping compensation
 *********************************************************************************************/

struct native DelayedMeleeInfo
{
	var Pawn	Victim;
	var int		Damage;
	var float	Momentum;
	var float	TimeOfDamage;
};

/** Cached damage values */
var array<DelayedMeleeInfo> PendingDamage;

/** Upper limit (in ms) for Ping compensation */
var int		MaxPingCompensation;
/** Artificial fudge factor to find the sweet spot for online play */
var float	PingCompensationScale;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/*********************************************************************************************
 * Common (Public)
 *********************************************************************************************/

/** 
 * Deals melee damage to a target actor
 * @param Victim			Target actor to recieve damage
 * @param Damage			Damage to apply if this attack is successful
 * @param HitLocation		Location to apply damage to on the target actor
 * @param MomentumScalar	Momentum transfer to apply if this attack is successful
 * @param DamageType		DamageType to apply if this attack is successful
 */
function ApplyMeleeDamage(Actor Victim, int Damage, optional float InMomentum=1.f, optional class<KFDamageType> InDamageType=MyDamageType)
{
	local vector HitLocation, HitDirection;
	local KFPawn_Monster InstigatorPawn;

	// bump the hit location so that TakeHitInfo will replicate
	HitLocation = Victim.Location;
	HitLocation.Z += FRand();
	HitDirection = Normal(HitLocation - Instigator.Location);
	
	// After modifiers are applied, ensure damage is never zero
	Damage = Max(Damage, 1);
	Victim.TakeDamage(Damage, Instigator.Controller, HitLocation, HitDirection * InMomentum, InDamageType,, Outer );

	// play camera shake, etc...
	PlayMeleeHitEffects(Victim, HitLocation, HitDirection);

	InstigatorPawn = KFPawn_Monster(Instigator);
	if ( InstigatorPawn != none )
	{
		// Notify AIC.  After TakeDamage so we can review damage results
		InstigatorPawn.MyKFAIC.NotifyMeleeDamageDealt();
	}

	if (bLogMelee) LogInternal(Victim$"**** Melee attack!  BaseDamage="@BaseDamage@", ModifiedDamage="@Damage);
}

/** Simplified version of RateMeleeVictim designed for any actor type */
function bool ShouldDealDamageToEnemy(Actor Target, optional float Range=MaxHitRange)
{
	local Vector VectToEnemy, HitLoc, HitNormal;
	local Actor HitActor;
	local TraceHitInfo	HitInfo;
	local vector TraceOffset;

	// Enemy must not be too far
	VectToEnemy = Target.Location - Location;
	if( VSizeSq(VectToEnemy) > Square(Range) )
	{
		return FALSE;
	}

	// must be somewhat facing enemy
	if( Normal(VectToEnemy) dot Vector(Instigator.Rotation) < 0.0f )
	{
		return FALSE;
	}

	// Trace world and block iff block actors is set (ignore CanBecomeDynamic actors)
	HitActor = Trace(HitLoc, HitNormal, Target.Location, Location, false,, HitInfo);
	if( HitActor != None && HitInfo.HitComponent != None && HitInfo.HitComponent.BlockActors )
	{
		// Try again at the EyeHeight - Both must fail to obstruct damage
		TraceOffset = Instigator.BaseEyeHeight * vect(0,0,1);
		HitActor = Trace(HitLoc, HitNormal, Target.Location + TraceOffset, Location + TraceOffset, false,, HitInfo);
		if( HitActor != None && HitInfo.HitComponent != None && HitInfo.HitComponent.BlockActors )
		{
			return FALSE;
		}
	}

	return TRUE;
}

/*********************************************************************************************
 * Area Hit Detection
 *********************************************************************************************/

/** 
 * Do damage to multiple targets around the character 
 * @param Damage			Damage to apply if this attack is successful
 * @param MomentumScalar	Momentum transfer to apply if this attack is successful
 * @param DamageType		DamageType to apply if this attack is successful
 * @param Range				Maximum range for hit detection
 * @param InFOVCosine		Maximum FOV for hit detection.  If 0, allows any angle (360 degrees)
 * @param bPlayersOnly		If true, skip non-player controlled pawns
 */
function bool DoAreaImpact(
			 int				 Damage, 
	optional float				 MomentumScalar=1.f, 
	optional class<KFDamageType> DamageType=MyDamageType, 
	optional float				 Range=MaxHitRange, 
	optional float				 InFOVCosine=0.f,
	optional bool				 bPlayersOnly)
{
	local KFPawn KFP;
	local bool bFoundHit;

	// @note - At low ranges CollidingActors (no VisibleCollidingActors) is okay, 
	// but AllPawns is constant and much faster 99% of the time.
	foreach WorldInfo.AllPawns( class'KFPawn', KFP, Location, Range )
	{
		if ( bPlayersOnly && !KFP.IsHumanControlled() )
			continue;

		if ( RateMeleeVictim(KFP, Location, KFP.Location, Range, InFOVCosine) > 0.f )
		{
			ApplyMeleeDamage(KFP, Damage, MomentumScalar, DamageType);
			bFoundHit = true;
		}
	}

	return bFoundHit;
}

/*********************************************************************************************
 * Anim Notify Handling
 *********************************************************************************************/

/** Notification called from KFAnimNotify_MeleeImpact. */
function MeleeImpactNotify(KFAnimNotify_MeleeImpact Notify)
{
	local KFAIController KFAIC;
	local float MomentumScalar;
	local bool bDealtDmg;

	MomentumScalar = Notify.bCanDoKnockback ? MomentumTransfer : 1.f;

	KFAIC = KFAIController(Instigator.Controller);
	// TODO: Get more accurate target from MeleeAttack command
	if( KFAIC != none && (KFAIC.DoorEnemy != none || KFAIC.ActorEnemy != none) )
	{
		bDealtDmg = CheckEnemyImpact(Notify.DamageScale * BaseDamage, MomentumScalar);
	}
	else if ( Notify.bDoAreaDamage )
	{
		bDealtDmg = DoAreaImpact(Notify.DamageScale * BaseDamage, MomentumScalar);
	}
	else if ( Notify.bDoSwipeDamage )
	{
		bDealtDmg = DoSwipeImpact(Notify.DamageScale * BaseDamage, Notify.SwipeDirection, MomentumScalar);
	}
	else
	{
		bDealtDmg = CheckEnemyImpact(Notify.DamageScale* BaseDamage, MomentumScalar);
	}

	if ( bDealtDmg && Notify.bCanCauseZedTime )
	{
		KFGameInfo(WorldInfo.Game).DramaticEvent(0.03);
	}
}

/** Do damage directly to AI Controller Enemy 
 * @param Damage			Damage to apply if this attack is successful
 * @param MomentumScalar	Momentum transfer to apply if this attack is successful
 * @param DamageType		DamageType to apply if this attack is successful
 * @param Range				Maximum range for hit detection
 */
protected function bool CheckEnemyImpact(int Damage, float MomentumScalar)
{
	local KFAIController AIC;

	AIC = KFAIController(Instigator.Controller);

	if ( AIC != None )
	{
		if ( AIC.Enemy != None && ShouldDealDamageToEnemy(AIC.Enemy) )
		{
			ResolvePawnMeleeDamage(AIC.Enemy, Damage, MomentumScalar);
			return true;
		}
		else if ( AIC.DoorEnemy != None && (VSizeSq(Location - AIC.DoorEnemy.Location) < Square(500)) )
		{
			ApplyMeleeDamage(AIC.DoorEnemy, Damage, MomentumScalar);
			return true;
		}
		else if ( AIC.ActorEnemy != None && (VSizeSq(Location - AIC.ActorEnemy.Location) < Square(500)) )
		{
			// Apply damage to KFDestructibleActors, see KFDestructibleActor.TakeDamage() where there's special
			// handling to insta-kill the destructible if the attacker is a NPC with the destructible as the
			// NPC's ActorEnemy.
			if( KFDestructibleActor(AIC.ActorEnemy) != none )
			{
				ApplyMeleeDamage(AIC.ActorEnemy, Damage, MomentumScalar);
				return true;
			}
		}
	}

	return false;
}

/*********************************************************************************************
 * Swipe Hit Detection
 *********************************************************************************************/

/** A modified Cone hit detection that keeps track of all actors that have been hit 
 * @param Damage			Damage to apply if this attack is successful
 * @param SwipeDir			Direction to use for hit detection
 * @param MomentumScalar	Momentum transfer to apply if this attack is successful
 * @param DamageType		DamageType to apply if this attack is successful
 * @param Range				Maximum range for hit detection
 * @param bPlayersOnly		If true, skip non-player controlled pawns
 */
protected function bool DoSwipeImpact(
			 int					Damage, 
	optional EPawnOctant			SwipeDir=DIR_Forward, 
	optional float					MomentumScalar=1.f, 
	optional float					Range=MaxHitRange,
	optional bool					bPlayersOnly)
{
	local Pawn P;
	local vector ConeDir, ConeStart;
	local float ConeRange;
	local bool bFoundHit;

	// initialize cone collision
	ConeDir = GetSwipeVector(SwipeDir);
	ConeStart = Location + vect(0,0,32);
	ConeRange = Range; // VSize(BladeEnd - BladeStart)

	if ( bLogMelee )
	{
		// draw swipe trace
		DrawDebugCone(ConeStart, ConeDir, ConeRange, Acos(0.7071f), Acos(0.7071f), 16, MakeColor(64,64,64,0), TRUE);
	}

	// @perf - AllPawns is ~ 10X faster than VisibleCollidingActors, 10X TraceActors, 2X CollidingActors
	// - Use AllPawns when we only need pawn collision (fixed cost at any range)
	// - Use CollidingActors when we need to hit pawns and/or world objects
	// - Use TraceActors sparingly! (may give better results than CollidingActors)
	// - Avoid VisibleCollidingActors (RateMeleeVictim handles this)
	foreach WorldInfo.AllPawns( class'Pawn', P, Location, ConeRange )
	{
		if ( P == Instigator || P.bTearOff )
			continue;
		if ( bPlayersOnly && !P.IsHumanControlled() )
			continue;

		// Make sure victim is in FOV
		if( Normal2D(P.Location - ConeStart) dot ConeDir < 0.7071f )
		{
			if (bLogMelee) LogInternal("rejected:"@P@"dot:"@Normal(P.Location - ConeStart) dot ConeDir);
			continue;
		}
		// Don't let them melee the target through a wall
		if( !FastTrace(P.Location, Location) )
		{
			if (bLogMelee) LogInternal(GetFuncName()@"rejected:"@P@"melee obstruction: ");
			continue;
		}

		ProcessSwipeHit(P, Damage, MomentumScalar);
		bFoundHit = true;
	}

	if ( bLogMelee && bFoundHit )
	{
		// draw swipe hit
		DrawDebugCone(ConeStart, ConeDir, ConeRange, Acos(0.7071f), Acos(0.7071f), 16, MakeColor(255,0,0,255), TRUE);
	}

	return bFoundHit;
}

/** Returns hard-coded normal vectors for each 8-way swipe direction */
protected function vector GetSwipeVector(EPawnOctant SwipeDir)
{
	local rotator R;

	switch (SwipeDir)
	{
		case DIR_ForwardLeft:	R = rot(0,-8192,0); break;
		case DIR_Left:			R = rot(0,-16384,0); break;
		case DIR_BackwardLeft:	R = rot(0,-24576,0); break;
		case DIR_ForwardRight:	R = rot(0,8192,0); break;
		case DIR_Backward:		R = rot(0,32768,0); break;		
		case DIR_BackwardRight: R = rot(0,24576,0); break;		
		case DIR_Right:			R = rot(0,16384,0); break;
	}

	return vector(Rotation + R);
}

/**
 * DoSwipeFire found a hit, now cause damage to it.
 * @param A				 - the actor that was hit in the swipe
 * @param Damage		 - amount of damage to apply if successful
 * @param InHitLoc		 - Location of hit detection result
 * @param MomentumScalar - Amount of momentum to apply if successful
 * @param DamageType	 - DamageType to apply if successful
 */
protected function ProcessSwipeHit(Actor A, int Damage, float MomentumScalar)
{
	local KFPawn Victim;
	local int ListIdx;

	Victim = KFPawn(A);

	if (Victim == None )
	{
		return;
	}

	// Track player hits to ignore overlaps in hit detection
	if ( bTrackSwipeHits && A.IsA('KFPawn_Human') )
	{
		// See if this actor is already in the list
		ListIdx = SwipedActors.Find('HitActor', Victim);

		// Not in the list
		if (ListIdx == INDEX_NONE)
		{
			// Add this actor to the list and mark them for damage
			ListIdx = SwipedActors.Add(1);
			SwipedActors[ListIdx].HitActor = Victim;
			SwipedActors[ListIdx].LastHitTime = WorldInfo.TimeSeconds;
		}
		// In the list so see if we need to reset the time and do damage
		else if ( (WorldInfo.TimeSeconds - SwipedActors[ListIdx].LastHitTime) > 0.25f )
		{
			SwipedActors[ListIdx].LastHitTime = WorldInfo.TimeSeconds;
		}
		else
		{
			//`log("Swipe damage ignored (interval too short)"@A);
			return;
		}
	}

	ResolvePawnMeleeDamage(Victim, Damage, MomentumScalar);
}

/*********************************************************************************************
 * Ping Compensation for Parry/Block
 *********************************************************************************************/

/** handle ping compensation before dealing damage */
protected function ResolvePawnMeleeDamage(Pawn Victim, int Damage, float Momentum)
{	
	local DelayedMeleeInfo NewDmgInfo;
	local float RealDeltaSeconds;
	local float PingCompensation;

	if ( Instigator.Role < ROLE_Authority )
	{
		return; // how did we get here?
	}

	// If necessary, apply ping compensation
	if ( Victim.PlayerReplicationInfo != None && Victim.Weapon != None && 
		ClassIsChildOf(Victim.Weapon.Class, class'KFWeap_MeleeBase') )
	{		
		// Calculate delay.  Half-ping for anim to reach client and half again for parry key press to reach server
		PingCompensation = Min(Victim.PlayerReplicationInfo.Ping * 4.f, MaxPingCompensation) / 1000.f;

		// artifically reduce the delay to balance parry timing vs. AI reaction time
		PingCompensation *= PingCompensationScale;

		// "round" (div by 2) to the closest frame on the server
		RealDeltaSeconds = WorldInfo.DeltaSeconds / WorldInfo.TimeDilation;
		PingCompensation -= (RealDeltaSeconds / 2.f);

		if ( PingCompensation > 0 )
		{
			NewDmgInfo.Victim = Victim;
			NewDmgInfo.Damage = Damage;
			NewDmgInfo.Momentum = Momentum;
			NewDmgInfo.TimeOfDamage = WorldInfo.RealTimeSeconds + PingCompensation;
			PendingDamage.AddItem(NewDmgInfo);
			return;
		}
	}

	ApplyMeleeDamage(Victim, Damage, Momentum);
}

/** Called from C++ when ping compensation expires */
event ApplyDelayedPawnDamage(int i)
{
	local KFGameReplicationInfo KFGRI;

	// If the damage dealer is now dead, don't allow damage after trader/respawn.
	if ( !Instigator.IsAliveAndWell() )
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		if ( KFGRI != None && KFGRI.bTraderIsOpen )
		{
			return;
		}
	}

	ApplyMeleeDamage(PendingDamage[i].Victim, PendingDamage[i].Damage, PendingDamage[i].Momentum);
}

defaultproperties
{
   MyDamageType=Class'KFGame.KFDT_Slashing'
   bTrackSwipeHits=True
   MaxPingCompensation=200
   PingCompensationScale=0.500000
   DefaultFOVCosine=0.000000
   MeleeVictimCamShake=CameraShake'KFGame.Default__KFMeleeHelperAI:MeleeImpactCamShake0'
   Name="Default__KFMeleeHelperAI"
   ObjectArchetype=KFMeleeHelperBase'KFGame.Default__KFMeleeHelperBase'
}
