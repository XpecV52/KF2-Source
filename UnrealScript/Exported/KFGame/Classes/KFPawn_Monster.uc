//=============================================================================
// KFPawn_Monster
//=============================================================================
// Base pawn class for Zeds
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPawn_Monster extends KFPawn
	abstract
	nativereplication
	native(Pawn)
	dependson(KFPawnAnimInfo, KFPawnVoiceGroup, KFPawnVoiceGroupEventData, KFSpawnVolume);







	







	 



		
		
	







 
















 
































































































































































































































#linenumber 70;

#linenumber 17;































































































	















#linenumber 18;

/************************************
 * @name	Ephemeral Stats Tracking
 ************************************/

var bool bLargeZed;

/************************************
 * @name	Spawning vars
 ************************************/
/** Default content loaded by this pawn.  Private, use 'GetCharacterMonsterInfo' */
var private const KFCharacterInfo_Monster CharacterMonsterArch;

var const bool bForceUseOfDebugCharInfo;
var private const KFCharacterInfo_Monster CharacterMonsterArchDebug;

/*********************************************************************************************
 * @name	Combat
********************************************************************************************* */

/** The chance that this monster pawn will sprint */
var(Combat) float	SprintChance;
var(Combat) bool	bCanGrabAttack;
/** Odds (0-1) of evaluating whether to do a grab attack instead of a basic melee attack */
var(Combat) float	GrabAttackFrequency;
var(Combat) bool	bCanMeleeAttack;

/** Time until death after head is taken off */
var(Combat) float	HeadlessBleedOutTime;
/** Enables crippled animation and behavior state */
var	repnotify bool	bIsHeadless;

/** If > 0, clientside head injury gore can be applied while still alive */
var byte MaxHeadChunkGoreWhileAlive;

/** Object within weapon that manages melee attacks */
var(Weapon) instanced KFMeleeHelperAI MeleeAttackHelper;

var protected 	bool 	bHasReducedMeleeDamage;

/** Total dosh this monster is worth on kill */
var private const	int		DoshValue;
/** XP this monster is worth (per difficulty) */
var private const 	float	XPValues[4];

/** Information on vulnerable damage types */
struct native VulnerableDamageTypeInfo
{
    /** A damage type to modify damage to this zed when it is recieved */
	var() class<DamageType> DamageType;
	/** How much to modify damage to this zed from the specific damage type*/
    var() float DamageScale;

	structdefaultproperties
	{
        DamageScale=2.f
	}
};

/** These damage types do increased damage */
var const array< VulnerableDamageTypeInfo > VulnerableDamageTypes;


/** Information on vulnerable damage types */
struct native ResistantDamageTypeInfo
{
    /** A damage type to modify damage to this zed when it is recieved */
	var() class<DamageType> DamageType;
	/** How much to modify damage to this zed from the specific damage type*/
    var() float DamageScale;

	structdefaultproperties
	{
        DamageScale=0.5f
	}
};
/** These damage types do reduced damage */
var const array< ResistantDamageTypeInfo > ResistantDamageTypes;

/** The amount to scale damage dealt by the fleshpound */
var float ZedBumpDamageScale;

var bool 	bShowHealth;

/** Set only while inside AdjustDamage when calculating extra head explosion damage*/
var transient bool bCheckingExtraHeadDamage;

/*********************************************************************************************
 * @name	Hit Reactions
********************************************************************************************* */

/** Settings for the slowed down incapacitation effect */
const SLOW_SPEED_MOD = 0.8f;

/** Resistance value for special move reaction to being parried */
var byte ParryResistance;

/** true if we currently incap poisoned */
var repnotify bool 	bIsPoisoned;

/** Is microwave panic active? (server only) */
var bool 	bMicrowavePanicked;
/** Replicated material parameter */
var repnotify byte	RepInflateMatParam;

/** Cached health before taking damage for status effect resistance */
var transient int OldHealth;

/*********************************************************************************************
 * @name	Anim Tree Controls
********************************************************************************************* */

/* Plays panicked animation (e.g. On Fire, Poisoned) */
var bool bPlayPanicked;
/* Plays shambling animation (e.g. Headless, EMP) */
var bool bPlayShambling;

/** Cached anim nodes */
var KFAnim_RandomScripted WalkBlendList;

/*********************************************************************************************
 * @name	Special Abilities
********************************************************************************************* */

/** This monster has the capability to sprint in general */
var				bool	bCanSprint;
/** This monster has the capability to sprint when damaged */
var				bool	bCanSprintWhenDamaged;
/** This monster's ability to sprint is currently disabled */
var             bool    bSprintingDisabled;
var				float	KnockedDownBySonicWaveOdds;
var				bool	bCanCloak;
var	repnotify	bool	bIsCloaking;
var				bool	bIsCloakingSpottedByLP;
var	repnotify	bool	bIsCloakingSpottedByTeam;
var				float	LastSpottedStatusUpdate;

/*********************************************************************************************
 * @name	Perks
********************************************************************************************* */

var private 	bool 	bIsStalkerClass;
var private		bool 	bIsCrawlerClass;
var private		bool 	bIsFleshpoundClass;

/*********************************************************************************************
 * @name	Movement
********************************************************************************************* */

/** The difficulty adjusted original GroundSpeed for this character */
var transient float	NormalGroundSpeed;
/** Time interval for HiddenGroundSpeed check */
var	transient float	LastAISpeedCheckTime;
/** The last time this Zed was network relevant to someone, or had line of sight to someone */
var	transient float	LastLOSOrRelevantTime;
/** When true, will attempt to match player speed while in pursuit. Use only if you want to allow upperbody attacks while moving. */
var	bool		bMatchEnemySpeed;
/** Match enemy speed while in pursuit if enemy distance <= this value */
var	float		MatchEnemySpeedAtDistance;
/** Minimum speed of enemy required for me to begin matching speed */
var	float		MinimumEnemySpeedToMatch;
var	float		PursuitSpeedScale;
/** Scales distance threshold that enemy is considered reached */
var	float		ReachedEnemyThresholdScale;
/** Instead of scaling, will just use this value for reached checks, if value > 0 and using walking physics */
var	float		ReachedGoalThresh_Walking;
/** Instead of scaling, will just use this value for reached checks, if value > 0 and using spider physics */
var float		ReachedGoalThresh_Spider;
var	float		LastBumpTime;
/** Used as an optimization for zeds and limits how frequently NotifyBump will be called */
var float		BumpFrequency;
/** Set internally if pawn's collision size was modified at start of a jump */
var bool		bRestoreCollisionOnLand;

/** Damage type applied to destructible actors when bumped */
var class<KFDamageType> BumpDamageType;

/*********************************************************************************************
 * @name	Dismemberment / Gore
********************************************************************************************* */
 /** True if switched to Gore Skeleton/Physics Asset */
var const bool bIsGoreMesh;

/** The time when a gib last collided with something in the world (relative to WorldInfo.TimeSeconds) */
var transient float LastGibCollisionTime;

/** The explosion effect should only be played once */
var transient bool bPlayedExplosionEffect;

/** Information regardint the currently attached gore chunks */
struct native AttachedGoreChunkInfo
{
	var int AttachmentIndex;
	var StaticMeshComponent AttachedComponent;
};

/** The currently attached gore chunks */
var transient array<AttachedGoreChunkInfo> AttachedGoreChunks;

/** Keeps track of the number of head chunks removed for the ZED */
var transient int NumHeadChunksRemoved;

/** Keep track of the head bones that have already been broken */
var transient array<Name> BrokenHeadBones;

/** We got burned by another Zed, we shouldn't spread it further */
var bool bNapalmInfected;

/** Is there a chanced that we explode when we die? Set by the firebug's Zed shrapnel skill */
var bool bCouldTurnIntoShrapnel;
/*********************************************************************************************
 * @name	Dialog
********************************************************************************************* */
var transient int		DeadHorseHitStreakAmt;
var transient float		LastDeadHorseHitTime;

/*********************************************************************************************
 * @name	Debug
********************************************************************************************* */

var bool				bDebug_DrawOverheadInfo;
var bool				bDebug_DrawSprintingOverheadInfo;
var const bool			bDebug_UseIconForShowingSprintingOverheadInfo;

/*********************************************************************************************
 * @name	Door Navigation
********************************************************************************************* */

var float			    DefaultCollisionRadius;

var KFTrigger_ChokePoint  CurrentChokePointTrigger;

var bool                bReducedZedOnZedPinchPointCollisionStateActive;
var const float			CollisionRadiusForReducedZedOnZedPinchPointCollisionState;

/** Per hitzone incap effect resistances */
struct native DoorSoundFx
{
	var() AkEvent Metal;
	var() AkEvent Wood;
};

/*********************************************************************************************
 * @name	Spawning
********************************************************************************************* */

/** When spawning in a spawn volume, the squad type as to be at least this big (can be bigger
*   if there are other zeds in the spawn squad that are larger). */
var() ESquadType MinSpawnSquadSizeType;

/*********************************************************************************************
 * @name	Delegates
********************************************************************************************* */

/** Declaration for attach/detach gore chunk delegates */
simulated delegate bool GoreChunkAttachmentCriteria();
simulated delegate bool GoreChunkDetachmentCriteria();

