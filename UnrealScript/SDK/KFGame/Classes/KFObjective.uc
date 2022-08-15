//=============================================================================
// KFObjective
//=============================================================================
// Base class for the KF2 objectives
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFObjective extends ReplicationInfo
		abstract
		config(Game)
		native
		nativereplication;

enum EObjectiveState
{
	OS_None,
	OS_Alert,
	OS_PreStart,
	OS_Active,
	OS_Won,
	OS_Failed
};

enum EObjFailIndex
{
	OF_TimeLimit,
	OF_WipedOut,
	OF_TargetDied,
	OF_WaveEnded,
	OF_Ended,
	OF_NoDoshReceivers,
	OF_NeededPlayers
};

var				KFObjectiveVolume		StartVolume;				//Defines the starting location of the objective
var	repnotify	byte					ObjectiveState; 	       	//What is going on right now, voting, active
var	repnotify	byte					ObjectiveFailReason;		//Why did we fail
var	repnotify	int						TimeLimit;					//The amount of time players have to complete the objective
var				float					SpawnCurveIntensity;    	//An override to the games spawning curve to allow spawning intensity control during the objective gameplay
var				int						DoshReward;					//The total amount of dosh the team receives for the objective.
var				int						PerkReward;					//The amount of experience each player receives for completing the objective.
var localized	string					ObjectiveDifficulties[3];   //Difficulty strings for the  wvae objectives
var localized	string					ObjectiveFailReasons[7];    //Fail reason strings
var	localized	string					ObjectiveStartTitle;        //Start string
var	localized	string					ObjectiveWaitingString;     //Waiting string
var	localized	string					ObjectiveWonString;         //Won string
var	localized	string					ObjectiveFailedString;      //Failed string
var	localized	string					ObjectiveEndedString;       //Ended sttring (Not every every objective can be completed or failed)
var	localized	string					ObjectiveTimeString;        //Time string
var	localized	string					ObjectiveTypeString;		//Text that defines the action of the objective to the player. Will be displayed in the Objective HUD notifications.
var	localized	string					ObjectiveTargetTitle;   	//Text that defines the target of the objective to the player. Will be displayed in the Objective HUD notifications.
var	localized	string					ObjectiveStatusTitle;   	//Displayed in the players objective progress tracker.
var localized 	string 					ObjectiveXPString;			//"XP"
var localized 	string 					ObjectiveTimeLimitString;	//Text for time limits
var localized 	string 					ObjectiveTimeUnit;			//"s" time unit
var localized 	string 					ObjectiveStatusString;		//Header text when ojective active

var	repnotify	byte					ObjectiveDifficulty; 		//Randomly chosen difficulty
var				byte					ObjectiveProgress;          // 0-100%
var 			float 					RealObjectiveProgress;		// We want to use float precision internally

var()			float					ObjectiveAlertDelay;    	//Duration the alert is shown
var()			float					ObjectiveStartDelay;		//Time between the objective alert and the time it actually starts
var	protected	float					ObjectiveStartTime;         //Time the objective starts
var	protected	float					ObjectiveEndTime;           //Time the objective ends

var				KFGameReplicationInfo   MyKFGRI;                    //Cache
var				array<PlayerReplicationInfo> ActiveObjectivePlayers;//Players who were in the objective
var				float					CurPlayerCount;             //NumPlayers
var				bool				 	bIsCoopObjective;           //Am I a Co-op objective?
var				float					NumPlayersDenied;			//Number of players that do not want to play the objective

/*********************************************************************************************
 Player Variables
**********************************************************************************************/
var				bool                    bHasAccepted;                  //Player has voted
var				bool					bObjectiveDenied;           //Player does not want to play the objective
var				bool					bNoLocalObjective;          //This objective should be ingnored on the local client

