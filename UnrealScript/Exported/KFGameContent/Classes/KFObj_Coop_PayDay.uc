//=============================================================================
// KFObj_Coop_PayDay
//=============================================================================
// Triggers during a trader wave, if dead players are re-spawned.
// The re-spawned players are targeted on the HUD of the survived players.
// If the surviving players give the re-spawned players dosh, they get
// %30 percent of their dosh back as a reward as well as experience points.
// This is time limited for the first 30 seconds of trader time.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Coop_PayDay extends KFObj_Coop;

var	array<KFPawn_Human>			DoshTargets;

simulated event ReplicatedEvent(name VarName)
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "Replicated variable:" @ VarName);

	if ( VarName == nameOf(ObjectiveState) )
	{
		if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "ObjectiveState =" @ ObjectiveState);
		if ( ObjectiveState == OS_Active )
		{
			StartObjective();
		}
		else
		{
			super.ReplicatedEvent(VarName);
		}
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

simulated function StartObjective()
{
	local KFPlayerController KFPC;
	local KFPawn_Human KFPH;

	MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		KFPH = KFPawn_Human(KFPC.Pawn);
		if ( KFPH != none && KFPH.bObjectivePlayer )
		{
			bNoLocalObjective = true;
			break;
		}
	}

	super.StartObjective();
}

// Objective loop
function UpdateObjective()
{
	if ( ObjectiveState == OS_Active )
 	{
		if ( MyKFGRI != none && !MyKFGRI.bTraderIsOpen )
		{
			FailObjective(OF_Ended);
		}
	}
}

/**
 * Create a cached copy of the respawned players
 * @param {[type]} array<KFPawn_Human> LowDoshPawns
 */
function SetLowDoshPawns(array<KFPawn_Human> LowDoshPawns)
{
	local int i;

	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	for ( i = 0; i < LowDoshPawns.Length; i++ )
	{
		LowDoshPawns[i].bAlwaysRelevant = true;
		DoshTargets.AddItem(LowDoshPawns[i]);
	}

	StartObjective();
}

function int GetPayDayBonusDosh(int DoshSpend)
{
	if ( ObjectiveState == OS_Active )
	{
		if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "CASH BACK AMOUNT:" @ Round(float(DoshSpend) * 0.3f));
		return Round(float(DoshSpend) * 0.3f);
	}

	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "NO CASH BACK!");
	return super.GetPayDayBonusDosh(DoshSpend);
}

/** Check if the pawn is a valid receiver that tries to "forward" the cheap money
    Remove his status if he is
*/
function CheckForPayDayPawn(Pawn P)
{
	local KFPawn_Human KFPH;
	local int Idx;

   	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	if ( ObjectiveState == OS_Active )
	{
		KFPH = KFPawn_Human(P);
		Idx = DoshTargets.Find(KFPH);
		if ( KFPH != none && KFPH.bObjectivePlayer && Idx != INDEX_NONE )
		{
			KFPH.bObjectivePlayer = false;
			CheckEndConditions();
		}
	}
}

/** Check if the objective should end */
function CheckEndConditions()
{
	local KFPawn_Human KFPH;
	local bool bNoDoshTargets;

	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	bNoDoshTargets = true;
	foreach WorldInfo.Allpawns(class'KFPawn_Human', KFPH)
	{
		if ( KFPH.bObjectivePlayer )
		{
		 	bNoDoshTargets = false;
		 	break;
		}
	}

	if ( bNoDoshTargets )
	{
		FailObjective(OF_NoDoshReceivers);
	}
}

simulated function EndObjective()
{
	local int i;

	if ( Role == ROLE_Authority )
	{
		for ( i = 0; i < DoshTargets.Length; i++ )
		{
			DoshTargets[i].bAlwaysRelevant = false;
		}
	}

	DoshTargets.Remove(0, DoshTargets.Length);

	super.EndObjective();
}


/************************************************************
 * HUD
 ************************************************************/

simulated function DrawObjectiveHUD(Canvas C)
{
	if ( bNoLocalObjective )
	{
		return;
	}

	switch ( ObjectiveState )
	{
		case OS_None:
			break;
		case OS_Active:
			DrawObjectiveTargets(C);
			DrawTrackerHUD(C);
			break;
		case OS_Failed:
			DrawObjEndHUD(C);
			break;
	}
}

simulated function DrawTrackerHUD(Canvas C)
{
	local float XPos, YPos, CurScale;
	local string TitleString, DescriptionString, ProgressString, TimeString;
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

	TitleString = ObjectiveTypeString;

	if ( ObjectiveState == OS_Active )
	{
		DescriptionString = ObjectiveTargetTitle;
		CurrentTime = Max(0, MyKFGRI.RemainingTime);
	}

	ProgressString = ObjectiveStatusTitle;

	TimeMinutes = CurrentTime / 60;
	TimeSeconds = CurrentTime % 60;

	if ( TimeSeconds > 9 )
	{
		TimeString = TimeMinutes $ ":" $ TimeSeconds;
	}
	else
	{
	 	TimeString = TimeMinutes $ ":0" $ TimeSeconds;
	}

	TimeString = TimeString $ ObjectiveTimeString;

	C.SetPos(XPos, YPos);
	C.DrawText(TitleString);

	YPos += 16;
	C.SetPos(XPos, YPos);
	C.DrawText(DescriptionString);

	YPos += 20;
	C.SetPos(XPos, YPos);
	C.DrawText(ProgressString);

	YPos += 20;
	C.SetPos(XPos, YPos);
	C.DrawText(TimeString);

	C.Reset();
}

simulated function DrawObjEndHUD(Canvas C)
{
   	local float XPos, YPos, CurScale;
	local string TempString;

	C.SetDrawColor(255,255,255);
	C.bCenter = true;

	CurScale = 1;//float(C.SizeY) / 768;
	XPos = C.SizeX - (256 * CurScale) - 10;
	YPos = 10;

    C.SetPos(XPos, YPos);
	C.DrawTile(ObjRectangleTex, 256 * CurScale, 128 * CurScale, 0, 0, 512, 256);

	YPos += 16;
    C.SetPos(XPos, YPos);

	TempString = ObjectiveTypeString;
	C.DrawText(TempString);

	YPos += 30;
    C.SetPos(XPos, YPos);

	if ( ObjectiveFailReason == OF_NoDoshReceivers )
	{
		TempString = ObjectiveFailedString;
	}
	else
	{
		TempString = ObjectiveEndedString;
	}
	C.DrawText(TempString);

	YPos += 40;
	C.SetPos(XPos, YPos);

	TempString = ObjectiveFailReasons[ObjectiveFailReason];
	C.DrawText(TempString);

	C.Reset();
}

defaultproperties
{
   ObjWorldTex=Texture2D'UI_Objective_Tex.UI_Obj_Dosh_Loc'
   Name="Default__KFObj_Coop_PayDay"
   ObjectArchetype=KFObj_Coop'kfgamecontent.Default__KFObj_Coop'
}
