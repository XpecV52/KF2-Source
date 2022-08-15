//=============================================================================
// KFPawn_ZedHansBase
//=============================================================================
// Base Hans Class. Put here so classes in KFGame could reference
// Hans properties, and if any native code is needed
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFPawn_ZedHansBase extends KFPawn_MonsterBoss
	abstract;

`include(KFGameDialog.uci)

/** If true, MkB42s are unholstered and aiming (also see bIsTargeting) */
var repnotify bool bGunsEquipped;

/*********************************************************************************************
* Battle phases
**********************************************************************************************/

/** Info for hans battle phases */
struct HansBattlePhaseInfo
{
    /** Whether or not we can do the Frenzy attack this battle phase */
    var             bool            bCanFrenzy;
    /** Whether or not to desire sprinting behavior this battle phase */
    var             bool            bSprintingBehavior;
    /** Info on how often we can toss any grenades in this battle phase */
    var             float           GlobalOffensiveNadePhaseCooldown;
    /** Whether or not we can use a regular nerve gas toss this battle phase */
    var             bool            bCanTossNerveGas;
    /** Info on how often we can toss Nerve Gas Nades in this battle phase */
    var             float           NerveGasTossPhaseCooldown;
    /** Whether or not we can use a nerve gas barrage this battle phase */
    var             bool            bCanBarrageNerveGas;
    /** Info on how often we can barrage Nerve Gas Nades in this battle phase */
    var             float           NerveGasBarragePhaseCooldown;
    /** Whether or not we can use the MKB assault rifle this battle phase */
    var             bool            bCanUseGuns;
    /** Info on how often we can use guns in this battle phase */
    var             float           GunAttackPhaseCooldown;
    /** How long Hans will keep his guns out when he pulls them out in this battle phase */
    var             float           GunAttackLengthPhase;
    /** Whether or not we can use a regular grenade this battle phase */
    var             bool            bCanTossGrenade;
    /** Info on how often we can toss HENades in this battle phase */
    var             float           HENadeTossPhaseCooldown;
    /** Whether or not we can use grenade barrage this battle phase */
    var             bool            bCanBarrageGrenades;
    /** Info on how often we can barrage HENades in this battle phase */
    var             float           HENadeBarragePhaseCooldown;

	structdefaultproperties
	{
		bSprintingBehavior=true
        GlobalOffensiveNadePhaseCooldown=8
        NerveGasTossPhaseCooldown=10
		NerveGasBarragePhaseCooldown=20
		GunAttackPhaseCooldown=20
		GunAttackLengthPhase=15
		HENadeTossPhaseCooldown=10
		HENadeBarragePhaseCooldown=20
	}
};

/** Configuration for the Hans battle phases */
var	array<HansBattlePhaseInfo>		BattlePhases;

/** The current phase of the battle we're in */
var repnotify   int             CurrentBattlePhase;

/** Whether or not we've healed this battle phase */
var             bool            bHealedThisPhase;

/** In the mode to hunt players and try and heal */
var repnotify   bool            bInHuntAndHealMode;

/** How much to reduce Hans' damage he recieves when he is in hunt and heal mode */
var()           float           HuntAndHealModeDamageReduction;

/*********************************************************************************************
* Grenade Throwing
**********************************************************************************************/

/** Grenade tossing */
var class<KFProj_Grenade>           ActiveGrenadeClass;
/** Grenade tossing */
var const class<KFProj_Grenade>	    ExplosiveGrenadeClass;
/** Grenade tossing */
var const class<KFProj_Grenade>	    NerveGasGrenadeClass;
/** Grenade tossing */
var const class<KFProj_Grenade>	    SmokeGrenadeClass;
/** Socket where grenade spawns when Hans throws with his right hand */
var name RightHandSocketName;
/** Socket where grenade spawns when Hans throws with his left hand */
var name LeftHandSocketName;

enum EHansNadeType
{
	HNT_None,
	HNT_HEGrenade,
	HNT_NerveGas,
	HNT_Smoke,
	HNT_HEGrenadeBarrage,
	HNT_NerveGasBarrage,
	HNT_SmokeBarrage,
};

/** Grenade accuracy TODO: Make this based on skill level for AI*/
var float                           GrenadeTossSpread;

/** Waiting to do a smoke grenade barrage as soon as the guns are put away */
var bool bPendingSmokeGrenadeBarrage;

/** How many grenades have been tossed this barrage */
var int BarrageTossCount;

/** The current grenade attack is a barrage */
var bool bDoingBarrage;

/** Info on how often we can tossed any damaging grenades */
var float GlobalOffensiveNadeCooldown;
var float LastOffensiveNadeTime;
/** Info on how often we can toss HENades */
var float HENadeTossCooldown;
var float LastHENadeTossTime;
/** Info on how often we can barrage HENades */
var float HENadeBarrageCooldown;
var float LastHENadeBarrageTime;
/** Info on how often we can toss Nerve Gas Nades */
var float NerveGasTossCooldown;
var float LastNerveGasTossTime;
/** Info on how often we can barrage Nerve Gas Nades */
var float NerveGasBarrageCooldown;
var float LastNerveGasBarrageTime;
/** Info on how often we can toss Smoke Nades */
var float SmokeTossCooldown;
var float LastSmokeTossTime;

/*********************************************************************************************
* Minion summoning for when Hans goes into hunt and heal mode
**********************************************************************************************/

/** Info for minion wave spawning */
struct HansMinionWaveInfo
{
    /** The minion wave to spawn for Phase 1 healing*/
    var	KFAIWaveInfo				PhaseOneWave;
    /** The minion wave to spawn for Phase 2 healing*/
    var	KFAIWaveInfo				PhaseTwoWave;
    /** The minion wave to spawn for Phase 3 healing*/
    var	KFAIWaveInfo				PhaseThreeWave;
};


/** Waves to summon at each stage by difficulty level*/
var	HansMinionWaveInfo				SummonWaves[4];

/** The base amount of minions to spawn when Hans goes into hunt and heal mode */
var             int                 NumMinionsToSpawn;

simulated event ReplicatedEvent( name VarName )
{
    switch( VarName )
    {
    case nameof( bInHuntAndHealMode ):
        SetHuntAndHealMode( bInHuntAndHealMode );
        break;

    default:
        super.ReplicatedEvent( VarName );
    }
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFAIController_Hans HansAI;

    Super.PossessedBy( C, bVehicleTransition );

    HansAI = KFAIController_Hans(C);

    SetPhaseCooldowns( HansAI );
}

/** Increment Hans to the next battle phase */
function IncrementBattlePhase( KFAIController_Hans HansAI )
{
    CurrentBattlePhase++;
    bHealedThisPhase = true;

    SetPhaseCooldowns( HansAI );
}

/** Set the correct phase based cooldown for this battle phase */
function SetPhaseCooldowns( KFAIController_Hans HansAI )
{
    GlobalOffensiveNadeCooldown = BattlePhases[CurrentBattlePhase -1].GlobalOffensiveNadePhaseCooldown;
    HENadeTossCooldown = BattlePhases[CurrentBattlePhase -1].HENadeTossPhaseCooldown;
    HENadeBarrageCooldown = BattlePhases[CurrentBattlePhase -1].HENadeBarragePhaseCooldown;
    NerveGasTossCooldown = BattlePhases[CurrentBattlePhase -1].NerveGasTossPhaseCooldown;
    NerveGasBarrageCooldown = BattlePhases[CurrentBattlePhase -1].NerveGasBarragePhaseCooldown;

    if( HansAI != none )
    {
        HansAI.ShootingCooldown = BattlePhases[CurrentBattlePhase -1].GunAttackPhaseCooldown;
        HansAI.MaxGunAttackLength = BattlePhases[CurrentBattlePhase -1].GunAttackLengthPhase;
    }
}

/** Disable falling damage */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
    // Reduce damage when in hunt and heal mode
    if( bInHuntAndHealMode )
    {
        InDamage *= HuntAndHealModeDamageReduction;
    }

	Super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
}

/** Can we frenzy attack in this phase */
function bool CanFrenzyInThisPhase()
{
    return BattlePhases[CurrentBattlePhase -1].bCanFrenzy;
}

/** If true Hans will favor sprinting in this phase. Even if it's false he may sprint under certain circumstances, but when it's true he'll try and sprint almost all the time */
function bool DesireSprintingInThisPhase()
{
    return BattlePhases[CurrentBattlePhase -1].bSprintingBehavior;
}

/** Called by PawnAnimInfo when determining whether an attack with bSpecializedMode TRUE can be performed */
function bool ShouldPlaySpecialMeleeAnims()
{
	// make all of Han's melee attacks available when he can frenzy
	return CanFrenzyInThisPhase();
}

/** Has the offensive grenade cooldown time elapsed */
function bool OffensiveGrenadeCooldownComplete()
{
    if( LastOffensiveNadeTime == 0 || `TimeSince(LastOffensiveNadeTime) > GlobalOffensiveNadeCooldown )
    {
        return true;
    }

    return false;
}

