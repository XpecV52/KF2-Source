/*******************************************************************************
 * WorkshopTool generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class WorkshopTool extends Info
    config(WorkshopTool)
    hidecategories(Navigation,Movement,Collision);

struct FItemDesc
{
    var string I;
    var string N;

    structdefaultproperties
    {
        I=""
        N=""
    }
};

struct FCurrentItems
{
    var string Id;
    var string N;
    var int Ix;

    structdefaultproperties
    {
        Id=""
        N=""
        Ix=0
    }
};

var KFWorkshopSteamworks workshop;
var config array<config FItemDesc> MP;
var array<FCurrentItems> CurrentItems;
var array<int> PendingInit;
var IpAddr SteamAddr;
var transient UniqueNetId LastDLItem;
var transient string LastDLFile;
var transient string LastDLID;
var WorkshopTcp CurrentLink;
var bool bWasDownloading;

function PostBeginPlay()
{
    SetTimer(0.05, false, 'InitWeb');
}

function InitWeb()
{
    local WebServer W;
    local webadmin A;
    local WorkshopWebApp xW;
    local byte I;
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub == none)
    {
        ThrowError("No Online subsystem found (make sure you use this on server)!");
        return;
    }
    workshop = KFWorkshopSteamworks(OnlineSub.GetUGCInterface());
    if(workshop == none)
    {
        ThrowError("No KFWorkshopSteamworks found!");
        return;
    }
    InitItemList();
    foreach AllActors(Class'WebServer', W)
    {
        break;        
    }    
    if(W != none)
    {
        I = 0;
        J0x133:

        if((I < 10) && A == none)
        {
            A = webadmin(W.ApplicationObjects[I]);
            ++ I;
            goto J0x133;
        }
        if(A != none)
        {
            xW = new (none) Class'WorkshopWebApp';
            xW.Tool = self;
            SetTimer(1, true, 'CheckDownload');
            A.addQueryHandler((xW));            
        }
        else
        {
            ThrowError("No valid WebAdmin application found!");
        }        
    }
    else
    {
        ThrowError("No WebServer object found!");
    }
}

final function ThrowError(string Er)
{
    LogInternal("WorkshopTool ERROR: " $ Er);
}

final function InitItemList()
{
    local int I;

    CurrentItems.Length = workshop.ServerSubscribedWorkshopItems.Length;
    I = 0;
    J0x35:

    if(I < CurrentItems.Length)
    {
        CurrentItems[I].Id = workshop.ServerSubscribedWorkshopItems[I];
        CurrentItems[I].Ix = MP.Find('I', CurrentItems[I].Id;
        if(CurrentItems[I].Ix == -1)
        {
            CurrentItems[I].N = "Resolving...";
            PendingInit.AddItem(I;            
        }
        else
        {
            CurrentItems[I].N = MP[CurrentItems[I].Ix].N;
        }
        ++ I;
        goto J0x35;
    }
    if(PendingInit.Length > 0)
    {
        ResolveNames();
    }
}

final function DeleteWorkshopItem(string User, int Index)
{
    local int I;

    BroadcastAdmins(User, ((("Deleted workshop item: " $ CurrentItems[Index].Id) $ " (") $ CurrentItems[Index].N) $ ")");
    if(CurrentItems[Index].Ix != -1)
    {
        MP.Remove(CurrentItems[Index].Ix, 1;
        I = 0;
        J0xF5:

        if(I < CurrentItems.Length)
        {
            if((I != Index) && CurrentItems[I].Ix > CurrentItems[Index].Ix)
            {
                -- CurrentItems[I].Ix;
            }
            ++ I;
            goto J0xF5;
        }
        PendingInit.RemoveItem(Index;
        I = 0;
        J0x1CE:

        if(I < PendingInit.Length)
        {
            if(PendingInit[I] > Index)
            {
                -- PendingInit[I];
            }
            ++ I;
            goto J0x1CE;
        }
        if(CurrentLink != none)
        {
            if(CurrentLink.CurrentItem == Index)
            {
                CurrentLink.AbortConnection();
                CurrentLink = none;                
            }
            else
            {
                if(CurrentLink.CurrentItem > Index)
                {
                    -- CurrentLink.CurrentItem;
                }
            }
        }
        SaveConfig();
    }
    CurrentItems.Remove(Index, 1;
    workshop.ServerSubscribedWorkshopItems.Remove(Index, 1;
    workshop.SaveConfig();
}

final function AddNewWorkshopItem(string User, string S)
{
    local int I;

    I = InStr(S, "?id=");
    if(I >= 0)
    {
        S = Mid(S, I + 4);
    }
    I = InStr(S, "&");
    if(I >= 0)
    {
        S = Left(S, I);
    }
    I = InStr(S, "?");
    if(I >= 0)
    {
        S = Left(S, I);
    }
    if(Len(S) < 3)
    {
        return;
    }
    I = CurrentItems.Find('Id', S;
    if(I >= 0)
    {
        return;
    }
    I = CurrentItems.Length;
    CurrentItems.Length = I + 1;
    CurrentItems[I].Id = S;
    CurrentItems[I].N = "Resolving...";
    CurrentItems[I].Ix = -1;
    PendingInit.AddItem(I;
    ResolveNames();
    BroadcastAdmins(User, "Added workshop item: " $ S);
    workshop.ServerSubscribedWorkshopItems.AddItem(S;
    workshop.SaveConfig();
}

final function ResolveNames()
{
    if(CurrentLink == none)
    {
        CurrentLink = Spawn(Class'WorkshopTcp');
        CurrentLink.BeginRequest(self);
    }
}

final function OnRequestDone(string Info, bool bError)
{
    local int I;

    if(bError)
    {
        CurrentItems[CurrentLink.CurrentItem].N = "ERROR: " $ Info;        
    }
    else
    {
        BroadcastAdmins("WEB", (("Resolved workshop item (" $ CurrentItems[CurrentLink.CurrentItem].Id) $ ") as: ") $ Info);
        CurrentItems[CurrentLink.CurrentItem].N = Info;
        I = MP.Length;
        MP.Length = I + 1;
        MP[I].I = CurrentItems[CurrentLink.CurrentItem].Id;
        MP[I].N = Info;
        CurrentItems[CurrentLink.CurrentItem].Ix = I;
        SaveConfig();
    }
    PendingInit.RemoveItem(CurrentLink.CurrentItem;
    CurrentLink = none;
    if(PendingInit.Length > 0)
    {
        ResolveNames();
    }
}

final function BroadcastAdmins(string User, string S, optional bool bPublic)
{
    local PlayerController PC;
    local string PB;

    if(bPublic)
    {
        PB = "NOTICE: " $ S;
    }
    S = (("*ADMIN*(" $ User) $ "): ") $ S;
    LogInternal(S);
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        if((PC.PlayerReplicationInfo.bAdmin || PC.IsA('Admin')) || WorldInfo.NetMode == NM_Standalone)
        {
            PC.TeamMessage(PC.PlayerReplicationInfo, S, 'Event');
            continue;
        }
        if(bPublic)
        {
            PC.TeamMessage(PC.PlayerReplicationInfo, PB, 'Event');
        }        
    }    
}

final function CheckDownload()
{
    if(!bWasDownloading)
    {
        if(workshop.CurrentDownloads.Length == 0)
        {
            return;
        }
        bWasDownloading = true;
        LastDLItem = workshop.CurrentDownloads[0];
        ResolveFileName();        
    }
    else
    {
        if(workshop.CurrentDownloads.Length == 0)
        {
            bWasDownloading = false;
            BroadcastAdmins("WEB", "Server has stopped downloading workshop items.", true);            
        }
        else
        {
            if(LastDLItem != workshop.CurrentDownloads[0])
            {
                LastDLItem = workshop.CurrentDownloads[0];
                ResolveFileName();
            }
        }
    }
}

final function ResolveFileName()
{
    local int I;
    local OnlineSubsystemSteamworks S;

    LastDLFile = "Unknown file";
    S = OnlineSubsystemSteamworks(Class'GameEngine'.static.GetOnlineSubsystem());
    if(S == none)
    {
        BroadcastAdmins("WEB", "Server is now downloading an unknown workshop item", true);
        return;
    }
    LastDLID = S.UniqueNetIdToInt64(LastDLItem);
    I = MP.Find('I', LastDLID;
    if(I >= 0)
    {
        LastDLFile = MP[I].N;        
    }
    else
    {
        LastDLFile = "Unknown";
    }
    BroadcastAdmins("WEB", ((("Server is now downloading workshop item: " $ LastDLFile) $ " (") $ LastDLID) $ ")", true);
}

defaultproperties
{
    Components=none
}