replication
{
	// Replicated to ALL
	if (bNetDirty)
		bIsHeadless, bIsPoisoned, bPlayPanicked, bPlayShambling, MaxHeadChunkGoreWhileAlive,
		bShowHealth, RepInflateMatParam;
	if ( bNetDirty && bCanCloak )
		bIsCloaking, bIsCloakingSpottedByTeam;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function bool SpiderPhysicsWallAdjust( vector HitNormal, actor HitActor );
/** Tells the monster whether or not it should shrink its collision cylinder when going through a choke point */
native function SetChokePointCollision( bool bUseChokeCollision );
/** Checks if we are our current location encroaches any world geometry */
native function bool CheckEncroachingWorldGeometry();

/**
 * Check on various replicated data and act accordingly.
 */
simulated event ReplicatedEvent(name VarName)
{
	switch( VarName )
	{
	case nameof(bIsHeadless):
		StopAkEventsOnBone( 'head' );
        // No more auto aiming to this zed
        bCanBeAdheredTo=false;
        bCanBeFrictionedTo=false;
		break;

	case nameof(bIsPoisoned):
		AfflictionHandler.SetPoisoned(bIsPoisoned);
		break;

	case nameof(RepInflateMatParam):
		AfflictionHandler.SetMicrowaveParameter(ByteToFloat(RepInflateMatParam));
		break;
	}

	super.ReplicatedEvent( VarName );
}

/*********************************************************************************************
 * @name	Static
********************************************************************************************* */

// returns the zed's score/dosh value
simulated static function int GetDoshValue()
{
	return default.DoshValue;
}

simulated static function float GetXPValue(byte Difficulty)
{
	return default.XPValues[Difficulty];
}

/*********************************************************************************************
 * @name	Constructors, Destructors, and Loading
********************************************************************************************* */

/** Called immediately before gameplay begins */
simulated event PreBeginPlay()
{
	DefaultCollisionRadius = CylinderComponent.default.CollisionRadius;

	Super.PreBeginPlay();

	// If we don't have an archetype select one
	if ( CharacterArch == None )
	{
		if( bForceUseOfDebugCharInfo && CharacterMonsterArchDebug != none )
		{
			SetCharacterArch(CharacterMonsterArchDebug);
		}
		else if ( CharacterMonsterArch != None )
		{
			SetCharacterArch(CharacterMonsterArch);
		}
	}

	if ( CharacterArch == None )
	{
		WarnInternal("Failed to find character info for KFMonsterPawn!");
		Destroy();
	}
	NormalGroundSpeed = default.GroundSpeed;
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	local string NPCName;

	Super.PossessedBy( C, bVehicleTransition );

	/** Set MyKFAIC for convenience to avoid casting */
	if( KFAIController(C) != none )
	{
		MyKFAIC = KFAIController( C );
	}

	bReducedZedOnZedPinchPointCollisionStateActive = false;
	//CollisionRadiusBeforeReducedZedOnZedPinchPointCollisionState = CollisionCylinderReducedPercentForSameTeamCollision;

	// Turn off air control for AI because it can mess up landing.
	if( !IsHumanControlled() )
	{
		AirControl = AIAirControl;
		KFGameInfo(WorldInfo.Game).SetAIDefaults(self);
	}

	if( MyKFAIC.PlayerReplicationInfo != None )
	{
		NPCName = string(self);
		NPCName = Repl(NPCName,"KFPawn_Zed","",false);
		PlayerReplicationInfo.PlayerName = NPCName;
		MyKFAIC.PlayerReplicationInfo.PlayerName = NPCName;
	}
}

simulated event FellOutOfWorld(class<DamageType> dmgType)
{
	local string Msg;

	WarnInternal(self$" FELL OUT OF WORLD!");
	if( Health > 0 )
	{
		msg = WorldInfo.TimeSeconds@self@GetFuncName()@"fell out of world! Current location:"@Location;
		if( MyKFAIC != None )
		{
			msg = msg@"Controller:"@MyKFAIC@"active command:"@MyKFAIC.GetActiveCommand();
			if( MyKFAIC.MoveTarget != none )
			{
				msg = msg@"MoveTarget:"@MyKFAIC.MoveTarget;
			}
		}
		WarnInternal(msg);
	}
	super.FellOutOfWorld(dmgType);
}

event BaseChange()
{
	if( IsAliveAndWell() && MyKFAIC != none )
	{
		if( MyKFAIC.NotifyBaseChange( Base, Floor ) )
		{
			return;
		}
	}

	super.BaseChange();
}

simulated function KFCharacterInfo_Monster GetCharacterMonsterInfo()
{
	// if CharacterMonsterArch is assigned, we can skip casting
	if ( CharacterArch == CharacterMonsterArch )
	{
		return CharacterMonsterArch;
	}

	return KFCharacterInfo_Monster( GetCharacterInfo() );
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	Super.PostInitAnimTree(SkelComp);

	WalkBlendList = KFAnim_RandomScripted(SkelComp.FindAnimNode('WalkRandomList'));
}

/** Initialize GoreHealth (Server only) */
function ApplySpecialZoneHealthMod(float HealthMod)
{
	HitZones[HZI_HEAD].GoreHealth = default.HitZones[HZI_HEAD].GoreHealth * HealthMod;
}

/*********************************************************************************************
 * @name	Movement Methods
********************************************************************************************* */

event SpiderBumpLevel( vector HitLocation, vector HitNormal, optional actor Wall );

simulated event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
	local KFPawn_Monster KFPM;
	local byte DoTIndex;

	Super.Bump( Other, OtherComp, HitNormal );

	if( SpecialMove != SM_None )
	{
		SpecialMoves[SpecialMove].NotifyBump( Other, HitNormal );
	}

	if( DamageOverTimeArray.Length > 0 )
	{
		DoTIndex = DamageOverTimeArray.Find('DoT_Type', class'KFDT_Fire'.default.DoT_Type);
		if( DotIndex != INDEX_NONE && !bNapalmInfected )
		{
			KFPM = KFPawn_Monster(Other);
			if( KFPM != none )
			{
				CheckForNapalmInfect( KFPM, DoTIndex );
			}
		}
	}
}

/** Override to handle special berserker functionality */
event HitWall( vector HitNormal, actor Wall, PrimitiveComponent WallComp )
{
	if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(GetFuncName()$"() Wall: "$Wall,'BumpEvent'); };
	// Call our special notification
	NotifyCollideWithActor(HitNormal, Wall);
	Super.HitWall(HitNormal, Wall, WallComp);
}

/** Notification that Zed collided with an actor */
function bool NotifyCollideWithActor( Vector HitNormal, Actor Other )
{
	if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(GetFuncName()$"() Other: "$Other,'BumpEvent'); };
	return false;
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	if( MyKFAIC != none )
	{
		MyKFAIC.Touch( Other, OtherComp, HitLocation, HitNormal);
	}
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

/** Determines if we can even consider sprinting */
function SetCanSprint( bool bNewSprintStatus )
{
	bCanSprint = bNewSprintStatus;

	if ( !bCanSprint || bSprintingDisabled )
	{
		bIsSprinting = false;
	}
}

/** Determines if we can't at the moment */
function SetSprintingDisabled( bool bNewSprintStatus )
{
	bSprintingDisabled = bNewSprintStatus;

	if ( !bCanSprint || bSprintingDisabled )
	{
		bIsSprinting = false;
	}
}

/** Determines if we can sprint when damaged */
function SetCanSprintWhenDamaged( bool bNewSprintDamagedStatus )
{
	bCanSprintWhenDamaged = bNewSprintDamagedStatus;

	if ( (!bCanSprint && !bCanSprintWhenDamaged) || bSprintingDisabled )
	{
		bIsSprinting = false;
	}
}

function SetSprinting( bool bNewSprintStatus )
{
	if ( bNewSprintStatus && ( (!bCanSprint && !bCanSprintWhenDamaged) || bSprintingDisabled) )
	{
	 	return;
	}

	super.SetSprinting(bNewSprintStatus);
}

/** Haven't seen this happen in a long time - logging it in case it does occur again */
event StuckOnPawn (Pawn OtherPawn)
{
	JumpOffPawn();
	if( MyKFAIC != none )
	{
		if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(self$" StuckOnPawn event at "$Location$" Base: "$Base,); };
		MyKFAIC.DumpCommandStack();
		MyKFAIC.DumpCommandHistory();
	}
}

/** Overridden to access specific bumping damage types like the fleshpounds enraged hit */
function class<KFDamageType> GetBumpAttackDamageType();

/** Overridden to prevent falling damage for Zeds */
function TakeFallingDamage()
{
}

event Landed( vector HitNormal, Actor FloorActor )
{
	local Controller StoredLastHitBy;

	StoredLastHitBy = LastHitBy;

	if( bRestoreCollisionOnLand )
	{
		bRestoreCollisionOnLand = false;
		SetCollisionSize( default.CylinderComponent.CollisionRadius, default.CylinderComponent.CollisionHeight );
		FitCollision();
	}

	super.Landed( HitNormal, FloorActor );

	LastHitBy = StoredLastHitBy;
}

function SetMovementPhysics()
{
	// do not change when in special move - special move will reset when it's ready
	if( Physics == PHYS_None && IsDoingSpecialMove() )
         return;

    super.SetMovementPhysics();
}

/*********************************************************************************************
 * @name	Combat Methods
********************************************************************************************* */

/** Is test location within charge range? */
native function bool InChargeRange( const Vector TestLocation );
/** Is test location within melee range? */
native function bool InMeleeRange( const Vector TestLocation, optional name AttackTag );
native function bool InAttackTagRange( const name AttackTag, const Vector TestLocation );
native function bool InAnyAttackTagRange( const Vector TestLocation, out name outAttackTag );
native function AttemptAttack( const vector TestLocation );
/** SERVER ONLY: Gets current enemy, to avoid having to get it from the controller */
native function KFPawn GetEnemy();
/** Checks to see if area between CheckLocation and pawn is clear for combat */
native final function bool IsLocationValidForCombat( KFPawn CheckPawn, const vector CheckLocation );
/** Used by subclass to implement rage mode */
simulated function SetEnraged( bool bNewEnraged );
/** Used by subclass to check rage mode */
simulated event bool IsEnraged();

/** Notification called from Pawn animation, by KFAnimNotify_MeleeImpact.
 *  Network: Server Only
 */
simulated function MeleeImpactNotify(KFAnimNotify_MeleeImpact Notify)
{
	if ( MeleeAttackHelper != None )
	{
		MeleeAttackHelper.bHasAlreadyHit = false; // reset attack
		MeleeAttackHelper.MeleeImpactNotify(Notify);
	}

	// check to see if our enemy was killed
	if ( MyKFAIC.Enemy != None && MyKFAIC.Enemy.Health <= 0 )
	{
		ClearHeadTrackTarget(Controller.Enemy);
		// TODO: Below command aborts could be problematic, but this code is pretty old- keep an eye on it
		MyKFAIC.AbortCommand( None, class'AICommand_Attack_Grab' );
		MyKFAIC.AbortCommand( None, class'AICommand_Attack_Melee' );
		// Start up a taunt kill special move (used when enemy killed, as opposed to regular taunts)
		class'AICommand_TauntEnemy'.static.Taunt( KFAIController( Controller ),, TAUNT_EnemyKilled );
	}
}

/** Am I within range to perform an attack in the AttackTag category? (see PawnAnimInfo) */
event bool IsInAttackTagRange( vector TestLocation, name AttackTag )
{
	local vector2D MinMaxRange;
	local float DistSq;

	if( MyKFAIC == none || PawnAnimInfo == none )
	{
		MinMaxRange = PawnAnimInfo.GetAttackRangeByName( AttackTag );
		DistSq = VSizeSq( TestLocation - Location );

		if( (DistSq > (MinMaxRange.X * MinMaxRange.X)) && (DistSq < (MinMaxRange.Y * MinMaxRange.Y)) )
		{
			return true;
		}
	}
	return false;
}

/** Am I within range to perform any attack in my PawnAnimInfo?  */
event bool IsInAnyAttackTagRange( vector TestLocation, out name outAttackTag )
{
	local int idx;

	if( MyKFAIC == none || PawnAnimInfo == none )
	{
		outAttackTag = '';
		return false;
	}

	for( idx = 0; idx < PawnAnimInfo.Attacks.Length; idx++ )
	{
		if( PawnAnimInfo.Attacks[idx].Tag == '' || PawnAnimInfo.Attacks[idx].Chance <= 0.f )
		{
			continue;
		}
		if( IsInAttackTagRange(TestLocation, PawnAnimInfo.Attacks[idx].Tag) )
		{
			outAttackTag = PawnAnimInfo.Attacks[idx].Tag;
			return true;
		}
	}

	outAttackTag = '';
	return false;
}

/*********************************************************************************************
 * @name	Damage/Death Methods
********************************************************************************************* */
State Dying
{
	event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
	{
		local KFPawn_Human KFPH;
		super.TakeDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser );

		if( InstigatedBy != none && InstigatedBy.Pawn != none )
		{
			// beat dead horse
			KFPH = KFPawn_Human( InstigatedBy.Pawn );
			if( KFPH != none )
			{
				if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBeatDeadHorseDialog( KFPH, self );
			}
		}
	}
};

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local KFPawn_Human HumanInstigator;
	local KFAIController_Monster AIMonster;
	local class<KFDamageType> KFDT;
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	AIMonster = KFAIController_Monster(InstigatedBy);
	KFDT = class<KFDamageType>(DamageType);
	KFPC = KFPlayerController(InstigatedBy);
	if( KFPC != none )
	{
		InstigatorPerk = KFPC.GetPerk();
	}

	//Check for acidic compound dart damage
	if( Damage <= 0 )
	{
		if( KFPC != none && InstigatorPerk != none && KFDT != none )
		{
			if( KFDT.static.IsToxicDartWithACMedicPerk() )
			{
				InstigatorPerk.ModifyACDamage( Damage );
			}
		}
	}

	if( AIMonster != none && KFDT != none && !KFDT.default.bIgnoreZedOnZedScaling )
	{
		// Deal extra damage to other zeds if we have over 100 health
		if( Health >= 100 )
		{
			Damage *= ( 2 - (HealthMax - Health ) / HealthMax );
		}
	}

	super.TakeDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser );

	if( InstigatedBy != none && InstigatedBy.Pawn != none )
	{
		HumanInstigator = KFPawn_Human( InstigatedBy.Pawn );
		if( HumanInstigator != none )
		{
			HumanInstigator.ResetIdleStartTime();
		}
	}

	if( Damage > 0 )
	{
		if( InstigatorPerk != none && KFDT != none )
		{
			bCouldTurnIntoShrapnel = InstigatorPerk.CouldBeZedShrapnel( KFDT );
		}

		bShowHealth = true;
		SetTimer(2.f, false, nameOf(ResetHealthVisibilty));
	}
}

