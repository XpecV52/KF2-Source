//=============================================================================
// KFGFxPopup_FriendsList
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 SABER Interactive
//  - Author Pavel Rodionov 18/10/2019
//=============================================================================

class KFGFxPopup_FriendsList extends KFGFxObject_Popup;

var OnlineSubsystemSteamworks OnlineSub;
var KFOnlineLobbySteamworks SteamworksLobby;

function InitializePopup( KFGFxMoviePlayer_Manager InManager )
{
    Super.InitializePopup(InManager);
    
    OnlineSub = OnlineSubsystemSteamworks(class'GameEngine'.static.GetOnlineSubsystem());
    SteamworksLobby = KFOnlineLobbySteamworks(OnlineSub.GetLobbyInterface());

    setLocalizedText();

    setOtherFirendsTitleVisibility();
    fillFriendsListPopup();
    SetupLinkVisibility();

    OnlineSub.AddLoginOnOtherPlatformDoneAndFriendsReadyDelegate(OnLoginOnOtherPlatformDoneAndFriendsReady);
    OnlineSub.AddFriendsChangeDelegate(0, OnFriendsChange);
    OnlineSub.TriggerRefreshFriendsList();
}

function setLocalizedText()
{
    local GFxObject LocalizedStringsObject;

    LocalizedStringsObject = CreateObject("Object");
    
    LocalizedStringsObject.SetString("titleText", Class'KFCommon_LocalizedStrings'.default.FriendsListPopupTitleString);
    LocalizedStringsObject.SetString("friendName", Class'KFCommon_LocalizedStrings'.default.FriendsListPopupFriendString);
    LocalizedStringsObject.SetString("friendsBlockTitleText", Class'KFCommon_LocalizedStrings'.default.FriendsListPopupFriendsString);
    LocalizedStringsObject.SetString("otherFriendsBlockTitleText", Class'KFCommon_LocalizedStrings'.default.FriendsListPopupOtherFriendsString);
    LocalizedStringsObject.SetString("linkText", Class'KFCommon_LocalizedStrings'.default.FriendsListPopupLinkButonString);

    SetObject("setTextLocalized", LocalizedStringsObject);
}

function SetupLinkVisibility()
{
    if (OnlineSub.IsLoggedInOnOtherPlatform())
    {
        SetBool("showLink", false);
    }
}

function setOtherFirendsTitleVisibility()
{
    if (class'WorldInfo'.static.IsEosBuild())
    {
        GetObject("otherFriendsTitle").SetVisible(false);
    }
}

function fillFriendsListPopup() 
{
    local array<OnlineFriend> FriendsList;
    local array<OnlineFriend> FriendsFromOtherPlatformList;

    local GFxObject FriendDataObject;
    local GFxObject OtherFriendDataObject;
    local int i;
    local int index1;
    local int  index2;

    OnlineSub.GetFriendsList(0, FriendsList);
    OnlineSub.GetFriendsListFromOtherPlatform(0, FriendsFromOtherPlatformList);

    FriendDataObject = CreateArray();
    OtherFriendDataObject = CreateArray();

    index1 = 0;
    for (i = 0; i < FriendsList.Length; i++)
    {

        friendsListLog(FriendsList[i]);

        FriendDataObject.SetElementObject(index1++, CreateFriendItem(FriendsList[i]));
    }

    index2 = 0;
    for (i = 0; i < FriendsFromOtherPlatformList.length; i++)
    {
        friendsListLog(FriendsFromOtherPlatformList[i]);

        OtherFriendDataObject.SetElementObject(index2++, CreateFriendItem(FriendsFromOtherPlatformList[i]));
    }

    //send friends list to flash popup
    SetObject("fillFriendsList", FriendDataObject);
    SetObject("fillOtherFriendsList", OtherFriendDataObject);

    GetObject("friendsTitle").GetObject("btnPlus").SetVisible(FriendsList.Length == 0);
    GetObject("friendsTitle").GetObject("btnMinus").SetVisible(FriendsList.Length != 0);
    GetObject("otherFriendsTitle").GetObject("btnPlus").SetVisible(FriendsFromOtherPlatformList.Length == 0);
    GetObject("otherFriendsTitle").GetObject("btnMinus").SetVisible(FriendsFromOtherPlatformList.Length != 0);

    //sendFakeData();//for testing only  
}