/*********************************************************************************************
 SFX
**********************************************************************************************/
var				AkEvent				ObjectiveTriggeredSFX;		//A sound that is played when the objective is triggered.
var				AkEvent				ObjectiveCompletedSFX;		//A sound that is played when the objective is successfully completed.
var				AkEvent				ObjectiveFailedSFX;			//A sound that is played when the objective is failed.
var				AkEvent				ObjectiveCrossOffSFX;		//A sound that is place when an objective is accepted

var config		bool 				bShowObjectivePath;

/*********************************************************************************************
 HUD
**********************************************************************************************/
var				Texture2D			ObjSquareTex;
var				Texture2D			ObjRectangleTex;
var				Texture2D			ObjWorldTex;
var				Texture2D			ObjAlertTex;
var				Texture2D			ObjAlertAlphaTex;
var				Texture2D			ObjWhiteTex;
var				Texture2D			DoshTex;
var				int  				CurAlpha;
var				int					AlphaDelta;
var 			Font				ObjectiveFont;

/*********************************************************************************************
 Debug
**********************************************************************************************/
var config		bool				bLogObjective;

replication
{
	if( bNetInitial )
		StartVolume, ObjectiveDifficulty, TimeLimit, DoshReward, PerkReward;


	if( bNetDirty )
		ObjectiveState, ObjectiveFailReason, ObjectiveProgress;
}

cpptext
{
	// Override replication for set owner / RPC calls
	INT* GetOptimizedRepList( BYTE* Recent, FPropertyRetirement* Retire, INT* Ptr, UPackageMap* Map, UActorChannel* Channel );
	virtual void PostNetReceive();
}

simulated event ReplicatedEvent(name VarName)
{
	`log("[OBJECTIVE]" @ GetFuncName() @ "Replicated variable:" @ VarName, bLogObjective);

	if( VarName == nameOf(TimeLimit) )
	{
		Initialize();
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

// Let's get this Objective going (client & server)
simulated event Initialize()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	InitializeTimer();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		`SafeTraderDialogManager.PlayObjectiveDialog( GetALocalPlayerController(), GetTraderDialogStartIndex() );
	}
}

// Update the spawn curve intensity
function NotifySpawnManager(bool bUpdateSpawnCurveIntensity)
{
	local KFGameInfo KFGI;

	KFGI = KFGameInfo(WorldInfo.Game);
	if( KFGI != none && KFGI.SpawnManager != none )
	{
		if( bUpdateSpawnCurveIntensity )
		{
			`log("[OBJECTIVE]" @ GetFuncName() @ "Setting SpawnCurve intensity!", bLogObjective);
			KFGI.SpawnManager.UpdateSpawnCurveIntensity(SpawnCurveIntensity);
			
		}
		else
		{
			`log("[OBJECTIVE]" @ GetFuncName() @ "Resetting SpawnCurve intensity!", bLogObjective);
			KFGI.SpawnManager.ResetSpawnCurveIntensity();
		}
	}
}

// Tell the GRI that we are the objective
simulated function NotifyGRI()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	if( WorldInfo.GRI != none )
	{
		MyKFGRI = KFGameReplicationInfo(WorldInfo.GRI);
		MYKFGRI.CurrentObjective = self;

		//While we are here let's see how many players are alive
		CurPlayerCount = MyKFGRI.GetNumPlayersAlive();
	}
}

// Start the objective loop
simulated function InitializeTimer()
{
	SetTimer(1.0, true, nameOf(UpdateObjective));
}

// Objective loop
function UpdateObjective()
{
	switch( ObjectiveState )
	{
		case OS_None:
			break;
		case OS_Alert:
			UpdateObj_Alert();
			break;
		case OS_PreStart:
			UpdateObj_Prestart();
			break;
		case OS_Active:
			UpdateObj_Active();
			break;
		case OS_Won:
			break;
		case OS_Failed:
			break;
	}
}

function UpdateObj_Alert();