/** Disable falling damage */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	local KFPlayerController KFPC;
	local KFPawn_Human KFPH;
	local float TempDamage;
	local int HitZoneIdx;
	local int ExtraHeadDamage;
	local KFPerk InstigatorPerk;
	local float DamageMod;

	Super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

	if( DamageType.default.bCausedByWorld && ClassIsChildOf(DamageType, class'DmgType_Fell') )
	{
		InDamage = 0;
		return;
	}

	DamageMod = 1.0;

	// is vulnerable?
	if( IsVulnerableTo( DamageType, DamageMod ) )
	{
		InDamage *= DamageMod;
	}
	else if( IsResistantTo( DamageType, DamageMod ) )
	{
		InDamage *= DamageMod;
	}

	// Let the instigator's perk adjust the damage
	KFPC = KFPlayerController(InstigatedBy);
	if( KFPC != none )
	{
		InstigatorPerk = KFPC.GetPerk();
		if( InstigatorPerk != none )
		{
			InstigatorPerk.ModifyDamageGiven( InDamage, DamageCauser, self, KFPC, class<KFDamageType>(DamageType) );
		}

		if( KFPC.Pawn != none )
		{
			KFPH = KFPawn_Human(KFPC.Pawn);
			if( KFPH != none && KFPH.bHasSupportBarrageBuff )
			{
				TempDamage = InDamage;
				TempDamage *= class'KFPerk'.static.GetBarrageDamageModifier();
				InDamage = FCeil( TempDamage );
			}
		}
	}

	// Cached hit params
	HitZoneIdx = HitZones.Find('ZoneName', HitInfo.BoneName);

	// NVCHANGE_BEGIN - RLS - Debugging Effects
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitZoneIdx = HZI_HEAD;
	}
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	// Do extra damage on blowing the head off
	if( !bCheckingExtraHeadDamage && HitZoneIdx == HZI_Head &&
        HitZones[HZI_Head].GoreHealth > 0 && InDamage > HitZones[HZI_Head].GoreHealth )
	{
        ExtraHeadDamage = InDamage + HealthMax * 0.25;

        bCheckingExtraHeadDamage = true;
        AdjustDamage( ExtraHeadDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser );
        bCheckingExtraHeadDamage = false;

        InDamage += ExtraHeadDamage;
	}

	// register damage with AIController to divide up money.  This is done here instead of NotifyTakeHit,
	// so that it's called on the killing blow
	if( !bCheckingExtraHeadDamage && InstigatedBy != none && MyKFAIC != none )
	{
		MyKFAIC.AddTakenDamage( InstigatedBy, FMin(Health, InDamage), DamageCauser, class<KFDamageType>(DamageType) );
	}

	// If the head has been dismembered reduce damage to 1 (non-zero so play hit is called).
	// Since zed is bleeding out already this is not as big of a issue.
	if ( HitZoneIdx == HZI_HEAD && bIsHeadless )
	{
		InDamage = 1;
	}

	if (bLogTakeDamage) LogInternal(GetFuncName()@"Adjusted Damage="$InDamage);
}

/** If returns true, this monster is vulnerable to this damage type damage */
function bool IsVulnerableTo(class<DamageType> DT, out float DamageMod)
{
	local int Idx;

	for (Idx = 0; Idx < VulnerableDamageTypes.length; ++Idx)
	{
		if ( ClassIsChildOf(DT, VulnerableDamageTypes[Idx].DamageType) )
		{
			DamageMod = VulnerableDamageTypes[Idx].DamageScale;
            return true;
		}
	}

	return false;
}

/** If returns true, this monster is vulnerable to this damage type damage */
function bool IsResistantTo(class<DamageType> DT, out float DamageMod)
{
	local int Idx;

	for (Idx = 0; Idx < ResistantDamageTypes.length; ++Idx)
	{
		if ( ClassIsChildOf(DT, ResistantDamageTypes[Idx].DamageType) )
		{
			DamageMod = ResistantDamageTypes[Idx].DamageScale;
            return true;
		}
	}

	return false;
}

event bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType, optional bool bRepairArmor=true, optional bool bMessageHealer=true)
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotZedHealingDialog( self );
	Super.HealDamage(Amount, Healer, DamageType);
	return true;
}

/** Is this monster effected by a melee damage debuff? */
function bool HasReducedMeleeDamage()
{
	return bHasReducedMeleeDamage;
}

/** sends any notifications to anything that needs to know this pawn has taken damage */
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	local KFPawn_Human KFPH_Instigator;

	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);

	if( InstigatedBy != none && InstigatedBy.Pawn != none )
	{
		KFPH_Instigator = KFPawn_Human( InstigatedBy.Pawn );
		if( KFPH_Instigator != none )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDamagedZedDialog( KFPH_Instigator, self, DamageType );
		}
	}

	// Allow special move to react to TakeHit/TakeDamage
	if( SpecialMove != SM_None )
	{
		SpecialMoves[SpecialMove].NotifyOwnerTakeHit(class<KFDamageType>(damageType), HitLocation, Normal(Momentum), InstigatedBy);
	}

	if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(GetFuncName()$"() Instigator:"$InstigatedBy$" DT: "$DamageType,'Damage'); };
}

/** Called before, and in addition to, NotifyTakeHit(), but processes melee specifically (Server only) */
function NotifyMeleeTakeHit(Controller InstigatedBy, vector HitLocation)
{
}

/** Delayed death from lethal damage */
function BleedOutTimer()
{
	if ( !bPlayedDeath )
	{
		if (bLogTakeDamage) LogInternal(GetFuncName() @ "LastHitBy" @ LastHitBy);
		Died(LastHitBy, class'KFDT_Bleeding', Location);
	}
}

function bool Died(Controller Killer, class<DamageType> DamageType, vector HitLocation)
{
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;

	if ( super.Died(Killer, damageType, HitLocation) )
	{
	 	if( Killer != none && Killer.Pawn != none && KFPawn_Human(Killer.Pawn) != none )
		{
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayKilledZedDialog( KFPawn_Human(Killer.Pawn), self, DamageType, IsDoingSpecialMove(SM_Knockdown) || IsDoingSpecialMove(SM_RecoverFromRagdoll) );
		}

		if( bCouldTurnIntoShrapnel )
		{
			if( Killer != none )
			{
				KFPC = KFPlayerController(Killer);
				if( KFPC != none )
				{
					InstigatorPerk = KFPC.GetPerk();
					if( InstigatorPerk != none && InstigatorPerk.ShouldShrapnel() )
					{
						ShrapnelExplode( Killer );
					}
				}
			}
		}

	 	return true;
	}

	return false;
}

/** Handle this pawn being destroyed
*/
simulated event Destroyed()
{
    // Kill any affliction sounds/effects when this pawn is destroyed
    AfflictionHandler.Shutdown();
	super.Destroyed();
}

event OnRigidBodyLinearConstraintViolated(name StretchedBoneName)
{
	local KFGoreManager GoreManager;
	local KFCharacterInfo_Monster MonsterInfo;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
	if( GoreManager != none && GoreManager.AllowMutilation() )
	{
		MonsterInfo = GetCharacterMonsterInfo();
		if( !bIsGoreMesh && MonsterInfo != none )
		{
			SwitchToGoreMesh(MonsterInfo.GoreMesh, MonsterInfo.CharacterGoreMaterialID);
		}
	}

	if( bIsGoreMesh && GoreManager != none )
	{
		GoreManager.CrushBone( self, StretchedBoneName );
	}
	else
	{
		mesh.HideBoneByName(StretchedBoneName, PBO_Term);
	}
	LogInternal("Linear constraint violated, hiding bone " @ StretchedBoneName);
}

function ResetHealthVisibilty()
{
	bShowHealth = false;
}

function CheckForNapalmInfect( KFPawn_Monster KFPM, byte DoTIndex )
{
	local KFPerk InstigatorPerk;
	local KFPlayerController KFPC;

	if( DoTIndex >= DamageOverTimeArray.Length )
	{
		return;
	}
	
	KFPC = KFPlayerController(DamageOverTimeArray[DotIndex].InstigatedBy);
	if( KFPC != none )
	{
		InstigatorPerk = KFPC.GetPerk();
		if( InstigatorPerk != none && InstigatorPerk.CanSpreadNapalm() )
		{
			KFPM.TakeDamage( 10,
					 DamageOverTimeArray[DotIndex].InstigatedBy,
					 vect(0,0,0),
					 vect(0,0,0),
					 class'KFDT_Fire' );
			KFPM.bNapalmInfected = true;
		}
	}
}

/**
 * @brief Spawns a radiactive cloud that hurts other Zeds
 *
 * @param Killer The monster's killer (that had the shrapnel skill enabled)
 */
function ShrapnelExplode( Controller Killer )
{
	local KFExplosionActorReplicated ExploActor;
	local Actor InstigatorActor;
	local GameExplosion	ExplosionTemplate;

	if ( Role < ROLE_Authority )
	{
		return;
	}

	InstigatorActor = Killer.Pawn != none ? Killer.Pawn : Killer;

	// explode using the given template
	ExploActor = Spawn(class'KFExplosionActorReplicated', InstigatorActor,, Location,,, true);
	if( ExploActor != None )
	{
		ExploActor.InstigatorController = Killer;

		if( Killer.Pawn != none )
		{
			ExploActor.Instigator = Killer.Pawn;
		}

		ExplosionTemplate = class'KFPerk_Firebug'.static.GetExplosionTemplate();
		ExplosionTemplate.MyDamageType = class'KFPerk_Firebug'.static.GetShrapnelDamageTypeClass();
		ExploActor.Explode( ExplosionTemplate );
	}
}

/*********************************************************************************************
 * @name	Injuries & Status Effects
********************************************************************************************* */

/** Called on server when pawn should has been crippled (e.g. Headless) */
function CauseHeadTrauma(float BleedOutTime=5.f)
{
	if(!bIsHeadless)
	{
		if(HitFxInstigator.Controller!= none && HitFxInfo.DamageType!= none){class'EphemeralMatchStats'.static.RecordWeaponHeadShot(HitFxInstigator.Controller,HitFxInfo.DamageType);}
	}
	
	if ( !bIsHeadless && !bPlayedDeath )
	{
        bPlayShambling = true;
		bIsHeadless = true;

		SetSprintingDisabled(true);		

        // No more auto aiming to this zed
        bCanBeAdheredTo=false;
        bCanBeFrictionedTo=false;

		StopAkEventsOnBone( 'head' );

		// insti-kill while doing a root motion SM (uninterruptable)
		if ( IsDoingSpecialMove() && Mesh.RootMotionMode == RMM_Accel )
		{
			Died(LastHitBy, class'DamageType', Location);
		}
		// initiate ragdoll knockdown while sprinting
		else if ( bIsSprinting && FRand() < 0.25f )
		{
			Knockdown(Velocity, vect(1,1,1));
		}

		// initiate the "headless wander" AICommand
		if( IsAliveAndWell() && MyKFAIC != none )
		{
            // Only allow headless wander if were doing an SM that allows a wander interupt
            // otherwise wait until the end of the move
			if ( SpecialMove == SM_None || !SpecialMoves[SpecialMove].bCanOnlyWanderAtEnd )
			{
				MyKFAIC.DoHeadlessWander();
			}
		}

		if ( BleedOutTime > 0 )
		{
			SetTimer(BleedOutTime, false, nameof(BleedOutTimer));
		}
	}
}

/**
*  SERVER ONLY - Update any AI or animation behaviors based on state
*/
function OnStackingAfflictionChanged(byte Id)
{
    local bool bShouldBeWandering, bWasWandering;

    bWasWandering = (bPlayShambling || bPlayPanicked);

	bPlayShambling = bEmpPanicked || bIsHeadless;
	bPlayPanicked = bFirePanicked || bIsPoisoned || bMicrowavePanicked;

	bShouldBeWandering = (bPlayShambling || bPlayPanicked);

	if( !bWasWandering && bShouldBeWandering )
	{
		CausePanicWander();
	}
	else if( bWasWandering )
	{
		EndPanicWander();
	}
}

