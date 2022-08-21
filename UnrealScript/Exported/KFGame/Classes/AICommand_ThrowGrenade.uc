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

/** Whether we should keep trying to do this command if we're unable to at first */
var bool bHuntAndHeal;

/** Create the command to throw the grenade (TODO: add support for InTarget override) */
static function bool ThrowGrenade( KFAIController_Hans AI, optional int inGrenadeBarrage, optional bool bIsHuntAndHeal )
{
	local AICommand_ThrowGrenade Cmd;

	Cmd = new(AI) default.class;
	if( Cmd != None )
	{
		Cmd.GrenadeBarrage = inGrenadeBarrage;
		Cmd.bHuntAndHeal = bIsHuntAndHeal;

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
        if( Super.ExecuteSpecialMove() )
        {
            // If we successfully did a smoke grenade throw, clear the pending flag
            if( KFPawn_ZedHansBase(MyKFPawn) != none )
            {
                KFPawn_ZedHansBase(MyKFPawn).bPendingSmokeGrenadeBarrage = false;
            }

    		return true;
		}
		else
		{
            // If we were trying to do a grenade throw, do it when we can
            if( GrenadeBarrage > 0 && bHuntAndHeal && KFPawn_ZedHansBase(MyKFPawn) != none )
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

defaultproperties
{
   bShouldCheckSpecialMove=True
   TimeOutDelaySeconds=25.000000
   Name="Default__AICommand_ThrowGrenade"
   ObjectArchetype=AICommand_SpecialMove'KFGame.Default__AICommand_SpecialMove'
}
