//=============================================================================
// KFObj_Wave
//=============================================================================
// Base class for the KF2 objectives triggered by kismet
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObj_Wave extends KFObjective;

var				bool					bInfiniteSpawningEnabled;

var	localized	string					ObjectiveAvailableString;        //Prestart header "OBJECTIVE AVAILABLE"
var 			int						CurAlertAlpha;
var 			int						AlertAlphaDelta;

simulated event ReplicatedEvent(name VarName)
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName() @ "Replicated variable:" @ VarName);

	if( VarName == nameOf(ObjectiveState) )
	{
		switch( ObjectiveState )
		{
			case OS_None:
				HideObj();
				EndObjective();
				break;
			case OS_Alert:
				DoObjAlertNotify();
				break;
			case OS_PreStart:
				PreStartObjective();
				break;
			case OS_Active:
				StartObjective();
				break;
			case OS_Won:
				HideObj();
				break;
			case OS_Failed:
				HideObj();
				break;
		}
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

// Let's get this Objective going (client & server)
simulated event Initialize()
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	super.Initialize();

   	NotifyGRI();
	StartVolume.InitVolume(self);
	StartVolume.Unhide();

	ObjectiveState = OS_Alert;

	if( WorldInfo.Role == ROLE_Authority )
	{
		SetTimer(ObjectiveAlertDelay, false, nameOf(PreStartObjective));	
	}

	bNetDirty = true;
}

simulated function PreStartObjective()
{
	super.PreStartObjective();

	if( WorldInfo.Role == ROLE_Authority )
	{
		ObjectiveState = OS_PreStart;		
	}

	ObjectiveStartTime = WorldInfo.TimeSeconds + ObjectiveStartDelay;
}

// Actual objective starts
simulated function StartObjective()
{
	if (bLogObjective) LogInternal("[OBJECTIVE]" @ GetFuncName());

	super.StartObjective();

	EnableInifiteSpawning();
}

function WinObjective()
{
	DisableInifiteSpawning();
		
	super.WinObjective();
}

// Objective failed miserably
simulated function FailObjective(EObjFailIndex FailReason)
{
	DisableInifiteSpawning();

	super.FailObjective(FailReason);
}

simulated function EndObjective()
{
   	StartVolume = none;

	super.EndObjective();
}

/* Show the objective start message (priority message) */
simulated function ShowObjStartMessage()
{
	local KFGameInfo KFGI;

	super.ShowObjStartMessage();

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none && WorldInfo.Role == ROLE_Authority )
	{
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveStart);
	}
}

/* Show the win message (priority message) */
simulated function ShowObjWinMessage()
{
	local KFGameInfo KFGI;

	super.ShowObjWinMessage();

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none && WorldInfo.Role == ROLE_Authority )
	{
		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', GMT_ObjectiveWon);
	}
}

/* Show the fail message (priority message) */
simulated function ShowObjFailMessage()
{
	local KFGameInfo KFGI;
	local byte FailMessage;

	super.ShowObjFailMessage();

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none && WorldInfo.Role == ROLE_Authority )
	{
		Switch ( ObjectiveFailReason )
		{
			case OF_NeededPlayers: FailMessage = GMT_ObjEndPlayerNeeded; break;
			case OF_TimeLimit: FailMessage = GMT_ObjEndTimeLimit; break;
			default: FailMessage = GMT_ObjectiveLost;
		}

		BroadcastLocalizedMessage(class'KFLocalMessage_Priority', FailMessage);
	}
}

protected function EnableInifiteSpawning()
{
	NotifySpawnManager(true);
	bInfiniteSpawningEnabled = true;
}

protected function DisableInifiteSpawning()
{
	NotifySpawnManager(false);
	bInfiniteSpawningEnabled = false;	
}

function bool InfiniteZedsEnabled()
{ 
	return bInfiniteSpawningEnabled;
}

/************************************************************
 * HUD
 ************************************************************/