/** Called on server when pawn should do EMP Wandering */
function CausePanicWander()
{
	if ( !bIsHeadless && !bPlayedDeath )
	{
		// if bCanOnlyWanderAtEnd is true, do not begin to wander until the current special move has ended
		if ( SpecialMove != SM_None && SpecialMoves[SpecialMove].bCanOnlyWanderAtEnd )
		{
			return;
		}

		SetSprintingDisabled(true);

		// initiate the "EMP wander" AICommand
		if( IsAliveAndWell() && MyKFAIC != none )
		{
			MyKFAIC.DoPanicWander();
		}
	}
}

/** Called on server when pawn should stop doing EMP Wandering */
function EndPanicWander()
{
	SetSprintingDisabled(false);

	// stop the "EMP wander" AICommand
	if( IsAliveAndWell() && MyKFAIC != none )
	{
		MyKFAIC.EndPanicWander();
	}
}

/** Returns true if a stacking incap is set that will cause a zed to wander */
simulated function bool ShouldBeWandering()
{
	return bPlayShambling || bPlayPanicked;
}

/** Returns true if a stacking incap is set that will cause a zed to wander */
simulated function bool IsHeadless()
{
	return bIsHeadless;
}

/** Returns true if a stacking incap is set that will prevent or interrupt a
* zed from using its special abilities (Ex Husk Flamethrower) */
simulated function bool IsImpaired()
{
	return bPlayShambling || bPlayPanicked || bEmpDisrupted;
}

/** Set gameplay related MIC params on the active body MIC */
simulated function SetGameplayMICParams()
{
	if ( AfflictionHandler != None )
	{
		AfflictionHandler.SetPoisonedOverlay( bIsPoisoned );

		// Turn off inflated if we are using the gore mic
        if( GoreMIC != none )
		{
            AfflictionHandler.SetMicrowaveParameter(0.f);
		}
	}
	super.SetGameplayMICParams();
}

/** Called when a melee attack has been parried by another pawn */
function NotifyAttackParried(Pawn InstigatedBy, byte InParryStrength)
{
	if ( InParryStrength < ParryResistance  )
	{
		return; // resisted
	}

	Super.NotifyAttackParried(InstigatedBy, InParryStrength);
}

/*********************************************************************************************
 * @name	Special Moves
********************************************************************************************* */

/** Cloaking & Spotted */
function SetCloaked(bool bNewCloaking);
function CallOutCloaking();

/** Notification when a melee special move ends */
function MeleeSpecialMoveEnded();

/** Cause a physics knockdown (e.g. SM_Emerge) */
function ANIMNOTIFY_Knockdown()
{
	// notify emerge anim to end with a ragdoll knockdown
	if ( SpecialMove == SM_Emerge )
	{
		//Knockdown(Velocity, vect(1,1,1));
		KFSM_Emerge(SpecialMoves[SM_Emerge]).bDoKnockdown = true;
	}
}

/** Called from melee special move when it's interrupted */
function NotifyAnimInterrupt( optional AnimNodeSequence SeqNode );

/** Sends message to local players using ClientMessage */
function Msg( string MsgTxt )
{
	MessagePlayer( MsgTxt );
}

function float GetCircleStrafeDuration()
{
	return 0.f;
}

function float GetStepBackInCombatOdds()
{
	return 0.12f;
}

function Pawn GetPawnToLookAt( optional bool bRequireLOS )
{
	local Pawn P;
	local array<Pawn> InterestingPawns;

	for( P = WorldInfo.PawnList; P != none; P = P.NextPawn )
	{
		if( P != self && P.IsAliveAndWell() && ( !bRequireLOS || LineOfSightTo( P ) ) )
		{
			InterestingPawns.AddItem( P );
		}
	}

	if( InterestingPawns.Length > 0 )
	{
		return InterestingPawns[ Rand(InterestingPawns.Length) ];
	}

	return None;
}

/*********************************************************************************************
 * @name	HeadTracking
********************************************************************************************* */

simulated function bool LookAtPawn( optional Pawn P, optional float Strength=0.5f )
{
	if( IK_Look_Head == none )
	{
		IK_Look_Head		= SkelControlLookAt(Mesh.FindSkelControl('HeadLook'));
		//IK_Look_Spine		= SkelControlLookAt(Mesh.FindSkelControl('SpineLook'));
	}

	if( IK_Look_Head != none )
	{
		if( P == none )
		{
			P = GetPawnToLookAt( true );
		}

		if( P != none )
		{
		//	if( IK_Look_Head.CanLookAtPoint( P.Location + ( vect(0,0,1) * P.BaseEyeHeight ) ) )
		//	{
				bIsHeadTrackingActive = true;
				if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(GetFuncName()@P,'HeadTracking'); };
				SetHeadTrackTarget( P, vect(0,0,1) * P.BaseEyeHeight, Strength, false );
				return true;
		//	}
		}
	}
	return false;
}

simulated function StopLookingAtPawn( optional Pawn P )
{
	if( bCanHeadTrack && bIsHeadTrackingActive && MyLookAtInfo.LookAtTarget != none )
	{
		if( P == none )
		{
			P = Pawn( MyLookAtInfo.LookAtTarget );
		}
		if( P != none )
		{
			if( MyKFAIC!= None ) { MyKFAIC.AILog_Internal(GetFuncName()@P,'HeadTracking'); };
			ClearHeadTrackTarget( P );
		}
	}
}

/*********************************************************************************************
 * @name	Effects / Gore
********************************************************************************************* */

/**
 *  Performs the actual gore LOD switch, and optionally switches physics asset upon death
 *
 * 	@param   GoreLODIndex		 LOD index for the gore LOD
 */
native final simulated function bool SwitchToGoreLOD(int GoreLODIndex);
native final simulated function bool SwitchToGoreMesh(SkeletalMesh GoreSkelMesh, int GoreMaterialID);

/** Returns n closest bones to the TestLocation that belong to the physics asset of the mesh */
simulated function GetClosestHitBones(int NumBones, vector TestLocation, out array<name> OutHitBoneList)
{
	local int i;
	local array<name> SearchList;

	// Add bones in the physics asset to the search list
	for( i=0; i<mesh.PhysicsAsset.BodySetup.length; i++ )
	{
		SearchList.AddItem(mesh.PhysicsAsset.BodySetup[i].BoneName);
	}

	mesh.FindClosestBones(TestLocation, NumBones, OutHitBoneList, SearchList);
}

simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
					const out CollisionImpactData RigidCollisionData, int ContactIndex )
{
	local int i;
	local KFGoreManager GoreManager;
	local RigidBodyContactInfo ContactInfo;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( GoreManager != none && (WorldInfo.TimeSeconds - LastGibCollisionTime) > GoreManager.GetTimeBetweenGibBloodSplats() )
	{
		LastGibCollisionTime = WorldInfo.TimeSeconds;;

		if ( OtherComponent != none && OtherComponent.Owner != none && !OtherComponent.Owner.IsA('KFPawn') ) // Skip pawn-on-pawn collisions
	    {
		    SoundGroupArch.PlayRigidBodyCollisionSound( self, RigidCollisionData.ContactInfos[ContactIndex].ContactPosition );

		    for( i=0; i<RigidCollisionData.ContactInfos.length; i++ )
			{
				ContactInfo = RigidCollisionData.ContactInfos[i];
				GoreManager.LeaveAPersistentBloodSplat(ContactInfo.ContactPosition, -ContactInfo.ContactNormal);
				//DrawDebugCoordinateSystem(ContactInfo.ContactPosition, rotator(-ContactInfo.ContactNormal), 10, true);
			}
	    }
	}
}

/** plays clientside hit effects using the data in HitFxInfo */
simulated function PlayTakeHitEffects( vector HitDirection, vector HitLocation )
{
	local class<KFDamageType> DmgType;
	local name HitZoneName, HitBoneName;
	local int HitZoneIndex;

	// NVCHANGE_BEGIN - RLS - Debugging Effects
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitFxInfo.HitBoneIndex = HZI_HEAD;
	}
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	// Cached hit params
	DmgType = HitFxInfo.DamageType;

	HitZoneIndex = HitFxInfo.HitBoneIndex;
	if ( HitZoneIndex != 255 )	// INDEX_None -> 255 after byte conversion
	{
		HitZoneName = HitZones[HitZoneIndex].ZoneName;
		HitBoneName = HitZones[HitZoneIndex].BoneName;
	}

	if( DmgType != none )
	{
		// If TornOff hasn't been called yet on client, PlayDying now before hit reactions
		if ( bTearOff && !bPlayedDeath )
		{
			PlayDying(HitDamageType,TakeHitLocation);
		}

		if ( bPlayedDeath )
		{
			PlayDeadHitEffects(HitLocation, HitDirection, HitZoneIndex, HitZoneName, HitBoneName, DmgType);
		}
		else
		{
			PlayLivingHitEffects(HitLocation, HitDirection, HitZoneIndex, HitZoneName, HitBoneName, DmgType);
		}
	}

	Super.PlayTakeHitEffects( HitDirection, HitLocation );
}

/** Plays hit effects on dead zeds, this includes dismemberment and obliteration */
simulated function PlayDeadHitEffects(vector HitLocation, vector HitDirection, int HitZoneIndex, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType)
{
	local class<KFProj_PinningBullet> PinProjectileClass;
	local KFPawn DeadPawn;
	local KFGoreManager GoreManager;
	local bool bIsDismemberingHit;
	local bool bWasObliterated;

	// If ragdoll and gore is not allowed for dead bodies, check the time of death
	// to see when the pawn died, and skip if he has been dead for a while
	if( bAllowRagdollAndGoreOnDeadBodies || (WorldInfo.TimeSeconds - TimeOfDeath) <= 3.f )
	{
		// If this zone is 'injured' try to dismember it
		if ( (InjuredHitZones & (1 << HitZoneIndex)) > 0 && !HitZones[HitZoneIndex].bPlayedInjury )
		{
			bIsDismemberingHit = PlayDismemberment(HitZoneIndex, DmgType, HitDirection );

	    	// If there was no dismemberment, explode head instead
	    	if  ( !bIsDismemberingHit && (InjuredHitZones & (1 << HZI_Head)) > 0 )
	    	{
	    		PlayHeadAsplode();
	    		// Set bIsDismemberingHit to true to add an impulse to the neck
	    		bIsDismemberingHit = true;
	    	}
		}

		if( HitFxInfo.bObliterated )
		{
			GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
			if( GoreManager.AllowMutilation() )
			{
				if( HitFxInfo.bRadialDamage )
				{
                    GoreManager.CauseObliteration(self, HitFxRadialInfo.RadiusHurtOrigin, DmgType, ByteToFloat(HitFxRadialInfo.RadiusDamageScale));
				}
				else
				{
					GoreManager.CauseObliteration(self, HitLocation, DmgType);
				}

				bWasObliterated = true;
			}
		}
		else if (Physics == PHYS_RigidBody)
		{
	        // Handle damage types from projectiles that can pin zeds to walls
	        PinProjectileClass = DmgType.static.GetPinProjectileClass();
			if( PinProjectileClass != none )
			{
			   DeadPawn = self;
	           PinProjectileClass.static.CreatePin(DeadPawn, HitLocation, HitDirection, HitBoneName);
			}

			// Gibbing, Parital gore (if any) and gib impulse
			HandlePartialGoreAndGibs(DmgType, HitLocation, HitDirection, HitBoneName);

			// Apply an impulse to attached limbs and ragdoll
			HandleRagdollImpulseEffects( HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, bIsDismemberingHit );
		}
	}

	// Play blood effects. Apply more blood if this was a dismembering hit
	ApplyBloodDecals(HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, bIsDismemberingHit, bWasObliterated);
}

