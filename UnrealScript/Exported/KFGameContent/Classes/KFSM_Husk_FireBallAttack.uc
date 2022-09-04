//=============================================================================
// KFSM_Husk_FireBallAttack
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFSM_Husk_FireBallAttack extends KFSM_RangedAttack;

/** Seasonal overrides for offsets for firing fireballs */
var array<vector> SpringFireOffsets;
var array<vector> SummerFireOffsets;
var array<vector> FallFireOffsets;
var array<vector> WinterFireOffsets;

function InitSpecialMove( Pawn InPawn, Name InHandle )
{
	super.InitSpecialMove(InPawn, InHandle);

	switch (class'KFGameEngine'.static.GetSeasonalEventID())
	{
	case SEI_Spring:
		FireOffsets = SpringFireOffsets;
		break;
	case SEI_Summer:
		FireOffsets = SummerFireOffsets;
		break;
	case SEI_Fall:
		FireOffsets = FallFireOffsets;
		break;
	case SEI_Winter:
		FireOffsets = WinterFireOffsets;
		break;
	default:
		FireOffsets = default.FireOffsets;
		break;
	}
}

/** Notification from KFPawn_ZedHusk that the animnotify to fire a shot has been triggered */
function NotifyFireballFired()
{
	SetLockPawnRotation( true );
}

function SpecialMoveEnded(name PrevMove, name NextMove)
{
	super.SpecialMoveEnded(PrevMove, NextMove);

	if (AIOwner != none)
	{
		if( !class'Engine'.static.GetEngine().bDIsableAILogging && AIOwner!= None ) { AIOwner.AILog_Internal(self @ "ended for" @ AIOwner,'Husk'); };
	}
}

/**
 * Can a new special move override this one before it is finished?
 * This is only if CanDoSpecialMove() == TRUE && !bForce when starting it.
 */
function bool CanOverrideMoveWith( Name NewMove )
{
	if ( bCanBeInterrupted && (NewMove == 'KFSM_Stunned' || NewMove == 'KFSM_Stumble' || NewMove == 'KFSM_Knockdown' || NewMove == 'KFSM_Frozen') )
	{
		return TRUE; // for NotifyAttackParried
	}
	return FALSE;
}

defaultproperties
{
   SpringFireOffsets(0)=(X=15.000000,Y=32.000000,Z=-22.000000)
   SpringFireOffsets(1)=(X=15.000000,Y=32.000000,Z=-62.000000)
   SummerFireOffsets(0)=(X=15.000000,Y=32.000000,Z=-22.000000)
   SummerFireOffsets(1)=(X=15.000000,Y=32.000000,Z=-62.000000)
   FallFireOffsets(0)=(X=0.000000,Y=0.000000,Z=-30.000000)
   FallFireOffsets(1)=(X=0.000000,Y=0.000000,Z=-30.000000)
   WinterFireOffsets(0)=(X=15.000000,Y=32.000000,Z=-22.000000)
   WinterFireOffsets(1)=(X=15.000000,Y=32.000000,Z=-62.000000)
   AnimNames(0)="Atk_Shoot_V1"
   AnimNames(1)="Atk_Shoot_V2"
   FireOffsets(0)=(X=15.000000,Y=32.000000,Z=-22.000000)
   FireOffsets(1)=(X=15.000000,Y=32.000000,Z=-62.000000)
   bUseCustomRotationRate=True
   bDisableTurnInPlace=True
   CustomRotationRate=(Pitch=66000,Yaw=30000,Roll=66000)
   Handle="KFSM_Husk_FireBallAttack"
   Name="Default__KFSM_Husk_FireBallAttack"
   ObjectArchetype=KFSM_RangedAttack'KFGame.Default__KFSM_RangedAttack'
}