simulated function DrawObjAlertHUD(Canvas C)
{
	local float XPos, YPos, CurScale;
	
 	CurAlertAlpha += AlertAlphaDelta;
  	if( CurAlertAlpha >= 255 || CurAlertAlpha <= 0 )
  	{
		CurAlertAlpha = CurAlertAlpha >= 255 ? 255 : 0;
		AlertAlphaDelta = -AlertAlphaDelta;
	}

	C.SetDrawColor(255, 255, 255, CurAlertAlpha);
	CurScale = 1;//float(C.SizeY) / 768;
	C.bCenter = true;
	XPos = C.SizeX - (256 * CurScale) - 10;
	YPos = 10;
    C.SetPos(XPos, YPos);

	C.DrawTile(ObjAlertTex, 96 * CurScale, 96 * CurScale, 0, 0, 256, 256);
}

simulated function DrawObjPrestartHUD(Canvas C)
{
	local float XPos, YPos, CurScale, TextScale, HeaderHeight, BodyHeight, OrigX, OrigY, 
				Padding, Width, HeaderTextPadding, IconSize, IconSizeSmall, TextScaleSmall;
	local string TempString;
	local int TimeSeconds, TimeMinutes,	CurrentTime;
	local Color HeaderColor, BodyColor;

	CurScale = 1.f;//float(C.SizeY) / 768;
	TextScale = 0.36f;
	TextScaleSmall = 0.30f;
	HeaderHeight = 28.f;
	HeaderTextPadding = 6.f;
	BodyHeight = 140.f;
	Width = 272.f;
	Padding = 10.f;
	OrigX = C.SizeX - (Width * CurScale) - Padding;
	OrigY = Padding;
	HeaderColor = MakeColor(137,58,43,192);
	BodyColor = MakeColor(0,0,0,128);
	C.Font = ObjectiveFont;
	IconSize = 22.f;
	IconSizeSmall = 16.f;
	C.bNoSmooth = false;

	// header bg
	C.DrawColor = HeaderColor;
	XPos = OrigX;
	YPos = OrigY;
    C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, Width * CurScale, HeaderHeight * CurScale, 0, 0, 32, 32);

	// body bg
	C.DrawColor = BodyColor;
	YPos += HeaderHeight;
    C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, Width * CurScale, BodyHeight * CurScale, 0, 0, 32, 32);
	
	// header alert icon
	XPos = OrigX + HeaderTextPadding;
	YPos = OrigY + (HeaderTextPadding / 2);
	C.SetPos(XPos, YPos);
	C.SetDrawColor(255, 255, 255, 255);
	C.DrawTile(ObjAlertAlphaTex, IconSize * CurScale, IconSize * CurScale, 0, 0, 256, 256);

	// header text
	XPos += IconSize + HeaderTextPadding;
	//YPos += HeaderTextPadding / 3;
    C.SetPos(XPos, YPos);
	C.DrawText(ObjectiveAvailableString, false, TextScale, TextScale);

	// body objective type + difficulty
	XPos = OrigX + HeaderTextPadding;
	YPos = OrigY + HeaderHeight + 2 * HeaderTextPadding;
	C.SetPos(XPos, YPos);
	TempString = ObjectiveTypeString @ "-" @ ObjectiveDifficulties[ObjectiveDifficulty];
	C.DrawText(TempString, false, TextScale, TextScale);

	// rewards dosh symbol
	YPos += HeaderTextPadding + IconSize;
	C.SetPos(XPos, YPos);
	C.DrawTile(DoshTex, IconSize * CurScale, IconSize * CurScale, 0, 0, 256, 256);

	// rewards dosh amount
	XPos += 1.5 * HeaderTextPadding + IconSize;
	//YPos += HeaderTextPadding / 3;
	C.SetPos(XPos, YPos);
	C.DrawText(DoshReward, false, TextScale, TextScale);

	// rewards XP
	XPos += HeaderHeight * 2;
	C.SetPos(XPos, YPos);
	TempString = ObjectiveXPString @ PerkReward;
	C.DrawText(TempString, false, TextScale, TextScale);

	// How to sqare symbol
	XPos = OrigX + HeaderTextPadding;
	YPos +=  HeaderHeight * 1.6;
	C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, IconSizeSmall * CurScale, IconSizeSmall * CurScale, 0, 0, 32, 32);
	C.SetDrawColor(0, 0, 0, 255);
	XPos += 1.f;
	YPos += 1.f;
	C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, (IconSizeSmall - 2) * CurScale, (IconSizeSmall - 2) * CurScale, 0, 0, 32, 32);
	C.SetDrawColor(255, 255, 255, 255);
	XPos -= 1.f;
	YPos -= 1.f;

	// How to text
	XPos += IconSizeSmall + HeaderTextPadding;
	//YPos += HeaderTextPadding / 3;
    C.SetPos(XPos, YPos);
	C.DrawText(ObjectiveStartTitle, false, TextScaleSmall, TextScaleSmall);

	// Time
	XPos = OrigX + HeaderTextPadding;
	YPos += 4 * HeaderTextPadding;
	C.SetPos(XPos, YPos);

	CurrentTime = Max(0, int(ObjectiveStartTime - WorldInfo.TimeSeconds));
	TimeMinutes = CurrentTime / 60;
	TimeSeconds = CurrentTime % 60;

	if( TimeSeconds > 9 )
	{
		TempString = ObjectiveTimeLimitString @ TimeMinutes $ ":" $ TimeSeconds $ ObjectiveTimeUnit;
	}
	else
	{
	 	TempString = ObjectiveTimeLimitString @ TimeMinutes $ ":0" $ TimeSeconds $ ObjectiveTimeUnit;
	}

	C.DrawText(TempString, false, TextScale, TextScale);
	C.Reset();
}