/** Apply impulse to the dead ragdolls bones  */
simulated function HandleRagdollImpulseEffects( vector HitLocation, vector HitDirection, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType, bool bIsDismemberingHit )
{
	local vector ImpulseDir, ParentImpulseDir;
	local float ImpulseScale, ParentImpulseScale;
	local name RBBoneName;
	local name HitBoneParentName;

	// Allow damage type to modify the impulse for a dismembering hit
	ImpulseDir = HitDirection;
	ParentImpulseDir = HitDirection;
	ImpulseScale = 1.f;
	ParentImpulseScale = 1.f;

	if( bIsDismemberingHit )
	{
        DmgType.static.ModifyDismembermentHitImpulse(self, HitZoneName, ImpulseDir, HitDirection, ParentImpulseDir, ImpulseScale, ParentImpulseScale);
	}

	if( HitBoneName != '')
	{
		// Get the rigidbody bone that matches the hit bone name
		RBBoneName = GetRBBoneFromBoneName(HitBoneName);
	}

	// Apply impulse to hit bone. This can be for an alive zed (on death shot) or a dismembered limb
	// In case of explosives, this applies an impulse to the body and not the gibs.
	// Impulse to the gibs is handled separately in CauseGibsAndApplyImpulse()
	ApplyRagdollImpulse(DmgType, HitLocation, ImpulseDir, RBBoneName, ImpulseScale);

	// Apply another impulse to parent bone when a limb gets dismembered for the first time. Skip if parent is the root bone.
	if( bIsDismemberingHit && ParentImpulseScale > 0 )
	{
		HitBoneParentName = mesh.GetParentBone(HitBoneName);
		// Do not apply an additional impulse to the parent bone on for a dismembering shot if it'st he same as oru RB bone
		if( RBBoneName != HitBoneParentName && Mesh.MatchRefBone(HitBoneParentName) > 1 )
		{
			ApplyRagdollImpulse(DmgType, HitLocation, ParentImpulseDir, HitBoneParentName, ParentImpulseScale);
		}
	}
}

/** Hit effects for a living zed */
simulated function PlayLivingHitEffects(vector HitLocation, vector HitDirection, int HitZoneIndex, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType)
{
	if ( !TryPlayHitReactionAnim(HitDirection, DmgType, HitZoneIndex)
		&& PawnAnimInfo.bCanPlayPhysicsHitReactions
		&& ActorEffectIsRelevant(HitFXInstigator, false) )
	{
		// Play Physics Body Impact.
		PlayPhysicsBodyImpact(HitLocation, HitDirection, DmgType, HitBoneName);
	}

	// NVCHANGE_BEGIN - RLS - Debugging Effects
	if( WorldInfo.Game != none && KFGameInfo(WorldInfo.Game).bNVAlwaysHeadshot )
	{
		HitZoneIndex = HZI_HEAD;
	}
	// NVCHANGE_BEGIN - RLS - Debugging Effects

	if( HitZoneIndex == HZI_Head )
	{
		// If head is dismembered (InitPartialKinematics was called), do impulse
		if ( Mesh.PhysicsWeight == 1.f && bIsHeadless )
		{
			ApplyRagdollImpulse(DmgType, HitLocation, HitDirection, HeadBoneName, 1.f);
		}

		ApplyHeadChunkGore(DmgType, HitLocation, HitDirection);
	}

	// Play blood effects. Apply more blood if this was a dismembering hit
	ApplyBloodDecals(HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, false, false);
}

simulated function PlayDyingSound()
{
	if( ClassIsChildOf(HitDamageType, class'KFDT_Bleeding') )
	{
		SoundGroupArch.PlayBleedoutDyingSound( self );
	}
	else if( bHasBrokenConstraints && !HasMouth() )
	{
		// if we have no head or mouth...
		SoundGroupArch.PlayMouthlessDyingSound( self );
	}
	else
	{
		super.PlayDyingSound();
	}
}

simulated function PlayHitZoneGoreSounds( name HitBoneName, vector HitLocation )
{
    if( SoundGroupArch.ShouldPlayCleaveSound(HitBoneName) )
    {
        SoundGroupArch.PlayCleaveSound( self, HitLocation );
    }
    else
    {
        SoundGroupArch.PlayDismembermentSounds( self, HitLocation );
    }
}

/**
 * Return true if we've already broken the input head bone
 *
 * @param	BoneName	the head bone to check to see if we've already broken it.
 */
simulated function bool HeadBoneAlreadyBroken(name BoneName)
{
    if( BrokenHeadBones.Find(BoneName) != INDEX_NONE )
    {
        return true;
    }

    return false;
}

/**
 * Return true if we've already broken the input head bone
 *
 * @param	BoneName	the head bone to add to the broken head bone array.
 */
simulated function AddBrokenHeadBone(name BoneName)
{
    if( BrokenHeadBones.Find(BoneName) == INDEX_NONE )
    {
        BrokenHeadBones.AddItem(BoneName);
    }

    return;
}

/**
 * Return true if this pawn is ok with having the input head bone be broken
 *
 * @param	BoneName	the head bone to check to see if we all it to break.
 */
simulated function bool ShouldAllowHeadBoneToBreak(name BoneName)
{
    if( !bPlayedDeath && !bIsHeadless && !bTearOff )
    {
		if ( NumHeadChunksRemoved >= MaxHeadChunkGoreWhileAlive )
		{
			return false;
		}

		// Don't allow both sides of the front of the face (both eyes) to be blown
		// off, or both sides of the back of the head and the jaw while the zed is alive and not headless
		if( (BoneName == 'Gore_FrontL' && BrokenHeadBones.Find('Gore_FrontR') != INDEX_NONE)
			|| (BoneName == 'Gore_FrontR' && BrokenHeadBones.Find('Gore_FrontL') != INDEX_NONE)
			|| (BoneName == 'Gore_BackL' && BrokenHeadBones.Find('Gore_Jaw') != INDEX_NONE && BrokenHeadBones.Find('Gore_BackR') != INDEX_NONE)
			|| (BoneName == 'Gore_BackR' && BrokenHeadBones.Find('Gore_Jaw') != INDEX_NONE && BrokenHeadBones.Find('Gore_BackL') != INDEX_NONE)
			|| (BoneName == 'Gore_Jaw' && BrokenHeadBones.Find('Gore_BackR') != INDEX_NONE && BrokenHeadBones.Find('Gore_BackL') != INDEX_NONE) )
		{
			return false;
		}
	}

    return true;
}

/** Update metadata required by gore chunk attachments */
simulated function UpdateGoreChunkData(name BoneName)
{
	if( BoneName == 'Gore_FrontL' ||
		BoneName == 'Gore_FrontR' ||
		BoneName == 'Gore_BackL'  ||
		BoneName == 'Gore_BackR'  /*||
		BoneName == 'Gore_Jaw'*/ )
	{
  		NumHeadChunksRemoved++;
	}
}

/** Implementation of delegate function used to determine whether to attach the skull gore chunk.
	The skull gore chunk is used only when one or two head chunks are removed */
simulated function bool ShouldAttachSkullChunk()
{
	return NumHeadChunksRemoved < 3;
}

/** Implementation of delegate function used to determine whether to detach the skull gore chunk.
	If attached, the skull gore chunk is detached when more than 2 head chunks are removed */
simulated function bool ShouldDetachSkullChunk()
{
	return NumHeadChunksRemoved >= 3 && (bPlayedDeath || bIsHeadless || bTearOff);
}

/** Handles the gore chunks to be attached to the pawn body when a limb is dismembered or gibbed */
simulated function HandleGoreChunkAttachments(name DismemberedBone)
{
	local int AttachmentIndex, ChunkRef;
	local StaticMeshComponent AttachComp;
	local KFCharacterInfo_Monster MonsterInfo;
	local AttachedGoreChunkInfo ChunkInfo;
	local KFGoreChunkAttachmentInfo CurrentChunk;

	// Update information that is required by the attachment/detachment code
	UpdateGoreChunkData(DismemberedBone);

	MonsterInfo = GetCharacterMonsterInfo();

	if( MonsterInfo != none )
	{
		for( AttachmentIndex = 0; AttachmentIndex < MonsterInfo.GoreChunkAttachments.length; AttachmentIndex++ )
		{
			CurrentChunk = MonsterInfo.GoreChunkAttachments[AttachmentIndex];

			if( CurrentChunk.DismemberedBoneList.Find(DismemberedBone) != INDEX_NONE )
			{
				// Search for it in the currently attached chunks list
				ChunkRef = AttachedGoreChunks.Find('AttachmentIndex', AttachmentIndex);

				if( CurrentChunk.ShouldAttachGoreChunk(self) && ChunkRef == INDEX_NONE )
				{
					// Create and intialize the attachment component
					AttachComp = new(self) class'StaticMeshComponent';
					AttachComp.SetStaticMesh(CurrentChunk.StaticMesh);
					AttachComp.SetLightingChannels(PawnLightingChannel);
					AttachComp.CastShadow=true;
					AttachComp.bCastDynamicShadow=true;
					AttachComp.bAllowPerObjectShadowBatching=true;
					AttachComp.SetCullDistance(1000);
					AttachComp.SetShadowParent(mesh);
					AttachComp.bAllowApproximateOcclusion=True;
					AttachComp.SetTraceBlocking(False,False);
					AttachComp.SetActorCollision(False,False);

					// Attach chunk to socket in the pawn mesh
					mesh.AttachComponentToSocket(AttachComp, CurrentChunk.SocketName);

					// Add it to the list of currently active gore attachments
					ChunkInfo.AttachmentIndex = AttachmentIndex;
					ChunkInfo.AttachedComponent = AttachComp;
					AttachedGoreChunks.AddItem(ChunkInfo);
				}
				else if( CurrentChunk.ShouldDetachGoreChunk(self) && ChunkRef != INDEX_NONE )
				{
					AttachComp = AttachedGoreChunks[ChunkRef].AttachedComponent;

					// Detach the chunk from the mesh
					mesh.DetachComponent(AttachComp);

					// Remove it from the list of currently active gore attachments
					AttachedGoreChunks.Remove(ChunkRef, 1);
				}
			}
		}
	}
}

/** Calculate type of hit reaction animation from damage info */
simulated function bool TryPlayHitReactionAnim(vector HitDirection, class<KFDamageType> damageType, byte HitZoneIdx)
{
	local EPawnOctant AnimDir;
	local EHitReactionAnimType HitReactionType;
	local EHitZoneBodyPart BodyPart;
	local bool bOnlyAdditiveHits;

	if( damageType == none || ActorTimeSince(NextHitReactionAnim_ActorTime) < 0 )
	{
		return false;
	}

	// cannot play hit reaction anims during special moves
	if ( IsDoingSpecialMove() )
	{
		bOnlyAdditiveHits = true;
		if ( !SpecialMoves[SpecialMove].bAllowHitReactions )
		{
			return false;
		}
	}

	// Set the limb used for incap effects
	BodyPart = (HitZoneIdx != 255) ? HitZones[HitZoneIdx].Limb : BP_Torso;

	HitReactionType = HIT_Light;
	// If we're moving (e.g. DoPauseAI wasn't called because of incap cooldown) don't try hard/medium
	// This is not 100% reliable, but worst case we get a reasonable upper body blend while moving
	bOnlyAdditiveHits = bOnlyAdditiveHits || VSizeSq(Velocity) > 50.f;

	if ( !bOnlyAdditiveHits )
	{
		HitReactionType = AfflictionHandler.GetPredictedHitReaction(DamageType, BodyPart);
	}

	switch (BodyPart)
	{
	case BP_LeftArm:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		if ( AnimDir == DIR_Forward || AnimDir == DIR_ForwardLeft || AnimDir == DIR_ForwardRight )
			AnimDir = DIR_ForwardLeft;
		else
			AnimDir = DIR_BackwardLeft;
		break;
	case BP_RightArm:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		if ( AnimDir == DIR_Forward || AnimDir == DIR_ForwardLeft || AnimDir == DIR_ForwardRight )
			AnimDir = DIR_ForwardRight;
		else
			AnimDir = DIR_BackwardRight;
		break;
	default:
		AnimDir = CalcOctagonRegion(Rotation, -HitDirection);
		break;
	}

	// Play animation
	return PawnAnimInfo.PlayHitReactionAnim(self, HitReactionType, AnimDir);
}

