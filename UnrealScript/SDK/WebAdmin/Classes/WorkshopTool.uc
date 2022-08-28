// Created by Marco - 3/27/2016
Class WorkshopTool extends Info
	Config(WorkshopTool);

var KFWorkshopSteamworks Workshop;
struct FItemDesc
{
	var string I,N;
};
var config array<FItemDesc> MP;

struct FCurrentItems
{
	var string ID,N;
	var int Ix;
};
var array<FCurrentItems> CurrentItems;
var array<int> PendingInit;
var IpAddr SteamAddr;

var transient UniqueNetId LastDLItem;
var transient string LastDLFile,LastDLID;

var WorkshopTcp CurrentLink;

var bool bWasDownloading;

function PostBeginPlay()
{
	SetTimer(0.05,false,'InitWeb');
}
function InitWeb()
{
	local WebServer W;
	local WebAdmin A;
	local WorkshopWebApp xW;
	local byte i;
	local OnlineSubsystem OnlineSub;

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if( OnlineSub==None )
	{
		ThrowError("No Online subsystem found (make sure you use this on server)!");
		return;
	}
	Workshop = KFWorkshopSteamworks(OnlineSub.GetUGCInterface());
	if( Workshop==None )
	{
		ThrowError("No KFWorkshopSteamworks found!");
		return;
	}
	InitItemList();
	foreach AllActors(class'WebServer',W)
		break;
	if( W!=None )
	{
		for( i=0; (i<10 && A==None); ++i )
			A = WebAdmin(W.ApplicationObjects[i]);
		if( A!=None )
		{
			xW = new (None) class'WorkshopWebApp';
			xW.Tool = Self;
			SetTimer(1.0,true,'CheckDownload');
			A.addQueryHandler(xW);
		}
		else ThrowError("No valid WebAdmin application found!");
	}
	else ThrowError("No WebServer object found!");
}

