/*******************************************************************************
 * WorkshopTcp generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class WorkshopTcp extends TcpLink
    transient
    hidecategories(Navigation,Movement,Collision);

var int CurrentItem;
var WorkshopTool Tool;
var string RequestedID;
var string ReqWebsite;
var string URL;
var string CRLF;
var string FullLine;
var byte CurrentStage;
var bool bBadHeader;
var bool bHasConnection;

function PostBeginPlay()
{
    CRLF = Chr(13) $ Chr(10);
}

final function BeginRequest(WorkshopTool T)
{
    Tool = T;
    CurrentItem = Tool.PendingInit[0];
    RequestedID = Tool.CurrentItems[CurrentItem].Id;
    if((BindPort()) != -1)
    {
        if(T.SteamAddr.Port == 80)
        {
            Resolved(T.SteamAddr);            
        }
        else
        {
            Resolve(ReqWebsite);
        }        
    }
    else
    {
        EncounteredError("Failed to bind a new port");
    }
}

function Resolved(IpAddr Addr)
{
    Addr.Port = 80;
    Tool.SteamAddr = Addr;
    if(Open(Addr))
    {        
    }
    else
    {
        EncounteredError("Failed to open TcpConnection");
    }
}

event Opened()
{
    local string S;

    bHasConnection = true;
    S = (((((((((("GET " $ URL) $ RequestedID) $ " HTTP/1.0") $ CRLF) $ "User-Agent: KF2") $ CRLF) $ "Host:") $ ReqWebsite) $ ":80") $ CRLF) $ CRLF;
    SendText(S);
}

function ReceivedText(string Text)
{
    local int I;

    if(bBadHeader)
    {
        return;
    }
    if((CurrentStage == 0) && !VerifyHeader(Text))
    {
        return;
    }
    FullLine = FullLine $ Text;
    if(CurrentStage == 1)
    {
        I = InStr(FullLine, "<title>");
        if(I == -1)
        {
            return;
        }
        FullLine = Mid(FullLine, I + 7);
        ++ CurrentStage;
    }
    if(CurrentStage == 2)
    {
        I = InStr(FullLine, "</title>");
        if(I == -1)
        {
            return;
        }
        FullLine = Left(FullLine, I);
        I = InStr(FullLine, ":: ");
        if(I != -1)
        {
            FullLine = Mid(FullLine, I + 3);
        }
        Tool.OnRequestDone(FullLine, false);
        bBadHeader = true;
        bHasConnection = false;
        Close();
    }
}

final function bool VerifyHeader(string S)
{
    local int I;

    I = InStr(S, " ");
    if(I == -1)
    {
        EncounteredError("Invalid HTTP header!");
        return false;
    }
    S = Mid(S, I + 1);
    if(Left(S, 3) != "200")
    {
        I = InStr(S, CRLF);
        if(I > 0)
        {
            S = Left(S, I);
        }
        EncounteredError("HTTP error: " $ S);
        return false;
    }
    ++ CurrentStage;
    return true;
}

final function EncounteredError(string S)
{
    if(bBadHeader)
    {
        return;
    }
    bBadHeader = true;
    Tool.OnRequestDone(S, true);
    if(bHasConnection)
    {
        bHasConnection = false;
        Close();        
    }
    else
    {
        LifeSpan = 5;
    }
}

final function AbortConnection()
{
    bBadHeader = true;
    Close();
}

event Closed()
{
    if(!bBadHeader)
    {
        EncounteredError("Unexpected closed connection");        
    }
    else
    {
        Destroy();
    }
}

defaultproperties
{
    RequestedID="1234"
    ReqWebsite="steamcommunity.com"
    URL="/sharedfiles/filedetails/?id="
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__WorkshopTcp.Sprite'
    Components(0)=Sprite
}