/** plays clientside hit effects using the data in HitFxInfo */
simulated function ApplyBloodDecals(int HitZoneIndex, vector HitLocation, vector HitDirection, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType, bool bIsDismemberingHit, bool bWasObliterated)
{
	local KFGoreManager GoreManager;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( DmgType != none && GoreManager != none )
	{
		// Spawn wound decal on the damaged pawn
		if( !bWasObliterated )
		{
			GoreManager.LeaveABodyWoundDecal(self, HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType);
		}

        // Spawn blood splatter decal effect behind the damaged pawn
		if ( DmgType.default.bShouldSpawnBloodSplat )
		{
			GoreManager.LeaveABloodSplatterDecal(self, HitLocation, HitDirection);
		}

		// Spawn persistent blood splatters
		if( DmgType.default.bShouldSpawnPersistentBlood )
		{
             GoreManager.CausePersistentBlood(self, DmgType, HitLocation, HitDirection, HitZoneIndex, bIsDismemberingHit, bWasObliterated);
		}
	}
}

/** Gibbing, partial gore and gib impusle effects handled here */
simulated function HandlePartialGoreAndGibs(
	class<KFDamageType> DmgType,
	vector HitLocation,
	vector HitDirection,
	name HitBoneName)
{
	local KFGoreManager GoreManager;
	local KFCharacterInfo_Monster MonsterInfo;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( DmgType != none && GoreManager != none )
	{
		if( GoreManager.AllowMutilation() )
		{
			MonsterInfo = GetCharacterMonsterInfo();

			// Enable alternate bone weighting and gore skeleton
			if( !bIsGoreMesh && MonsterInfo != none )
			{
				SwitchToGoreMesh(MonsterInfo.GoreMesh, MonsterInfo.CharacterGoreMaterialID);
			}

			// Apply gore only if we were able to successfully switch to the gore mesh
			if( bIsGoreMesh )
			{
				// Try to apply exlosion gore first
				if( HitFxInfo.bRadialDamage )
				{
					ApplyRadialFxGore( GoreManager, MonsterInfo, DmgType );
				}
				else
				{
					ApplyTakeHitFxGore( GoreManager, MonsterInfo, DmgType, HitLocation, HitDirection, HitBoneName );
				}
			}
    	}
	}
}

/** Apply any gibbing from radial damage */
simulated function ApplyRadialFxGore( KFGoreManager GoreManager, KFCharacterInfo_Monster MonsterInfo, class<KFDamageType> DmgType )
{
	local array<name> OutGibBoneList;
	local float NormalizedDistanceScale;
	local vector ExplosionOrigin;
	local int NumGibs;

	// Try to apply exlosion gore first
	if( DmgType.default.bCanGib )
	{
		// Origin is the point where the explosive went off
		ExplosionOrigin = HitFxRadialInfo.RadiusHurtOrigin;

		// Use distance from explosion along with some randomization to figure out
		// how many joints to dismember. Distance based calculation is skipped after 10 meters.
		NormalizedDistanceScale = VSize(Location - ExplosionOrigin)/1000.f;
		NumGibs = FCeil(FMax(1.f - NormalizedDistanceScale, 0.f) * rand(10)) + rand(3);
		NumGibs *= MonsterInfo.ExplosionGibScale;
		GetClosestHitBones(NumGibs, ExplosionOrigin, OutGibBoneList);

		// Gib-ify!
		// Spawn exlosion PS at the root bone
		GoreManager.CauseGibsAndApplyImpulse(
			self,
			DmgType,
			ExplosionOrigin,
			OutGibBoneList,
			MonsterInfo.ExplosionEffectTemplate,
			mesh.GetBoneLocation(mesh.GetBoneName(0)));
	}
}

/** Apply any gore or breaks from non radial damage */
simulated function ApplyTakeHitFxGore(
	KFGoreManager GoreManager,
	KFCharacterInfo_Monster MonsterInfo,
	class<KFDamageType> DmgType,
	vector HitLocation,
	vector HitDirection,
	name HitBoneName)
{
	local array<name> OutGibBoneList;
	local int JointIndex, ExplosionBreakIdx, BoneIdx;
	local vector ExplosionOrigin;
	local name GibBone;

	// Apply partial gore (if supported)
	GoreManager.ConditionalApplyPartialGore(self, DmgType, HitLocation, HitDirection, HitBoneName);

	// Apply any hit explosion gore specified for this bone
	for( JointIndex = 0; JointIndex < MonsterInfo.GoreJointSettings.length; JointIndex++ )
	{
		if( MonsterInfo.GoreJointSettings[JointIndex].HitBoneName == HitBoneName )
		{
			for( ExplosionBreakIdx = 0;
				 ExplosionBreakIdx < MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore.length;
				 ExplosionBreakIdx++ )
			{
				if( MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].ConstrainToDamageGroups.length == 0 ||
				  	MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].ConstrainToDamageGroups.Find(DGT_None) != INDEX_None ||
					MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].ConstrainToDamageGroups.Find(DmgType.default.GoreDamageGroup) != INDEX_None)
				{
					// Origin is the place of hit
					ExplosionOrigin = mesh.GetBoneLocation(HitBoneName);

					// Only include bones that haven't been gibbed/broken already
					for( BoneIdx = 0;
						 BoneIdx < MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].BreakBones.length;
						 BoneIdx++ )
					{
                        GibBone = MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].BreakBones[BoneIdx].BoneName;
				        if( !mesh.IsBrokenConstraint(GibBone) )
        				{
                        	OutGibBoneList.AddItem(GibBone);
				        }
					}

					// Gib-ify!
					GoreManager.CauseGibsAndApplyImpulse(
						self,
						DmgType,
						ExplosionOrigin,
						OutGibBoneList,
						MonsterInfo.GoreJointSettings[JointIndex].HitExplosionGore[ExplosionBreakIdx].ParticleSystemTemplate,
						ExplosionOrigin,
						HitBoneName);
				}
			}
		}
	}
}

/** Gibbing and partial gore effects handled here */
simulated function ApplyHeadChunkGore(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection)
{
	local KFGoreManager GoreManager;
	local KFCharacterInfo_Monster MonsterInfo;

	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);

	if( DmgType != none && GoreManager != none )
	{
		if( GoreManager.AllowMutilation() )
		{
			MonsterInfo = GetCharacterMonsterInfo();
			// Enable alternate bone weighting and gore skeleton
			if( !bIsGoreMesh && MonsterInfo != none )
			{
				SwitchToGoreMesh(MonsterInfo.GoreMesh, MonsterInfo.CharacterGoreMaterialID);
			}

			if ( !bPlayedDeath )
			{
				// @hack: force all gore as if it was a handgun so we only get head chunks
				DmgType = class'KFDT_Ballistic';
				GoreManager.ConditionalApplyPartialGore(self, DmgType, HitLocation, HitDirection, HitZones[HZI_HEAD].BoneName);
			}
    	}
	}
}

/** Reliably play any gore effects related to a zone/limb being dismembered */
simulated function HitZoneInjured(optional int HitZoneIdx=INDEX_None)
{
    // --------------------------------------------------------------
	// Network: Server (Also called on clients after TearOff)
	// --------------------------------------------------------------
	if ( Role == ROLE_Authority && HitZoneIdx != INDEX_None )
	{
		if ( HitZoneIdx == HZI_Head )
		{
			CauseHeadTrauma();
		}

		// replicate to all clients
		InjuredHitZones = InjuredHitZones | (1 << HitZoneIdx);
	}

	// Play living head explosion effects. Some effects use the clientside HitFX system (e.g. PlayDismemberment),
	// but this should be used when we need a reliably replicated effect.
	if  (WorldInfo.NetMode != NM_DedicatedServer && (!bTearOff && !bPlayedDeath))
	{
        if ( (InjuredHitZones & (1 << HZI_Head)) > 0 )
		{
			// Use HitFxInfo for "best guess" DT and CreationTime to fallback
			// on HeadAsplode when coming into relevancy.
			if ( (WorldInfo.TimeSeconds - CreationTime) > 1.f )
			{
				PlayDismemberment(HZI_Head, HitFxInfo.DamageType);
			}

	    	// If there was no dismemberment, explode head instead
	    	if  ( !HitZones[HZI_Head].bPlayedInjury )
	    	{
    			PlayHeadAsplode();
	    	}
		}
	}
}

simulated function PlayHeadAsplode()
{
	local KFGoreManager GoreManager;
	local KFCharacterInfo_Monster MonsterInfo;
	local name BoneName;

	if( HitZones[HZI_Head].bPlayedInjury )
	{
		return;
	}

	// make sure this doesn't happen after death so that normal HitFX/Gore path is followed.  Using
	// bTearOff since bPlayDying may not be set yet on the client
	// Let the head be blown off for a short time still after death
	if ( (bTearOff || bPlayedDeath) && TimeOfDeath > 0 && (WorldInfo.TimeSeconds - TimeOfDeath) > 0.75 )
	{
		return;
	}

    // Enable alternate bone weighting and gore skeleton
	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
	if( GoreManager != none && GoreManager.AllowHeadless() )
	{
		MonsterInfo = GetCharacterMonsterInfo();
		if( !bIsGoreMesh && MonsterInfo != none )
		{
			SwitchToGoreMesh(MonsterInfo.GoreMesh, MonsterInfo.CharacterGoreMaterialID);
		}
	}

	// Apply mutilation gore only if we were able to successfully switch to the gore mesh
	if( bIsGoreMesh && GoreManager != none )
	{
        BoneName = HitZones[HZI_Head].BoneName;
		GoreManager.CrushBone( self, BoneName );
        SoundGroupArch.PlayHeadPopSounds( self, mesh.GetBoneLocation(BoneName) );
		HitZones[HZI_Head].bPlayedInjury = true;
	}
}

/** Dismember this hit zone if it's not dismembered already
* InDmgType and HitDirection are only ever used on the client after a death shot
*/
simulated function bool PlayDismemberment(int InHitZoneIndex, class<KFDamageType> InDmgType, optional vector HitDirection)
{
	local KFGoreManager GoreManager;
	local name BreakBoneName;
	local KFCharacterInfo_Monster MonsterInfo;

	// Bail out if the hit zone has already been dismembered
	if( HitZones[InHitZoneIndex].bPlayedInjury )
	{
		return false;
	}

	// This hit zone was injured (see CanInjureHitZone), but shouldn't be dismembered
	if ( !InDmgType.static.CanDismemberHitZone( HitZones[InHitZoneIndex].ZoneName ) )
	{
		return false;
	}

    // Enable alternate bone weighting and gore skeleton
	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
	if( GoreManager != none && GoreManager.AllowMutilation() )
	{
		MonsterInfo = GetCharacterMonsterInfo();
		if( !bIsGoreMesh && MonsterInfo != none )
		{
			SwitchToGoreMesh(MonsterInfo.GoreMesh, MonsterInfo.CharacterGoreMaterialID);
		}
	}

    // Apply mutilation gore only if we were able to successfully switch to the gore mesh
	if( bIsGoreMesh && GoreManager != none )
	{
		// Get the bone to dismember from the hit zone
		BreakBoneName = HitZones[InHitZoneIndex].BoneName;
		// If we're dead, allow damage type to override the bone
		if ( Health <= 0 && !IsZero(HitDirection) )
		{
			InDmgType.static.GetBoneToDismember(self, HitDirection, HitZones[InHitZoneIndex].ZoneName, BreakBoneName);
		}

		// Dismember
		GoreManager.CauseDismemberment(self, BreakBoneName, InDmgType);
	    PlayHitZoneGoreSounds(BreakBoneName, mesh.GetBoneLocation(BreakBoneName));
		HitZones[InHitZoneIndex].bPlayedInjury = true;

		// If we're still alive (non-ragdoll), start partial physics ragdoll
		// Note: bPlayedDeath may not be set yet on client, so use Health
		if ( Health > 0 && bHasBrokenConstraints )
		{
			InitPartialKinematics();
		}
		return true;
	}
	return false;
}