/** Can we toss nerve gas in this phase */
function bool CanTossNerveGasInThisPhase()
{
    if( BattlePhases[CurrentBattlePhase -1].bCanTossNerveGas && !bInHuntAndHealMode
        && `TimeSince(LastNerveGasTossTime) > 0 && `TimeSince(LastNerveGasTossTime) > NerveGasTossCooldown
        && OffensiveGrenadeCooldownComplete() )
    {
        return true;
    }

    return false;
}

/** Can we barrage nerve gas in this phase */
function bool CanBarrageNerveGasInThisPhase()
{
    if( BattlePhases[CurrentBattlePhase -1].bCanBarrageNerveGas && !bInHuntAndHealMode
        && `TimeSince(LastNerveGasBarrageTime) > 0 && `TimeSince(LastNerveGasBarrageTime) > NerveGasBarrageCooldown
        && OffensiveGrenadeCooldownComplete() )
    {
        return true;
    }

    return false;
}

/** Can we use guns in this phase */
function bool CanUseGunsInThisPhase()
{
    return BattlePhases[CurrentBattlePhase -1].bCanUseGuns;
}

/** Can we do a standard grenade toss in this phase */
function bool CanTossGrenadeInThisPhase()
{
    if( BattlePhases[CurrentBattlePhase -1].bCanTossGrenade && !bInHuntAndHealMode
        && `TimeSince(LastHENadeTossTime) > 0 && `TimeSince(LastHENadeTossTime) > HENadeTossCooldown
        && OffensiveGrenadeCooldownComplete() )
    {
        return true;
    }

    return false;
}

