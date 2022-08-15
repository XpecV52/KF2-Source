//=============================================================================
// KFObj_Coop_Healer
//=============================================================================
// Triggers when 2 or more of your team mates have fewer than 25% health.
// These players are tagged on the HUD of the other players.
// The players have 10 seconds to heal the low health players.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Coop_Healer extends KFObj_Coop;






































	















#linenumber 14;

var	KFPawn_Human					HealingTarget;
var	array<PlayerReplicationInfo>    Healers;
var int								PawnHealingTime;

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

simulated function Initialize()
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());
	super.Initialize();

	DoshReward = ObjDoshReward;
	PerkReward = ObjExpReward;
}

function UpdateObj_Active()
{
	super.UpdateObj_Active();

	RealObjectiveProgress = (100.f / float(HealingTarget.HealthMax)) * HealingTarget.Health;
	ObjectiveProgress = RealObjectiveProgress;

	if ( ObjectiveComplete() )
	{
		WinObjective();
	}
	else if ( !HealingTarget.IsAliveAndWell() )
	{
		FailObjective(OF_TargetDied);	
	}
}

simulated function SetLowHealthPawn(KFPawn_Human LowHealthPawn)
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	HealingTarget = LowHealthPawn;
	HealingTarget.bAlwaysRelevant = true;

  	TimeLimit = PawnHealingTime;

	StartObjective();
}

function NewHealer(PlayerReplicationInfo Healer)
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	if ( Healers.Find(Healer) == INDEX_None )
	{
		Healers.AddItem(Healer);
	}
}

function bool ObjectiveComplete()
{
  	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	return HealingTarget.Health >= HealingTarget.HealthMax / 2;
}

function WinObjective()
{
	local int i;

	for ( i = 0; i < Healers.Length; i++ )
	{
		if( KFPlayerReplicationInfo(Healers[i]) != none )
		{
			KFPlayerReplicationInfo(Healers[i]).AddDosh(DoshReward, true);
		}
	}

	super.WinObjective();
}

simulated function EndObjective()
{
	if ( Role == ROLE_Authority )
	{
		HealingTarget.bAlwaysRelevant = false;
		HealingTarget.bObjectivePlayer = false;
	}

	HealingTarget = none;
	Healers.Remove(0, Healers.Length);

	super.EndObjective();
}

/************************************************************
 * HUD
 ************************************************************/
simulated function DrawObjectiveHUD(Canvas C)
{
	switch ( ObjectiveState )
	{
		case OS_None:
			break;
		case OS_Active:
			DrawObjectiveTargets(C);
			DrawTrackerHUD(C);
			break;
		case OS_Won:
			DrawObjEndHUD(C);
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
   	local KFPawn_Human MyKFPH;
	local KFPlayerController KFPC;
  	
  	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		MyKFPH = KFPawn_Human(KFPC.Pawn);
		if ( MyKFPH != none )
		{
			break;
		}
	}

	if ( MyKFPH.bObjectivePlayer )
	{
		return;
	}


	C.SetDrawColor(255,255,255);
	C.bCenter = true;

	CurScale = 1;//float(C.SizeY) / 768;
	XPos = C.SizeX - (256 * CurScale) - 10;
	YPos = 10;

	C.SetPos(XPos, YPos);
	C.DrawTile(ObjRectangleTex, 256 * CurScale, 96 * CurScale, 0, 0, 512, 256);

	XPos += 10;

	TitleString = ObjectiveTypeString;

	if ( ObjectiveState == OS_Active )
	{
		DescriptionString = ObjectiveTargetTitle;
		CurrentTime = Max(0, int(ObjectiveEndTime - WorldInfo.TimeSeconds));
	}

	ProgressString = ObjectiveProgress $ "%";

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

	YPos += 16;
	C.SetPos(XPos, YPos);
	C.DrawText(TitleString);

	YPos += 16;
	C.SetPos(XPos, YPos);
	C.DrawText(DescriptionString);

	if ( ObjectiveState == OS_Active )
	{
		YPos += 18;
		XPos += 69;
		C.SetPos(XPos, YPos);
		C.SetDrawColor(255,255,255,255);
		C.DrawRect(102.f, 16.f);

		YPos += 1;
		C.SetPos(XPos + 1, YPos);
		C.SetDrawColor(255,0,0,255);
		C.DrawRect(ObjectiveProgress, 14.f);
		XPos -= 69;
	}

	C.SetDrawColor(0,0,0,255);
	C.SetPos(XPos, YPos);
	C.DrawText(ProgressString);

	YPos += 20;
	C.SetDrawColor(255,255,255,255);
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

  	if ( ObjectiveState == OS_Failed )
  	{
    	TempString = ObjectiveFailedString;
   		C.DrawText(TempString);

		YPos += 40;
    	C.SetPos(XPos, YPos);

		TempString = ObjectiveFailReasons[ObjectiveFailReason];
		C.DrawText(TempString);

		C.Reset();
		return;
    }

	TempString = ObjectiveWonString;
	C.DrawText(TempString);


	YPos += 36;
   	C.SetPos(XPos, YPos);

	TempString = "REWARDS";
	C.DrawText(TempString);

	YPos += 20;
   	C.SetPos(XPos, YPos);

	TempString = "£" @ DoshReward @ "         " @ PerkReward @ "XP";
   	C.DrawText(TempString);

	C.Reset();
}

defaultproperties
{
   PawnHealingTime=30
   ObjDoshReward=200
   ObjExpReward=200
   ObjWorldTex=Texture2D'UI_Objective_Tex.UI_Obj_Healing_Loc'
   Name="Default__KFObj_Coop_Healer"
   ObjectArchetype=KFObj_Coop'kfgamecontent.Default__KFObj_Coop'
}
