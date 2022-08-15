//=============================================================================
// AICommand_ThrowGrenade
//=============================================================================
// Command currently used by Hans for throwing grenades. Change the "within"
// if you want to let other Zeds use this command.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class AICommand_ThrowGrenade extends AICommand_SpecialMove
	within KFAIController_Hans;

/** 0 = no barrage, 1 = small barrage, 2 = big barrage */
var int GrenadeBarrage;

/** Waves of zeds to summon for this command*/
var	KFAIWaveInfo				SummonWave;

/** The maximum number of zeds to spawn/have active at once for this boss */
var int MaxBossMinions;

/** Create the command to throw the grenade (TODO: add support for InTarget override) */
static function bool ThrowGrenade( KFAIController_Hans AI, optional int inGrenadeBarrage, optional KFPawn InTarget, optional KFAIWaveInfo NewSummonWave, optional int NewMaxBossMinions )
{
	local AICommand_ThrowGrenade Cmd;

	Cmd = new(AI) default.class;
	if( Cmd != None )
	{
		Cmd.GrenadeBarrage = inGrenadeBarrage;

		if( NewMaxBossMinions > 0 && NewSummonWave != none )
		{
    		Cmd.SummonWave = NewSummonWave;
    		Cmd.MaxBossMinions = NewMaxBossMinions;
		}

		AI.PushCommand( Cmd );
		return true;
	}
	return false;
}

/** Command started */
function Pushed()
{
	/** Update debug AI status */
	AIActionStatus = "Attempting to throw grenade";
	/** Stop moving and stop probing melee range */
	AIZeroMovementVariables();
	DisableMeleeRangeEventProbing();
	//Pawn.SetDesiredRotation( rotator(Enemy.Location - Location) );
	SetFocalPoint(vect(0,0,0));
	Focus = Enemy;
	Super.Pushed();
}

function Popped()
{
	Focus = none;
	EnableMeleeRangeEventProbing();
	super.Popped();
}

state Command_SpecialMove
{
	/** Make sure the pawn has rotated to face its target */
	function bool ShouldFinishRotation()
	{
		return true;
	}

    function bool ExecuteSpecialMove()
	{
		local KFAISpawnManager SpawnManager;

        if( Super.ExecuteSpecialMove() )
        {
            // Summon minions if we want them
            if( MaxBossMinions > 0 )
            {
        		SpawnManager = KFGameInfo(WorldInfo.Game).SpawnManager;
        		if ( SpawnManager != none )
        		{
        		 	SpawnManager.SummonBossMinions( SummonWave.Squads, MaxBossMinions );
        		}

                // If we successfully did a smoke grenade throw, clear the pending flag
                if( KFPawn_ZedHansBase(MyKFPawn) != none )
                {
                    KFPawn_ZedHansBase(MyKFPawn).bPendingSmokeGrenadeBarrage = false;
                }

    		}
    		return true;
		}
		else
		{
            // If we were trying to do a grenade throw, do it when we can
            if( GrenadeBarrage > 0 && MaxBossMinions > 0 && KFPawn_ZedHansBase(MyKFPawn) != none )
            {
                KFPawn_ZedHansBase(MyKFPawn).bPendingSmokeGrenadeBarrage = true;
            }
            return false;
		}
	}

	/** Return the regular grenade special move or the grenade barrage special move */
	function ESpecialMove GetSpecialMove()
	{
        if( GrenadeBarrage == 0 )
        {
            return SM_Hans_ThrowGrenade;
        }
        else if( GrenadeBarrage == 1 )
        {
            return SM_Hans_GrenadeHalfBarrage;
        }
        else
        {
            return SM_Hans_GrenadeBarrage;
        }
	}
}


DefaultProperties
{
	bAllowedToAttack=false
	/** ToDo: Use a timer set to be called roughly when the throw anim notify should be called */
	TimeOutDelaySeconds=25.f
	/** If false, there's a chance the special move will execute even if CanDoSpecialMove() returns false */
	bShouldCheckSpecialMove=true
}