function UpdateObj_Prestart()
{
	if( WorldInfo.TimeSeconds >= ObjectiveStartTime )
	{
		if( StartVolume != none && GetNumPlayersAccepted() > 0 )
		{
			`log("[OBJECTIVE]" @ GetFuncName() @ "GetNumPlayersAccepted() > 0", bLogObjective);
			StartObjective();
		}
		else
		{
			`log("[OBJECTIVE]" @ GetFuncName() @ "Not enough players", bLogObjective);
			FailObjective(OF_NeededPlayers);
		}
	}
	else if( StartVolume != none && GetNumPlayersAccepted() >= CurPlayerCount )
	{
		`log("[OBJECTIVE]" @ GetFuncName() @ "GetNumPlayersAccepted() >= CurPlayerCount", bLogObjective);
		StartObjective();
	}
}

function UpdateObj_Active()
{
	if( ObjectiveEndTime <= WorldInfo.TimeSeconds )
	{
		if( ObjectiveComplete() )
		{
			WinObjective();
		}
		else
		{
			FailObjective(OF_TimeLimit);
		}
	}
	else
	{
		if( ObjectiveComplete() )
		{
			WinObjective();
		}
	}
}

// Sub class
function bool ObjectiveComplete()
{
	return false;
}

simulated function AlertObjective()
{

}

// Let's get to the start volume
simulated function PreStartObjective()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		DoObjPreStartNotify();
	}
}

// Actual objective starts
simulated function StartObjective()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	if( Role == ROLE_Authority )
	{
		ObjectiveState = OS_Active;
	}

	ObjectiveEndTime = WorldInfo.TimeSeconds + TimeLimit;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		DoObjStartNotify();
	}
}

// Objective failed miserably
simulated function FailObjective(EObjFailIndex FailReason)
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	ObjectiveFailReason = FailReason;
	ObjectiveState = OS_Failed;
	DoObjFailNotify();

	HideObj();
	SetTimer(4.f, false, nameOf(EndObjective));
}

//
function WinObjective()
{
   	ObjectiveState = OS_Won;
	DoObjWinNotify();
	HideObj();
	SetTimer(4.f, false, nameOf(EndObjective));
}

simulated function AcceptObj()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	bHasAccepted = true;
}

simulated function HideObj()
{
	StartVolume.Hide();
}

simulated function EndObjective()
{
    ObjectiveState = OS_None;
    ClearTimer(nameOf(UpdateObjective));

   	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		HideObjHUD();
	}

	ResetObjectivePlayers();
	MYKFGRI.CurrentObjective = none;
	Destroy();
}

simulated function bool ShouldShowObjPath()
{
	return ObjectiveState < OS_Active && bShowObjectivePath && !bIsCoopObjective;
}

function AddObjectivePlayer(PlayerReplicationInfo PRI)
{
	ActiveObjectivePlayers.AddItem(PRI);

	if( ActiveObjectivePlayers.Length >= MyKFGRI.GetNumPlayersAlive() )
	{
		StartObjective();
	}
}

function ResetObjectivePlayers()
{
   	local KFPawn_Human KFPH;

   	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	foreach WorldInfo.Allpawns(class'KFPawn_Human', KFPH)
	{
		KFPH.bObjectivePlayer = false;
	}

	ActiveObjectivePlayers.Remove(0, ActiveObjectivePlayers.Length);
}

function bool IsObjectivePlayer(KFPlayerReplicationInfo KFPRI)
{
	return ActiveObjectivePlayers.Find( KFPRI ) > INDEX_NONE;
}

function int GetNumPlayersAccepted()
{
	return ActiveObjectivePlayers.Length;
}
/************************************************************
 * Notify functions called by the objective events
 ************************************************************/

/* Objective is triggerd */
simulated function DoObjAlertNotify()
{
	if( bNoLocalObjective )
	{
		return;
	}

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	ShowObjAlert();
	PlayObjAlertSFX();
}

/* Objective is accepted */
simulated function DoObjPreStartNotify()
{
	local KFPlayerController KFPC;

	if( bNoLocalObjective )
	{
		return;
	}

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.PlayerReplicationInfo != none )
		{
			KFPC.PlaySoundBase(ObjectiveCrossOffSFX);
		}
	}

	if( bShowObjectivePath )
	{
		ShowObjPath();
	}

	ShowObjTracker();
}

/* Objective starts */
simulated function DoObjStartNotify()
{
	if( bNoLocalObjective )
	{
		return;
	}

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	ShowObjStartMessage();
	ShowObjTracker();
}

/* Objective is failed */
simulated function DoObjFailNotify()
{
	if( bNoLocalObjective )
	{
		return;
	}

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	ShowObjFailMessage();
	PlayObjFailSFX();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		`SafeTraderDialogManager.PlayObjectiveDialog( GetALocalPlayerController(), GetTraderDialogStartIndex() + 3 );
	}
}