simulated function DrawTrackerHUD(Canvas C)
{
	local float XPos, YPos, CurScale, TextScale, HeaderHeight, BodyHeight, OrigX, OrigY, 
				Padding, Width, HeaderTextPadding, IconSizeSmall, TextScaleSmall;
	local string TempString;
	local int TimeSeconds, TimeMinutes,	CurrentTime;
	local Color HeaderColor, BodyColor;

	CurScale = 1.f;//float(C.SizeY) / 768;
	TextScale = 0.36f;
	TextScaleSmall = 0.30f;
	HeaderHeight = 28.f;
	HeaderTextPadding = 6.f;
	BodyHeight = 140.f;
	Width = 272.f;
	Padding = 10.f;
	OrigX = C.SizeX - (Width * CurScale) - Padding;
	OrigY = Padding;
	HeaderColor = MakeColor(137,58,43,192);
	BodyColor = MakeColor(0,0,0,128);
	C.Font = ObjectiveFont;
	IconSizeSmall = 16.f;
	C.bNoSmooth = false;

	// header bg
	C.DrawColor = HeaderColor;
	XPos = OrigX;
	YPos = OrigY;
    C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, Width * CurScale, HeaderHeight * CurScale, 0, 0, 32, 32);

	// body bg
	C.DrawColor = BodyColor;
	YPos += HeaderHeight;
    C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, Width * CurScale, BodyHeight * CurScale, 0, 0, 32, 32);

	// header text
	XPos = OrigX + HeaderTextPadding;
	YPos = OrigY + (HeaderTextPadding / 2);
	C.SetDrawColor(255, 255, 255, 255);
    C.SetPos(XPos, YPos);
	C.DrawText(ObjectiveStatusString, false, TextScale, TextScale);

	//body 
	// How to square symbol
	YPos += OrigY + HeaderHeight + 2 * HeaderTextPadding;
	C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, IconSizeSmall * CurScale, IconSizeSmall * CurScale, 0, 0, 32, 32);
	C.SetDrawColor(0, 0, 0, 255);
	XPos += 1.f;
	YPos += 1.f;
	C.SetPos(XPos, YPos);
	C.DrawTile(ObjWhiteTex, (IconSizeSmall - 2) * CurScale, (IconSizeSmall - 2) * CurScale, 0, 0, 32, 32);
	C.SetDrawColor(255, 255, 255, 255);
	XPos -= 1.f;
	YPos -= 1.f;

	// How to text
	XPos += IconSizeSmall + HeaderTextPadding;
	//YPos += HeaderTextPadding / 3;
    C.SetPos(XPos, YPos);
	C.DrawText(ObjectiveTargetTitle, false, TextScaleSmall, TextScaleSmall);

	// Percentage
	YPos += IconSizeSmall + 4 * HeaderTextPadding;
	XPos = OrigX + HeaderTextPadding;
	C.SetPos(XPos, YPos);
	C.SetDrawColor(255,255,255,255);
	C.DrawRect(102.f, 16.f);

	YPos += 1;
	C.SetPos(XPos + 1, YPos);
	C.SetDrawColor(137,58,43,255);
	C.DrawRect(ObjectiveProgress, 14.f);
	
	// Time
	C.SetDrawColor(255,255,255,255);
	XPos = OrigX + HeaderTextPadding;
	YPos += IconSizeSmall + 4 * HeaderTextPadding;
	C.SetPos(XPos, YPos);

	CurrentTime = Max(0, int(ObjectiveEndTime - WorldInfo.TimeSeconds));
	TimeMinutes = CurrentTime / 60;
	TimeSeconds = CurrentTime % 60;

	if( TimeSeconds > 9 )
	{
		TempString = ObjectiveTimeLimitString @ TimeMinutes $ ":" $ TimeSeconds $ ObjectiveTimeUnit;
	}
	else
	{
	 	TempString = ObjectiveTimeLimitString @ TimeMinutes $ ":0" $ TimeSeconds $ ObjectiveTimeUnit;
	}

	C.DrawText(TempString, false, TextScale, TextScale);
	C.Reset();
}