/** Apply damage to a specific zone (useful for gore effects) */
function TakeHitZoneDamage(float Damage, class<DamageType> DamageType, int HitZoneIdx, vector InstigatorLocation)
{
	local float HeadHealthPercentage;

	Super.TakeHitZoneDamage(Damage, DamageType, HitZoneIdx, InstigatorLocation);

	// When GoreHealth <= 0, check to see if this weapon can dismember limbs
	if ( HitZones[HitZoneIdx].GoreHealth <= 0 && CanInjureHitZone(DamageType, HitZoneIdx) )
	{
		HitZoneInjured(HitZoneIdx);
	}

	// Handle head injuries
	if ( HitZoneIdx == HZI_Head )
	{
		// Based on head health, calculate number of head chunks we're allowed to remove
		if( !bPlayedDeath && !bIsHeadless && !bTearOff )
		{
			HeadHealthPercentage = GetHeadHealthPercent();
			if( HeadHealthPercentage > 0.5 )
			{
				MaxHeadChunkGoreWhileAlive = 1;
			}
			else if ( HeadHealthPercentage > 0.25 )
			{
				MaxHeadChunkGoreWhileAlive = 2;
			}
			else if ( HeadHealthPercentage > 0.0 )
			{
				MaxHeadChunkGoreWhileAlive = 3;
			}
		}
	}
}

/** Returns the percentage of head health remaining on this zed */
function float GetHeadHealthPercent()
{
	local KFGameInfo KFGI;
	local float HeadHealth, HeadHealthMax;
	local float HealthMod, HeadHealthMod;

	HeadHealth = float(HitZones[HZI_Head].GoreHealth);
	HeadHealthMax = float(default.HitZones[HZI_Head].GoreHealth);

	KFGI = KFGameInfo(WorldInfo.Game);
	if ( KFGI != none )
	{
        KFGI.DifficultyInfo.GetAIHealthModifier(CharacterMonsterArch, KFGI.GameDifficulty, KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);
        HeadHealthMax *= HeadHealthMod;
    }

	return HeadHealth / HeadHealthMax;
}

/** Called by KFPawnAnimInfo when determining whether an attack can be performed */
simulated function bool ShouldPlayHeadlessMeleeAnims()
{
	return bIsHeadless || bEmpPanicked;
}

/** Generally used to determine which/whether dialog/voice events should be played */
simulated event bool HasMouth()
{
	if( !bHasBrokenConstraints )
	{
		return true;
	}

	return !Mesh.IsBrokenConstraint( 'head' ) && !Mesh.IsBoneHidden( Mesh.MatchRefBone('gore_jaw') );
}

function NotifyMeleeAttackFinished();

/** Checks if we're able to reduce or restore our collision size if we're going through
*  a choke point and we have a large collision cylinder */
simulated function ChokePointTimer()
{
	if( !IsTimerActive(nameof(ChokePointTimer)) )
	{
		SetTimer(0.3f, true, nameof(ChokePointTimer), self);
	}

	if( CurrentChokePointTrigger != none )
	{
		// Check if we want to restore our collision
		if( CurrentChokePointTrigger.CanRestoreChokeCollision(self) )
		{
			// If our enemy has entered the choke point and we can fit in the geometry, retore our collision
			if( CylinderComponent.CollisionRadius < CylinderComponent.default.CollisionRadius
					 && !CheckEncroachingWorldGeometry() )
			{
				SetChokePointCollision(false);
			}
		}
		// if our collision is too large to fit through this chokepiont, reduce it
		else if( CylinderComponent.CollisionRadius > CurrentChokePointTrigger.MaxCollisionRadius )
		{
			SetChokePointCollision(true);
		}
	}
	// if we are out of a chokepoint and can restore our collision, do so
	else if( !CheckEncroachingWorldGeometry() )
	{
		// Only restore collision if it's been reduced
		if( CylinderComponent.CollisionRadius < CylinderComponent.default.CollisionRadius )
		{
			SetChokePointCollision(false);
		}
		ClearTimer(nameof(ChokePointTimer), self);
	}
}

/*********************************************************************************************
 * @name	Ephemeral Stats tracking
********************************************************************************************* */
static function bool IsLargeZed(){ return default.bLargeZed; }

static function bool IsABoss(){ return false; }

/*********************************************************************************************
 * @name	Perk related
********************************************************************************************* */
simulated event UpdateSpottedStatus();
static function bool IsStalkerClass(){ return default.bIsStalkerClass; }
static function bool IsCrawlerClass(){ return default.bIsCrawlerClass; }
static function bool IsFleshpoundClass(){ return default.bIsFleshpoundClass; }


function float GetPerkDoTScaler( optional Controller InstigatedBy, optional class<KFDamageType> KFDT )
{
	local KFPlayerController KFPC;
	local KFPerk InstigatorPerk;
	local float DoTScaler;

	DoTScaler = 1.f;

	if( InstigatedBy != none )
	{
		KFPC = KFPlayerController(InstigatedBy);
		if( KFPC != none )
		{
			InstigatorPerk = KFPC.GetPerk();
			if( InstigatorPerk != none )
			{
				InstigatorPerk.ModifyDoTScaler( DoTScaler, KFDT );
			}
		}
	}

	return DoTScaler;
}

/*********************************************************************************************
 * @name	Overhead Debug Text
********************************************************************************************* */

/**
 * Sets debug text rendering
 * @param	bTurnOn	true to enable, false to disable over-NPC-head debug text rendering
 */
function SetDebugTextRendering( bool bTurnOn )
{
	local PlayerController PC;
	local KFHUDBase KFHud;

	bDebug_DrawOverheadInfo	= bTurnOn;

	// final local player's hud object
	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		KFHud = KFHUDBase(PC.MyHUD);
	}

	if ( KFHud != None )
	{
		// Add self to player HUD PostRenderedActor list
		KFHud.SetPostRenderingFor(bTurnOn, self);
	}
}

/** Called by HUD for actors in HUD's PostRenderedActor list */
simulated event PostRenderFor( PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir )
{
	local KFHUDBase PCHUD;
	local bool bShowAllCategories;
	local vector2d ScreenPos;

	PCHUD = KFHUDBase(PC.myHUD );

    if( PCHUD.ShouldDisplayDebug('All') || PCHUD.ShouldDisplayDebug('AllVerbose') )
	{
		bShowAllCategories = true;
	}

	if( MyKFAIC != none )
	{
		if( bShowAllCategories || PCHUD.ShouldDisplayDebug('AIMovement') || PCHUD.ShouldDisplayDebug('AIPathing') )
		{
            MyKFAIC.DrawDebugOverheadMovementPhaseData( PCHUD, ScreenPos );
        }
		if( bShowAllCategories || PCHUD.ShouldDisplayDebug('BehaviorTree') )
		{
            MyKFAIC.DrawBehaviorTreeIconOverhead( PCHUD );
        }
	}

	if( PC != none && PC.myHUD != none && bDebug_DrawOverheadInfo )
	{
		// Note: HUD type will either be KFHUDBase or KFDebugCameraHUD (for ToggleDebugCamera mode) which is a KFHDUBase subclass.
		// ...will need to make sure any other similar code works for both types.
		PCHUD = KFHUDBase(PC.myHUD );
		if( PCHUD != none )
		{
			DrawDebugOverheadText( PCHUD, ScreenPos );
		}
	}
	else if( PC != none && PC.myHUD != none && bDebug_DrawSprintingOverheadInfo )
	{
		PCHUD = KFHUDBase(PC.myHUD );
		if( PCHUD != none )
		{
			DrawDebugOverheadSprintingText( PCHUD );
		}
	}
}

function DrawDebugOverheadText( KFHUDBase HUD, Out Vector2d ScreenPos )
{
	local Texture2D			Icon;
	local PlayerController	PC;
	local Canvas			Canvas;
	local Vector			CameraLoc, ScreenLoc;
	local Rotator			CameraRot;
	local float				X, Y;
	local float				DOT;
	local array<string>     OverheadTexts;
	local array<Color>      OverheadColors;
	local int i;

	if( !IsAliveAndWell() )
	{
		return;
	}

	Canvas = HUD.Canvas;
	ScreenLoc = Canvas.Project( Location + vect(0,0,1) * GetCollisionHeight() * 1.5f );
	if( ScreenLoc.X < 0 || ScreenLoc.X >= HUD.Canvas.ClipX || ScreenLoc.Y < 0 && ScreenLoc.Y >= HUD.Canvas.ClipY )
	{
		return;
	}

	PC = HUD.PlayerOwner;
	Canvas.SetDrawColor(0,255,64);
	OverheadColors[OverheadColors.Length] = MakeColor(0,255,64);

	PC.GetPlayerViewPoint( CameraLoc, CameraRot );
	Dot = vector( CameraRot ) dot ( Location - CameraLoc );
	if( Dot < 0.5f )
	{
		return;
	}
	// Draw Icon (need some unique Zed icons)
	Icon = Texture2D'ENG_EditorResources_TEX.AI.S_AI';
	if (Icon != None)
	{
		Canvas.SetPos( ScreenLoc.X - Icon.SizeX / 2, ScreenLoc.Y - Icon.SizeY / 2, ScreenLoc.Z );
		Canvas.DrawTexture( Icon, 1.f );
		X = ScreenLoc.X + Icon.SizeX/2 + 5;
		Y = ScreenLoc.Y - Icon.SizeY/2;
	}
	else
	{
		X = ScreenLoc.X;
		Y = ScreenLoc.Y;
	}

	if( ScreenPos.X == 0 && ScreenPos.Y == 0 )
	{
        Canvas.SetPos( X, Y );
	}
	else
	{
        Canvas.SetPos( ScreenPos.X, ScreenPos.Y );
	}

	Canvas.Font = class'Engine'.Static.GetSmallFont();

    GetOverheadDebugText( HUD, OverheadTexts, OverheadColors );

	// Draw the AI Command info, etc
    if( MyKFAIC != none )
	{
		MyKFAIC.GetCommandStack( HUD, OverheadTexts, OverheadColors );
	}

	for (i = 0; i < OverheadTexts.length; i++)
	{
		// Set custom color if it exists
        if( OverheadColors[i] != MakeColor(0,0,0,0) )
		{
            Canvas.SetDrawColor(OverheadColors[i].R, OverheadColors[i].G, OverheadColors[i].B, 255);
		}
		else
		{
            Canvas.SetDrawColor(0, 255, 64, 255);
		}

        Canvas.DrawText(OverheadTexts[i]);
	}

	ScreenPos.X = Canvas.CurX;
	ScreenPos.Y = Canvas.CurY;

	if( HUD.ShouldDisplayDebug('AIMovement') )
	{
	   DrawDebugSphere( Location - vect(0,0,1) * (GetCollisionHeight() - MaxStepHeight), 8, 10, 255, 255, 0, FALSE); // Yellow = MaxStepHeight
	   DrawDebugSphere( Location + vect(0,0,1) * MaxJumpHeight, 15, 10, 0, 255, 0, FALSE); // Green = MaxJumpHeight
	}

}