/** Can we do a grenade barrage in this phase */
function bool CanGrenadeBarrageInThisPhase()
{
    if( BattlePhases[CurrentBattlePhase -1].bCanBarrageGrenades && !bInHuntAndHealMode
        && `TimeSince(LastHENadeBarrageTime) > 0 && `TimeSince(LastHENadeBarrageTime) > HENadeBarrageCooldown
        && OffensiveGrenadeCooldownComplete() )
    {
        return true;
    }

    return false;
}

/** Can we do a regular smoke toss in this phase */
function bool CanSmokeTossInThisPhase()
{
    return bInHuntAndHealMode && `TimeSince(LastSmokeTossTime) > 0 && `TimeSince(LastSmokeTossTime) > SmokeTossCooldown;
}

/** Return true if busy throwing grenade(s) or using AICommand_ThrowGrenade */
function bool IsThrowingGrenade()
{
    return false;
}

/** Implemented in subclass, put here to be accessible from KFGame.u */
function bool CacheGrenadeThrowLocation( optional bool bLeftHand )
{
    return false;
}

function SetActiveGrenadeClassGrenade()
{
    ActiveGrenadeClass=ExplosiveGrenadeClass;
}

function SetActiveGrenadeClassSmoke()
{
    ActiveGrenadeClass=SmokeGrenadeClass;
}