// simulated function DrawObjEndHUD(Canvas C)
// {
//    	local float XPos, YPos, CurScale;
// 	local string TempString;

// 	C.SetDrawColor(255,255,255);
// 	C.bCenter = true;

// 	CurScale = 1;//float(C.SizeY) / 768;
// 	XPos = C.SizeX - (256 * CurScale) - 10;
// 	YPos = 10;

//     C.SetPos(XPos, YPos);
// 	C.DrawTile(ObjRectangleTex, 256 * CurScale, 128 * CurScale, 0, 0, 512, 256);

// 	YPos += 16;
//     C.SetPos(XPos, YPos);

// 	TempString = ObjectiveTypeString @ "-" @ ObjectiveDifficulties[ObjectiveDifficulty];
// 	C.DrawText(TempString);

// 	YPos += 30;
//     C.SetPos(XPos, YPos);

//   	if( ObjectiveState == OS_Failed )
//   	{
//     	if( ObjectiveFailReason == OF_NeededPlayers || ObjectiveFailReason == OF_WaveEnded )
//     	{
// 			TempString = ObjectiveEndedString;
// 		}
// 		else
// 		{
// 			TempString = ObjectiveFailedString;
// 		}

//    		C.DrawText(TempString);

// 		YPos += 40;
//     	C.SetPos(XPos, YPos);

// 		TempString = ObjectiveFailReasons[ObjectiveFailReason];
// 		C.DrawText(TempString);

// 		C.Reset();
// 		return;
//     }

// 	TempString = ObjectiveWonString;
// 	C.DrawText(TempString);

// 	YPos += 36;
//    	C.SetPos(XPos, YPos);

// 	TempString = "REWARDS";
// 	C.DrawText(TempString);

// 	YPos += 20;
//    	C.SetPos(XPos, YPos);

// 	TempString = "£" @ DoshReward @ "         " @ PerkReward @ "XP";
//    	C.DrawText(TempString);

// 	C.Reset();
// }

defaultproperties
{
   AlertAlphaDelta=14
   Name="Default__KFObj_Wave"
   ObjectArchetype=KFObjective'KFGame.Default__KFObjective'
}
