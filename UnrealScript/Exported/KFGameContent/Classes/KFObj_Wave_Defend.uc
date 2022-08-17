//=============================================================================
// KFObj_Defend
//=============================================================================
// KF2 Defend Objective class
// Players must defend a specified radius for a specified amount of time.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Wave_Defend extends KFObj_Wave;






































	














#linenumber 13;

var float				HaxorPower;
var	float				DfficultyModifier[3];
var float				PlayerNumModifier;

function bool ObjectiveComplete()
{
	return RealObjectiveProgress >= 100;
}

function UpdateObjective()
{
	local byte PrevObjProg;

	if ( ObjectiveState == OS_Active )
 	{
		RealObjectiveProgress += StartVolume.GetNumPlayersActive() * HaxorPower;
		PrevObjProg = ObjectiveProgress;
		ObjectiveProgress = RealObjectiveProgress;
		
		if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "HaxorPower =" @ HaxorPower @ "Player in objective:" @
		 StartVolume.GetNumPlayersActive() @ "Total Progress:" @ ObjectiveProgress @
		 "Progress / second" @ HaxorPower * StartVolume.GetNumPlayersActive());

		if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDefendObjDialog( PrevObjProg, ObjectiveProgress );
	}

	super.UpdateObjective();
}

simulated function StartObjective()
{
	super.StartObjective();

	PlayerNumModifier = GetNumPlayersAccepted();
	HaxorPower = GetHaxPower(float(TimeLimit), DfficultyModifier[ObjectiveDifficulty], PlayerNumModifier);

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDefendObjDialog( -1, 0 );
}

// Get the "hacking" "power" per player
simulated function float GetHaxPower(float Time, float DiffyCultyMod, float PlayerMod)
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "HaxorPower =" @ string((100 / (Time * DiffyCultyMod)) / PlayerMod));
	return (100 / (Time * DiffyCultyMod)) / PlayerMod;
}

function WinObjective()
{
	local KFPawn_Human KFPH;

	foreach WorldInfo.Allpawns(class'KFPawn_Human', KFPH)
	{
		if ( KFPH.IsAliveAndWell() && ActiveObjectivePlayers.Find(KFPH.PlayerReplicationInfo) != INDEX_NONE )
		{
			KFPlayerReplicationInfo(KFPH.PlayerReplicationInfo).AddDosh(DoshReward, true);
			//lalala experience reward comes here
		}
	}

	super.WinObjective();

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayDefendObjDialog( 99, 100 );
}

/************************************************************
 * HUD
 ************************************************************/

/**
 * Main objective hud draw call
 * @param Canvas C
 */
simulated function DrawObjectiveHUD(Canvas C)
{
	switch( ObjectiveState )
	{
		case OS_Alert:
			DrawObjAlertHUD(C);
			break;
		case OS_PreStart:
			if ( !bHasAccepted )
			{
				DrawObjPrestartHUD(C);
				DrawObjectiveWorldPosition(C);
			}
			else
			{
				DrawWaitingForPlayersHUD(C);
			}
			break;
		case OS_Active:
			DrawTrackerHUD(C);
			break;
	}
}

/**
 * [DrawWaitingForPlayersHUD description]
 * @param {[type]} Canvas C
 */
simulated function DrawWaitingForPlayersHUD(Canvas C)
{
	local float XPos, YPos, CurScale;
	local string TitleString, DescriptionString, ProgressString;
	local int TimeSeconds, TimeMinutes,	CurrentTime;

	C.SetDrawColor(255,255,255);
	C.bCenter = true;

	CurScale = 1;//float(C.SizeY) / 768;
	XPos = C.SizeX - (256 * CurScale) - 10;
	YPos = 10;

    C.SetPos(XPos, YPos);
	C.DrawTile(ObjRectangleTex, 256 * CurScale, 96 * CurScale, 0, 0, 512, 256);

	XPos += 16;
	YPos += 10;

	TitleString = ObjectiveTypeString @ "-" @ ObjectiveDifficulties[ObjectiveDifficulty];
	DescriptionString = ObjectiveWaitingString;

	CurrentTime = Max(0, int(ObjectiveStartTime - WorldInfo.TimeSeconds));
	TimeMinutes = CurrentTime / 60;
	TimeSeconds = CurrentTime % 60;

	if ( TimeSeconds > 9 )
	{
		ProgressString = TimeMinutes $ ":" $ TimeSeconds $ "s";
	}
	else
	{
	 	ProgressString = TimeMinutes $ ":0" $ TimeSeconds $ "s";
	}

	C.SetPos(XPos, YPos);
	C.DrawText(TitleString);

	YPos += 20;
	C.SetPos(XPos, YPos);
	C.DrawText(DescriptionString);

	YPos += 20;
	C.SetPos(XPos, YPos);
   	C.SetDrawColor(255,255,255,255);
	C.DrawText(ProgressString);

	C.Reset();
}

defaultproperties
{
   DfficultyModifier(0)=0.700000
   DfficultyModifier(1)=0.800000
   DfficultyModifier(2)=0.900000
   Name="Default__KFObj_Wave_Defend"
   ObjectArchetype=KFObj_Wave'kfgamecontent.Default__KFObj_Wave'
}
