/*******************************************************************************
 * InternetLink generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class InternetLink extends Info
    transient
    native
    hidecategories(Navigation,Movement,Collision);

enum ELinkMode
{
    MODE_Text,
    MODE_Line,
    MODE_Binary,
    MODE_MAX
};

enum ELineMode
{
    LMODE_auto,
    LMODE_DOS,
    LMODE_UNIX,
    LMODE_MAC,
    LMODE_MAX
};

enum EReceiveMode
{
    RMODE_Manual,
    RMODE_Event,
    RMODE_MAX
};

struct IpAddr
{
    var int Addr;
    var int Port;

    structdefaultproperties
    {
        Addr=0
        Port=0
    }
};

var InternetLink.ELinkMode LinkMode;
var InternetLink.ELineMode InLineMode;
var InternetLink.ELineMode OutLineMode;
var InternetLink.EReceiveMode ReceiveMode;
var const Pointer Socket;
var const int Port;
var const Pointer RemoteSocket;
var private native const Pointer PrivateResolveInfo;
var const int DataPending;

// Export UInternetLink::execIsDataPending(FFrame&, void* const)
native function bool IsDataPending();

// Export UInternetLink::execParseURL(FFrame&, void* const)
native function bool ParseURL(coerce string URL, out string Addr, out int PortNum, out string LevelName, out string EntryName);

// Export UInternetLink::execResolve(FFrame&, void* const)
native function Resolve(coerce string Domain);

// Export UInternetLink::execGetLastError(FFrame&, void* const)
native function int GetLastError();

// Export UInternetLink::execIpAddrToString(FFrame&, void* const)
native function string IpAddrToString(IpAddr Arg);

// Export UInternetLink::execStringToIpAddr(FFrame&, void* const)
native function bool StringToIpAddr(string Str, out IpAddr Addr);

// Export UInternetLink::execGetLocalIP(FFrame&, void* const)
native function GetLocalIP(out IpAddr Arg);

event Resolved(IpAddr Addr);

event ResolveFailed();

defaultproperties
{
    ReceiveMode=EReceiveMode.RMODE_Event
    begin object name=Sprite class=SpriteComponent
        ReplacementPrimitive=none
    object end
    // Reference: SpriteComponent'Default__InternetLink.Sprite'
    Components(0)=Sprite
    CollisionType=ECollisionType.COLLIDE_CustomDefault
}