function DrawDebugOverheadSprintingText( KFHUDBase HUD )
{
	local Texture2D			moveTypeIcon;
	local PlayerController	plyCtrl;
	local Canvas			displayCanvas;
	local Vector			plyCameraLoc, plyScreenLoc;
	local Rotator			plyCameraRot;
	local String			displayStr;
	local float				displayX, displayY;
	local float				infrontDOT;
	local Color			    newTextColor;

	if( !IsAliveAndWell() )
	{
		return;
	}

	displayCanvas = HUD.Canvas;
	plyScreenLoc = displayCanvas.Project( Location + vect(0,0,1) * GetCollisionHeight() * 1.5f );
	if( plyScreenLoc.X < 0 || plyScreenLoc.X >= HUD.Canvas.ClipX || plyScreenLoc.Y < 0 && plyScreenLoc.Y >= HUD.Canvas.ClipY )
	{
		return;
	}

	plyCtrl = HUD.PlayerOwner;
	displayCanvas.SetDrawColor(255,255,255);

	plyCtrl.GetPlayerViewPoint( plyCameraLoc, plyCameraRot );
	infrontDOT = vector( plyCameraRot ) dot ( Location - plyCameraLoc );
	if( infrontDOT < 0.5f )
	{
		return;
	}

	if( bDebug_UseIconForShowingSprintingOverheadInfo )
	{
		if( bIsSprinting )
		{
			moveTypeIcon = MyKFAIC.MyAIDirector.GetDebugIsSprintingIcon();
		}
		else
		{
			moveTypeIcon = MyKFAIC.MyAIDirector.GetDebugIsWalkingIcon();
		}
	}
	else
	{
		moveTypeIcon = none;
		if( bIsSprinting )
		{
			displayStr = "S";
			newTextColor = class'HUD'.default.RedColor;
		}
		else
		{
			displayStr = "W";
			newTextColor = class'HUD'.default.GreenColor;
		}
	}


	if (moveTypeIcon != None)
	{
		displayCanvas.SetPos( plyScreenLoc.X - moveTypeIcon.SizeX / 2, plyScreenLoc.Y - moveTypeIcon.SizeY / 2, plyScreenLoc.Z );
		displayCanvas.DrawTexture( moveTypeIcon, 1.f );
		displayX = plyScreenLoc.X + moveTypeIcon.SizeX/2 + 5;
		displayY = plyScreenLoc.Y - moveTypeIcon.SizeY/2;
	}
	else
	{
		displayX = plyScreenLoc.X - GetCollisionRadius();
		displayY = plyScreenLoc.Y;
	}
	displayCanvas.SetPos( displayX, displayY );


	if( Len(displayStr) > 0 )
	{
		displayCanvas.Font = MyKFAIC.MyAIDirector.GetAiDebugScreenLargeFont();
		class'KFAIController'.static.DrawDebugText( HUD, displayStr, newTextColor );
	}
}

simulated function GetOverheadDebugText( KFHUDBase HUD, out array<string> OverheadTexts, out array<Color> OverheadColors )
{
	local string DebugText;
	local KFGameInfo KFGI;
	local float HealthMod;
	local float HeadHealthMod;
	local bool bShowAll, bShowAllVerbose;

	if( HUD.ShouldDisplayDebug('All') )
	{
		bShowAll = true;
	}

	if( HUD.ShouldDisplayDebug('AllVerbose') )
	{
		bShowAll = true;
        bShowAllVerbose = true;
	}

    KFGI = KFGameInfo(WorldInfo.Game);
	if ( KFGI != none )
	{
        KFGI.DifficultyInfo.GetAIHealthModifier(CharacterMonsterArch, KFGI.GameDifficulty, KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);
	    if( bShowAllVerbose || HUD.ShouldDisplayDebug('ZedHealthVerbose') )
        {
    	    DebugText = " Health: "$Health
                $" HeadHealth: "$HitZones[HZI_HEAD].GoreHealth$"\n"
    			$" Starting Health: "$HealthMod*default.Health
    			$" Starting HeadHealth: "$HeadHealthMod*Default.HitZones[HZI_HEAD].GoreHealth$"\n"
    			$" Health Modifier: "$HealthMod
    			$" Default Health: "$default.Health
    			$" Default HeadHealth: "$Default.HitZones[HZI_HEAD].GoreHealth;
		}
	    else if( bShowAll || HUD.ShouldDisplayDebug('ZedHealth') )
        {
    	    DebugText = " Health: "$Health
                $" HeadHealth: "$HitZones[HZI_HEAD].GoreHealth
                $" HeadHealth %: "$(HitZones[HZI_HEAD].GoreHealth/(HeadHealthMod*Default.HitZones[HZI_HEAD].GoreHealth) * 100);
		}
	}

    OverheadTexts[OverheadTexts.Length] = DebugText;

    if( bShowAll || HUD.ShouldDisplayDebug('AITargeting') )
    {
		if( MyKFAIC != none )
		{
    	    DebugText = "---------- AI Targeting ----------\n";

    		if ( MyKFAIC.Enemy != None )
    		{
    			 DebugText = DebugText@"ENEMY: "$MyKFAIC.Enemy.GetHumanReadableName()$" Enemy Dist: "$VSize(MyKFAIC.Enemy.Location - Location)$"\n";
    		}
    		else
    		{
    			DebugText = DebugText@"ENEMY: NO Enemy "$"\n";
    		}


    		if( MyKFAIC.Focus != none )
    		{
    			DebugText = DebugText@"FOCUS: "$MyKFAIC.Focus$"\n";
    			DrawDebugLine(Mesh.GetBoneLocation(HeadBoneName), MyKFAIC.Focus.Location, 255, 255, 0, FALSE);  // Yellow = focus
    		}
    		if( MyKFAIC.GetFocalPoint() != vect(0,0,0) )
    		{
    			DrawDebugLine(Mesh.GetBoneLocation(HeadBoneName), MyKFAIC.GetFocalPoint(), 255, 255, 0, FALSE);  // Yellow = focal point
    		}
            OverheadTexts[OverheadTexts.Length] = DebugText;
		}
	}

    if( bShowAll || HUD.ShouldDisplayDebug('AIMovement') )
    {
	    DebugText = "---------- AI MOVEMENT ----------\n";
	    DebugText = DebugText$"Velocity: "$VSize(Velocity)$" X: "$Velocity.X$" Y: "$Velocity.Y$" Z: "$Velocity.Z$" UU/S, "$VSize(Velocity)/100$"\n";
	    DebugText = DebugText$"Acceleration: "$VSize(Acceleration)$" X: "$Acceleration.X$" Y: "$Acceleration.Y$" Z: "$Acceleration.Z$" Physics: "$GetPhysicsName()$"\n";
	    //DebugText = DebugText$"SuperSpeed: "$IsUsingSuperSpeed()$" LastLOSOrRelevantTime: "$`TimeSince(LastLOSOrRelevantTime)$" LastRenderTime: "$`TimeSince(Mesh.LastRenderTime)$"\n";
	    DebugText = DebugText$"SuperSpeed: "$IsUsingSuperSpeed()$" LastLOSOrRelevantTime: "$(WorldInfo.TimeSeconds - LastLOSOrRelevantTime)$" LastRenderTime: "$(WorldInfo.TimeSeconds - LastRenderTime)$"\n";
		if( MyKFAIC != none )
		{
			if( MyKFAIC.bPreparingMove )
			{
				DebugText = DebugText@"bPreparingMove:"$MyKFAIC.bPreparingMove;
			}

			//DebugText = DebugText@"AICommand: "$MyKFAIC.GetActiveCommand();
		}
        OverheadTexts[OverheadTexts.Length] = DebugText;
	}
}

/**
 * Dialog
 **/

/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 65;//KILL_Generic
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 125;//SPOTZ_Generic
}

function UpdateDeadHorseStreak( bool bStillActive)
{
	if( bStillActive )
    {
        DeadHorseHitStreakAmt++;
    }
    else
    {
        DeadHorseHitStreakAmt = 1;
    }

    LastDeadHorseHitTime = WorldInfo.TimeSeconds;
}

/** Returns (hardcoded) trader advice dialog ID */
static function int GetTraderAdviceID()
{
	return -1;
}

/** Play sounds when jumping and landing */
function PlayLeapedDialog();
function PlayLandedDialog();

defaultproperties
{
   bCanMeleeAttack=True
   bDebug_UseIconForShowingSprintingOverheadInfo=True
   HeadlessBleedOutTime=5.000000
   ParryResistance=1
   MinSpawnSquadSizeType=EST_Small
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0
      BaseDamage=6.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFMeleeHelperAI'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   ZedBumpDamageScale=1.000000
   MatchEnemySpeedAtDistance=200.000000
   MinimumEnemySpeedToMatch=280.000000
   PursuitSpeedScale=1.000000
   ReachedEnemyThresholdScale=1.000000
   BumpFrequency=0.500000
   BumpDamageType=Class'KFGame.KFDT_NPCBump'
   CollisionRadiusForReducedZedOnZedPinchPointCollisionState=1.000000
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bCanHeadTrack=True
   HitZones(0)=(ZoneName="head",BoneName="head",GoreHealth=20,DmgScale=1.100000,Limb=BP_Head,SkinID=1)
   HitZones(1)=(ZoneName="neck",BoneName="neck",GoreHealth=20,Limb=BP_Head)
   HitZones(2)=(ZoneName="chest",BoneName="Spine2",GoreHealth=150,Limb=BP_Torso)
   HitZones(3)=(ZoneName="heart",BoneName="Spine2",GoreHealth=150,Limb=BP_Special)
   HitZones(4)=(ZoneName="lupperarm",BoneName="LeftArm",Limb=BP_LeftArm)
   HitZones(5)=(ZoneName="lforearm",BoneName="LeftForearm",GoreHealth=15,Limb=BP_LeftArm)
   HitZones(6)=(ZoneName="lhand",BoneName="LeftForearm",GoreHealth=20,Limb=BP_LeftArm)
   HitZones(7)=(ZoneName="rupperarm",BoneName="RightArm",Limb=BP_RightArm)
   HitZones(8)=(ZoneName="rforearm",BoneName="RightForearm",GoreHealth=15,Limb=BP_RightArm)
   HitZones(9)=(ZoneName="rhand",BoneName="RightForearm",GoreHealth=20,Limb=BP_RightArm)
   HitZones(10)=(ZoneName="stomach",BoneName="Spine1",GoreHealth=150,Limb=BP_Torso)
   HitZones(11)=(ZoneName="abdomen",BoneName="Hips",GoreHealth=150,Limb=BP_Torso)
   HitZones(12)=(ZoneName="lthigh",BoneName="LeftUpLeg",GoreHealth=75,Limb=BP_LeftLeg)
   HitZones(13)=(ZoneName="lcalf",BoneName="LeftLeg",GoreHealth=25,Limb=BP_LeftLeg)
   HitZones(14)=(ZoneName="lfoot",BoneName="LeftLeg",GoreHealth=15,Limb=BP_LeftLeg)
   HitZones(15)=(ZoneName="rthigh",BoneName="RightUpLeg",GoreHealth=75,Limb=BP_RightLeg)
   HitZones(16)=(ZoneName="rcalf",BoneName="RightLeg",GoreHealth=25,Limb=BP_RightLeg)
   HitZones(17)=(ZoneName="rfoot",BoneName="RightLeg",GoreHealth=15,Limb=BP_RightLeg)
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn:Afflictions_0'
      StackingAffl(0)=(Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=10.000000,Cooldown=5.000000)
      StackingAffl(2)=(Threshhold=3.000000,Cooldown=5.000000)
      StackingAffl(3)=(Threshhold=3.000000,Cooldown=5.000000)
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   ArmPhysicsBoneList(0)="RightShoulder"
   ArmPhysicsBoneList(1)="RightArm"
   ArmPhysicsBoneList(2)="RightForearm"
   ArmPhysicsBoneList(3)="RightHand"
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_GrappleAttack'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(13)=None
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   MaxTurningRadius=64.000000
   AccelConvergeFalloffDistance=400.000000
   HiddenGroundSpeed=600.000000
   LedgeCheckThreshold=350.000000
   bCanCrouch=False
   bCanStrafe=True
   bCanLeap=True
   bModifyReachSpecCost=True
   PathSearchType=PST_Constraint
   Alertness=1.000000
   SightRadius=16384.000000
   PeripheralVision=-1.000000
   JumpZ=750.000000
   ControllerClass=Class'KFGame.KFAIController_Monster'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bUseAsOccluder=False
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_Monster"
   ObjectArchetype=KFPawn'KFGame.Default__KFPawn'
}