function GFxObject CreateFriendItem(OnlineFriend friend)
{
	local GFxObject DataObject;
    local KFPlayerController KFPC;
    local string AvatarPath;
    local int i;
    local UniqueNetId ZeroId;

    KFPC = KFPlayerController(GetPC());
	DataObject = CreateObject("Object");

    //waiting avatar URL from steam
    if (friend.UniqueId != ZeroId) 
    {
        AvatarPath = "";	
        for (i = 0; i < 10; i++) 
        {
            AvatarPath = KFPC.GetSteamAvatar(friend.UniqueId);
            if (AvatarPath != "") {
                break;
            }
        }
    } 

    LogInternal("avatarURL:"@AvatarPath);
   
	DataObject.SetString("friendName", friend.NickName);
    DataObject.SetString("friendUid", Class'OnlineSubsystem'.static.UniqueNetIdToString(friend.UniqueId));
    DataObject.SetBool("sendInvite", false);
    DataObject.SetString("profileImageSource", "img://"$AvatarPath);

	return DataObject;
}

function string getAvatarPath(UniqueNetId friendId, KFPlayerController KFPC)
{
    local string AvatarPath;
    local int i;
    local UniqueNetId ZeroId;
    //waiting avatar URL from steam
    if (friendId != ZeroId) 
    {
        AvatarPath = "";	
        for (i = 0; i < 10; i++) 
        {
            AvatarPath = KFPC.GetSteamAvatar(friendId);
            if (AvatarPath != "") {
                return AvatarPath;
            }
        }
    }
    return ""; 
}


//Callback functions
function OnFriendsChange()
{
    fillFriendsListPopup();
}

function OnLoginOnOtherPlatformDoneAndFriendsReady()
{
    fillFriendsListPopup();
    SetupLinkVisibility();
}

function Callback_BtnBackClick()
{
    OnlineSub.ClearLoginOnOtherPlatformDoneAndFriendsReadyDelegate(OnLoginOnOtherPlatformDoneAndFriendsReady);
    OnlineSub.ClearFriendsChangeDelegate(0, OnFriendsChange);
	ClosePopUp();
}

function Callback_SendInviteToSelectedFriend(String Uid)
{
    local UniqueNetId FriendUid;

    LogInternal(getFuncName()@"Uid:"@Uid);

    Class'OnlineSubsystem'.static.StringToUniqueNetId(Uid, FriendUid);

    if (SteamworksLobby != none)
	{ 
        SteamworksLobby.InviteFriendToLobbyByUid(FriendUid.Uid);
	}
}

function Callback_BtnLinkClick()
{
    LogInternal(getFuncName());
    OnlineSub.LoginOnOtherPlatform();
}

function friendsListLog(OnlineFriend friend) 
{
    LogInternal("**********FRIEND**********");
    LogInternal("Name:"@friend.NickName);
    LogInternal("UniqueId:"@Class'OnlineSubsystem'.static.UniqueNetIdToString(friend.UniqueId));
    //`log(friend.SessionId);
    //`log("PresenceInfo:"@friend.PresenceInfo);
    //`log("FriendState:"@friend.FriendState);
    LogInternal("bIsOnline:"@friend.bIsOnline);
    LogInternal("bIsPlaying:"@friend.bIsPlaying);
    LogInternal("bIsPlayingThisGame:"@friend.bIsPlayingThisGame);
    LogInternal("bIsJoinable:"@friend.bIsJoinable);
    //`log("bHasVoiceSupport:"@friend.bHasVoiceSupport);
    LogInternal("bHaveInvited:"@friend.bHaveInvited);
    LogInternal("bHasInvitedYou:"@friend.bHasInvitedYou);
}

function Callback_Log(String text)
{
    LogInternal("---From Popup"@text);
}

function sendFakeData()
{
    local int i;
    local GFxObject DataObject1;
    local GFxObject itemDataObject1;
    local GFxObject DataObject2;
    local GFxObject itemDataObject2;

    DataObject1 = CreateArray();
    DataObject2 = CreateArray();
    

    for (i = 0; i < 12; i++)
    {
        itemDataObject1 = CreateObject("Object");
        itemDataObject1.SetString("friendName", "Nick_"$i);
        itemDataObject1.SetBool("sendInvite", false);
        itemDataObject1.SetString("profileImageSource", "img://");

        itemDataObject2 = CreateObject("Object");
        itemDataObject2.SetString("friendName", "OtherNick_"$i);
        itemDataObject2.SetBool("sendInvite", false);
        itemDataObject2.SetString("profileImageSource", "img://");

        DataObject1.SetElementObject(i, itemDataObject1);
        DataObject2.SetElementObject(i, itemDataObject2);
    }

    SetObject("fillFriendsList", DataObject1);
    SetObject("fillOtherFriendsList", DataObject2); 
}

defaultproperties
{
   Name="Default__KFGFxPopup_FriendsList"
   ObjectArchetype=KFGFxObject_Popup'KFGame.Default__KFGFxObject_Popup'
}
