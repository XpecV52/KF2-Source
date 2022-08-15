//=============================================================================
// KFPawn_MonsterBoss
//=============================================================================
// A base (abstract) class for the boss character at the end of a wave
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_MonsterBoss extends KFPawn_Monster
	abstract
	native(Pawn);

var localized string BossName;
var localized array<string> BossCaptionStrings;

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	PlayBossMusic();
}

/** sends any notifications to anything that needs to know this pawn has taken damage */
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);

	`SafeDialogManager.PlayBossTakeDamageDialog( self );
}


/** Return true if AI can target this pawn */
function bool CanAITargetThisPawn(Controller TargetingController)
{
    if( TargetingController.Pawn.IsSameTeam( self ) )
    {
        // Don't let weaker zeds target a boss!!!
        return false;
    }

    return Super.CanAITargetThisPawn(TargetingController);
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFGameReplicationInfo KFGRI;
	local KFPlayerController KFPC;

    super.PlayDying( DamageType, HitLoc );

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return;
	}

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		KFPC.SetBossCamera( self );
	}
}

/************************************
 * @name	Ephemeral Stats Tracking
 ************************************/

static function bool IsABoss(){ return true; }

/**
 * This pawn has died.
 */
function bool Died( Controller Killer, class<DamageType> DamageType, vector HitLocation )
{
	local bool result;

	result = super.Died( Killer, DamageType, HitLocation );
	if (result)
	{
		KFGameInfo(WorldInfo.Game).BossDied(Killer);
	}

	return result;
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic();

// bosses cannot be decapitated
function CauseHeadTrauma(float BleedOutTime=5.f);
simulated function PlayHeadAsplode();

function PlayMonologue( byte MonologueType )
{
	`SafeDialogManager.PlayBossMonologue( self, MonologueType );
}

function PlayGrabDialog()
{
	`SafeDialogManager.PlayBossGrabDialog( self );
}

function PlayHealDialog()
{
	`SafeDialogManager.PlayBossHealDialog( self );
}

function PlayLeapedDialog()
{
	`SafeDialogManager.PlayBossLeapedDialog( self );
}

function PlayLandedDialog()
{
	`SafeDialogManager.PlayBossLandedDialog( self );
}

defaultproperties
{
`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Patriarch';
`endif

	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
	End Object

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_BossTheatrics)		= class'KFGame.KFSM_Zed_Boss_Theatrics'
		//SpecialMoveClasses(SM_RecoverFromRagdoll)	= None
		//SpecialMoveClasses(SM_Knockdown)			= None
	End Object
	bAlwaysRelevant=true

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Boss

    bWeakZedGrab=false
}