final function ThrowError( string Er )
{
	`Log("WorkshopTool ERROR: "$Er);
}

final function InitItemList()
{
	local int i;

	CurrentItems.Length = Workshop.ServerSubscribedWorkshopItems.Length;
	for( i=0; i<CurrentItems.Length; ++i )
	{
		CurrentItems[i].ID = Workshop.ServerSubscribedWorkshopItems[i];
		CurrentItems[i].Ix = MP.Find('I',CurrentItems[i].ID);
		if( CurrentItems[i].Ix==-1 )
		{
			CurrentItems[i].N = "Resolving...";
			PendingInit.AddItem(i);
		}
		else CurrentItems[i].N = MP[CurrentItems[i].Ix].N;
	}
	if( PendingInit.Length>0 )
		ResolveNames();
}
final function DeleteWorkshopItem( string User, int Index )
{
	local int i;

	BroadcastAdmins(User,"Deleted workshop item: "$CurrentItems[Index].ID$" ("$CurrentItems[Index].N$")");
	if( CurrentItems[Index].Ix!=-1 )
	{
		MP.Remove(CurrentItems[Index].Ix,1);
		
		// Move down all others offsets.
		for( i=0; i<CurrentItems.Length; ++i )
			if( i!=Index && CurrentItems[i].Ix>CurrentItems[Index].Ix )
				--CurrentItems[i].Ix;
		
		// Remove pending data.
		PendingInit.RemoveItem(Index);
		for( i=0; i<PendingInit.Length; ++i )
			if( PendingInit[i]>Index )
				--PendingInit[i];
		
		// Close pending connection.
		if( CurrentLink!=None )
		{
			if( CurrentLink.CurrentItem==Index )
			{
				CurrentLink.AbortConnection();
				CurrentLink = None;
			}
			else if( CurrentLink.CurrentItem>Index )
				--CurrentLink.CurrentItem;
		}

		// Update config.
		SaveConfig();
	}
	CurrentItems.Remove(Index,1); // Remove UI info.
	
	// Remove from workshop itself.
	Workshop.ServerSubscribedWorkshopItems.Remove(Index,1);
	Workshop.SaveConfig();
}

final function AddNewWorkshopItem( string User, string S )
{
	local int i;
	
	i = InStr(S,"?id=");
	if( i>=0 )
		S = Mid(S,i+4);
	i = InStr(S,"&");
	if( i>=0 )
		S = Left(S,i);
	i = InStr(S,"?");
	if( i>=0 )
		S = Left(S,i);
	if( Len(S)<3 )
		return;
	i = CurrentItems.Find('ID',S);
	if( i>=0 )
		return;
	
	i = CurrentItems.Length;
	CurrentItems.Length = i+1;
	CurrentItems[i].ID = S;
	CurrentItems[i].N = "Resolving...";
	CurrentItems[i].Ix = -1;
	PendingInit.AddItem(i);
	ResolveNames();
	
	BroadcastAdmins(User,"Added workshop item: "$S);

	// Add to workshop.
	Workshop.ServerSubscribedWorkshopItems.AddItem(S);
	Workshop.SaveConfig();
}

final function ResolveNames()
{
	if( CurrentLink==None )
	{
		CurrentLink = Spawn(class'WorkshopTcp');
		CurrentLink.BeginRequest(Self);
	}
}

final function OnRequestDone( string Info, bool bError )
{
	local int i;

	if( bError )
		CurrentItems[CurrentLink.CurrentItem].N = "ERROR: "$Info;
	else
	{
		BroadcastAdmins("WEB","Resolved workshop item ("$CurrentItems[CurrentLink.CurrentItem].ID$") as: "$Info);
		CurrentItems[CurrentLink.CurrentItem].N = Info;
		i = MP.Length;
		MP.Length = i+1;
		MP[i].I = CurrentItems[CurrentLink.CurrentItem].ID;
		MP[i].N = Info;
		CurrentItems[CurrentLink.CurrentItem].Ix = i;
		SaveConfig();
	}
	PendingInit.RemoveItem(CurrentLink.CurrentItem);
	CurrentLink = None;
	
	if( PendingInit.Length>0 )
		ResolveNames();
}

final function BroadcastAdmins( string User, string S, optional bool bPublic )
{
	local PlayerController PC;
	local string PB;
	
	if( bPublic )
		PB = "NOTICE: "$S;
	S = "*ADMIN*("$User$"): "$S;
	`Log(S);
	foreach WorldInfo.AllControllers(class'PlayerController',PC)
	{
		if( PC.PlayerReplicationInfo.bAdmin || PC.IsA('Admin') || WorldInfo.NetMode==NM_StandAlone )
			PC.TeamMessage(PC.PlayerReplicationInfo,S,'Event');
		else if( bPublic )
			PC.TeamMessage(PC.PlayerReplicationInfo,PB,'Event');
	}
}

final function CheckDownload()
{
	if( !bWasDownloading )
	{
		if( Workshop.CurrentDownloads.Length==0 )
			return;
		bWasDownloading = true;
		LastDLItem = Workshop.CurrentDownloads[0];
		ResolveFileName();
	}
	else if( Workshop.CurrentDownloads.Length==0 )
	{
		bWasDownloading = false;
		BroadcastAdmins("WEB","Server has stopped downloading workshop items.",true);
	}
	else if( LastDLItem!=Workshop.CurrentDownloads[0] )
	{
		LastDLItem = Workshop.CurrentDownloads[0];
		ResolveFileName();
	}
}
final function ResolveFileName()
{
	local int i;
	local OnlineSubsystemSteamworks S;
	
	LastDLFile = "Unknown file";
	S = OnlineSubsystemSteamworks(class'GameEngine'.static.GetOnlineSubsystem());
	if( S==None )
	{
		BroadcastAdmins("WEB","Server is now downloading an unknown workshop item",true);
		return;
	}
	LastDLID = S.UniqueNetIdToInt64(LastDLItem);
	i = MP.Find('I',LastDLID);
	if( i>=0 )
		LastDLFile = MP[i].N;
	else LastDLFile = "Unknown";
	BroadcastAdmins("WEB","Server is now downloading workshop item: "$LastDLFile$" ("$LastDLID$")",true);
}

defaultproperties
{
	RemoteRole=ROLE_None
	Components.Empty()
}