/* Objective is won */
simulated function DoObjWinNotify()
{
	if( bNoLocalObjective )
	{
		return;
	}

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	ShowObjWinMessage();
	PlayObjWinSFX();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		`SafeTraderDialogManager.PlayObjectiveDialog( GetALocalPlayerController(), GetTraderDialogStartIndex() + 1 );
	}
}

/************************************************************
 * HUD message functions
 ************************************************************/

simulated function ShowObjAlert()
{

}

/* Show the objective info when objective is triggered */
simulated function ShowObjVoteMenu()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
}

/* Show the path to the objective */
simulated function ShowObjPath()
{
	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);
	StartVolume.ShowObjectivePath();
}

/* Show the objective start message */
simulated function ShowObjStartMessage()
{

}

/* Show the general objective tracker (TOP-RIGHT) */
simulated function ShowObjTracker()
{

}

/* Show the win message (BOTTOM-CENTER) */
simulated function ShowObjWinMessage()
{

}

/* Show the fail message (BOTTOM-CENTER) */
simulated function ShowObjFailMessage()
{

}

/* Hide all objective HUD parts (Used later) */
simulated function HideObjHUD()
{

}

/************************************************************
 * SFX/VO functions
 ************************************************************/

/* Play SFX/VO when vote menu comes up */
simulated function PlayObjAlertSFX()
{
	local KFPlayerController KFPC;

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.PlayerReplicationInfo != none )
		{
			KFPC.PlaySoundBase(ObjectiveTriggeredSFX);
		}
	}
}

/* Play win SFX/VO */
simulated function PlayObjWinSFX()
{
	local KFPlayerController KFPC;

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.PlayerReplicationInfo != none )
		{
			KFPC.PlaySoundBase(ObjectiveCompletedSFX);
		}
	}
}

/* Play lose SFX/VO */
simulated function PlayObjFailSFX()
{
	local KFPlayerController KFPC;

	`log("[OBJECTIVE]" @ GetFuncName(), bLogObjective);

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		if( KFPC.PlayerReplicationInfo != none )
		{
			KFPC.PlaySoundBase(ObjectiveFailedSFX);
		}
	}
}

/************************************************************
 * Functions used in sub classes
 ************************************************************/
function SetLowHealthPawn(KFPawn_Human LowHealthPawn);
function NewHealer(PlayerReplicationInfo Healer);
function PawnDied(Pawn KilledPawn);
function SetLowDoshPawns(array<KFPawn_Human> LowHealthPawns);
function int GetPayDayBonusDosh(int DoshSpend){return 0;}
function CheckForPayDayPawn(Pawn P);
function bool InfiniteZedsEnabled(){ return false; }

/************************************************************
 * HUD
 ************************************************************/
simulated function DrawObjectiveHUD(Canvas C);
simulated function DrawTrackerHUD(Canvas C);
simulated function DrawObjAlertHUD(Canvas C);
simulated function DrawObjPrestartHUD(Canvas C);
simulated function DrawObjEndHUD(Canvas C);