function SetActiveGrenadeClassNerveGas()
{
    ActiveGrenadeClass=NerveGasGrenadeClass;
}

function PlayDrawGunsDialog()
{
    `SafeDialogManager.PlayHansDrawGunsDialog( self );
}

function PlayGrenadeDialog( bool bBarrage )
{
    switch( ActiveGrenadeClass )
    {
    case ExplosiveGrenadeClass:
        `SafeDialogManager.PlayHansNadeDialog( self, bBarrage );
        break;

    case SmokeGrenadeClass:
        `SafeDialogManager.PlayHansSmokeDialog( self, bBarrage );
        break;

    case NerveGasGrenadeClass:
        `SafeDialogManager.PlayHansGasDialog( self, bBarrage );
        break;
    };
}

/** Sets variables related to "hunt and heal" mode */
simulated function SetHuntAndHealMode( bool bOn )
{
    bInHuntAndHealMode = bOn;

    if( Role == ROLE_Authority )
    {
        if( bInHuntAndHealMode )
        {
            SetTimer(0.25f, true, nameof(HuntAndHealBump));
        }
        else
        {
            ClearTimer(nameof(HuntAndHealBump));

            `SafeDialogManager.PlayHansBattlePhaseDialog( self, CurrentBattlePhase );
        }
    }

	if( !bOn )
	{
		bHealedThisPhase = false;
	}
}

// Knock other zeds the heck out of the way when I want to attack my enemy!!!
function HuntAndHealBump()
{
    local KFPawn_Monster KFPM;
    local vector ClosestPoint;
    local float ClosestDist;

    if( MyKFAIC == none || MyKFAIC.Enemy == none /*|| IsDoingSpecialMove(SM_GrabAttack)*/
        || VSizeSq(Location - MyKFAIC.Enemy.Location) > 250000 ) // 5 meters
    {
        return;
    }

	foreach WorldInfo.AllPawns( class'KFPawn_Monster', KFPM, Location, 300.f )
	{
		// Heavy bump guys that are between us and our prey!
		if( KFPM != self && KFPM.IsAliveAndWell() )
		{
            ClosestDist = PointDistToSegment(KFPM.Location, Location, MyKFAIC.Enemy.Location, ClosestPoint);

            if( ClosestDist < GetCollisionRadius() * 1.5 )
            {
                MyKFAIC.DoHeavyZedBump(KFPM, Normal(KFPM.Location - Location));
            }
		}
	}
}

/** returns whether we need to turn to fire at the specified location and angle*/
function bool NeedToTurnEx(vector targ, optional float Angle = 0.93)
{
	local vector LookDir, AimDir;

	LookDir = Vector(Rotation);
	LookDir.Z = 0;
	LookDir = Normal(LookDir);
	AimDir = targ - Location;
	AimDir.Z = 0;
	AimDir = Normal(AimDir);

	return ((LookDir Dot AimDir) < Angle);
}

/** AnimNotify which starts during Hans's AoE melee attack */
simulated function ANIMNOTIFY_AoENerveGas(){}

/** Overridden to prevent blood while invulnerable */
simulated function ApplyBloodDecals(int HitZoneIndex, vector HitLocation, vector HitDirection, name HitZoneName, name HitBoneName, class<KFDamageType> DmgType, bool bIsDismemberingHit, bool bWasObliterated)
{
    if( !bInHuntAndHealMode )
    {
        super.ApplyBloodDecals( HitZoneIndex, HitLocation, HitDirection, HitZoneName, HitBoneName, DmgType, bIsDismemberingHit, bWasObliterated );
    }

    // else do nothing, leave no blood because hans is mostly invulnerable
}

simulated function DetachShieldFX();

replication
{
	// Replicated to ALL
	if ( bNetDirty )
		bGunsEquipped, bInHuntAndHealMode, CurrentBattlePhase;
}
