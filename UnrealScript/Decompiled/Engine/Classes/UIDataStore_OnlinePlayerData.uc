/*******************************************************************************
 * UIDataStore_OnlinePlayerData generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UIDataStore_OnlinePlayerData extends UIDataStore_Remote
    transient
    native(UIPrivate)
    config(Engine)
    hidecategories(Object,UIRoot);

var UIDataProvider_OnlineFriends FriendsProvider;
var int PlayerControllerId;
var string PlayerNick;
var config string ProfileSettingsClassName;
var class<OnlineProfileSettings> ProfileSettingsClass;
var UIDataProvider_OnlineProfileSettings ProfileProvider;
var config string ProfileProviderClassName;
var class<UIDataProvider_OnlineProfileSettings> ProfileProviderClass;
var config string PlayerStorageClassName;
var class<OnlinePlayerStorage> PlayerStorageClass;
var UIDataProvider_OnlinePlayerStorage StorageProvider;
var config string StorageProviderClassName;
var class<UIDataProvider_OnlinePlayerStorage> StorageProviderClass;
var UIDataProvider_OnlineFriendMessages FriendMessagesProvider;
var UIDataProvider_PlayerAchievements AchievementsProvider;
var config string FriendsProviderClassName;
var class<UIDataProvider_OnlineFriends> FriendsProviderClass;
var config string FriendMessagesProviderClassName;
var class<UIDataProvider_OnlineFriendMessages> FriendMessagesProviderClass;
var config string AchievementsProviderClassName;
var class<UIDataProvider_PlayerAchievements> AchievementsProviderClass;
var config string PartyChatProviderClassName;
var class<UIDataProvider_OnlinePartyChatList> PartyChatProviderClass;
var UIDataProvider_OnlinePartyChatList PartyChatProvider;

event OnRegister(LocalPlayer InPlayer)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    if((InPlayer != none) && !Class'WorldInfo'.static.IsConsoleBuild(9))
    {
        PlayerControllerId = InPlayer.ControllerId;
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
            }
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, (none)))
            {
                OnlineSub.PlayerInterfaceEx.AddProfileDataChangedDelegate(byte(PlayerControllerId), OnPlayerDataChange);
            }            
        }
        else
        {
            if((ProfileProvider != none) && ProfileProvider.Profile != none)
            {
                ProfileProvider.Profile.SetToDefaults();
            }
        }
        RegisterDelegates();
        OnLoginChange(byte(PlayerControllerId));
    }
}

event OnUnregister()
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    if(PlayerControllerId != -1)
    {
        ClearDelegates();
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
            {
                PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            }
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, (none)))
            {
                OnlineSub.PlayerInterfaceEx.ClearProfileDataChangedDelegate(byte(PlayerControllerId), OnPlayerDataChange);
            }
        }
    }
}

function OnLoginChange(byte LocalUserNum)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    if(LocalUserNum == PlayerControllerId)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            if(NotEqual_InterfaceInterface(PlayerInterface, (none)) && (PlayerInterface.GetLoginStatus(byte(PlayerControllerId)) > 0) || Class'WorldInfo'.static.IsConsoleBuild(8))
            {
                PlayerNick = PlayerInterface.GetPlayerNickname(byte(PlayerControllerId));                
            }
            else
            {
                PlayerNick = "";
                ProfileProvider.Profile.SetToDefaults();
                StorageProvider.Profile.SetToDefaults();
            }
        }
        RefreshSubscribers();
    }
}

function OnPlayerDataChange()
{
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, (none)))
        {
            PlayerNick = OnlineSub.PlayerInterface.GetPlayerNickname(byte(PlayerControllerId));
            RefreshSubscribers();
        }
    }
}

function RegisterDelegates();

function ClearDelegates();

event OnlineProfileSettings GetCachedPlayerProfile(int ControllerId)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;
    local OnlineProfileSettings Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
        {
            Result = PlayerInterface.GetProfileSettings(byte(ControllerId));
        }
    }
    return Result;
}

event OnlinePlayerStorage GetCachedPlayerStorage(int ControllerId)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;
    local OnlinePlayerStorage Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
        {
            Result = PlayerInterface.GetPlayerStorage(byte(ControllerId));
        }
    }
    return Result;
}

defaultproperties
{
    PlayerControllerId=-1
    PlayerNick="PlayerNickNameHere"
    ProfileSettingsClassName="KFGame.KFProfileSettings"
    PlayerStorageClassName="KFGame.KFProfileSettings"
    PartyChatProviderClassName="Engine.UIDataProvider_OnlinePartyChatList"
    Tag=OnlinePlayerData
}