simulated function DrawObjectiveWorldPosition(Canvas C)
{
	local vector ScreenPos;
	local string Distance;
   	local KFPawn_Human MyKFPH;
	local KFPlayerController KFPC;
	local float Dim, StringSizeX, StringSizeY;

  	CurAlpha += AlphaDelta;
  	if( CurAlpha >= 255 || CurAlpha <= 0 )
  	{
		CurAlpha = CurAlpha >= 255 ? 255 : 0;
		AlphaDelta = -AlphaDelta;
	}

	Dim = 48;
	C.SetDrawColor(0, 230, 255, CurAlpha);
  	C.bCenter = false;

 	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		MyKFPH = KFPawn_Human(KFPC.Pawn);
		if( MyKFPH != none )
		{
			break;
		}
	}

	ScreenPos = C.Project(StartVolume.Location);
	if( ScreenPos.Z > 0 )
	{
		if( ScreenPos.X >= C.ClipX )
		{
			ScreenPos.X = C.ClipX - Dim / 2;
		}
		else if( ScreenPos.X <= 0 )
		{
			ScreenPos.X = Dim / 2;
		}

		if( ScreenPos.Y >= C.ClipY )
		{
			ScreenPos.Y = C.ClipY - Dim / 2;
		}
		else if( ScreenPos.Y <= 0 )
		{
			ScreenPos.Y = Dim / 2;
		}
	}
	else
	{
		if( ScreenPos.X >= C.SizeX / 2)
		{
			ScreenPos.X = Dim / 2;
		}
		else
		{
			ScreenPos.X = C.ClipX - Dim / 2;
		}

		ScreenPos.Y = C.ClipY - (ScreenPos.Y % C.ClipY);
	}

	Distance = Round(VSize(StartVolume.Location - MyKFPH.Location) / 100) $ "m";
	C.StrLen(Distance, StringSizeX, StringSizeY);

	C.SetPos(ScreenPos.X - Dim / 2, ScreenPos.Y - Dim / 2);
	C.DrawTile(ObjWorldTex, Dim, Dim, 0, 0, 256, 256);

	C.SetPos(ScreenPos.X -  StringSizeX / 2, ScreenPos.Y + Dim / 2);
	C.DrawText(Distance, false);

	C.Reset();
}

/** Returns (hardcoded) trader objective dialog ID, override in children */
simulated function int GetTraderDialogStartIndex()
{
	return 49; // defaults to Defend Target
}

DefaultProperties
{
	AlphaDelta=10
	ObjectiveStartDelay=60.f
	bIsCoopObjective=false
	ObjectiveAlertDelay=3.f

	ObjectiveFont=Font'UI_Canvas_Fonts.Font_General'

	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	TickGroup=TG_DuringAsyncWork

	//ObjSquareTex=Texture2D'UI_Objective_Tex.UI_Obj_Background_Square'
	//ObjRectangleTex=Texture2D'UI_Objective_Tex.UI_Obj_Background_Short'
	//ObjWorldTex=Texture2D'UI_Objective_Tex.UI_Obj_World_Loc'
	//ObjAlertTex=Texture2D'InGameHUD_UI.alert_BG'
	//ObjAlertAlphaTex=Texture2D'InGameHUD_UI.alert_noBG'
	//ObjWhiteTex=Texture2D'EngineResources.WhiteSquareTexture'
	//DoshTex=Texture2D'InGameHUD_UI.InGameHUD_SWF_I18'

	ObjectiveTriggeredSFX=AkEvent'WW_UI_Objectives.Play_UI_NewObjective'
	ObjectiveCompletedSFX=AkEvent'WW_UI_Objectives.Play_UI_ObjectiveComplete'
	ObjectiveFailedSFX=AkEvent'WW_UI_Objectives.Play_UI_Objective_Fail'
	ObjectiveCrossOffSFX=AkEvent'WW_UI_Objectives.Play_UI_Objective_CrossOff'
}
