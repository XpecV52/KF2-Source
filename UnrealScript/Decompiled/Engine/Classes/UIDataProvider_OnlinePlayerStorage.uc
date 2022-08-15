/*******************************************************************************
 * UIDataProvider_OnlinePlayerStorage generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UIDataProvider_OnlinePlayerStorage extends UIDataProvider_OnlinePlayerDataBase
    transient
    native(UIPrivate)
    config(Game)
    hidecategories(Object,UIRoot);

struct native PlayerStorageArrayProvider
{
    var int PlayerStorageId;
    var UIDataProvider_OnlinePlayerStorageArray Provider;

    structdefaultproperties
    {
        PlayerStorageId=0
        Provider=none
    }
};

var OnlinePlayerStorage Profile;
var const name ProviderName;
var bool bWasErrorLastRead;
var bool bIsExternalUIOpen;
var bool bNeedsDeferredRefresh;
var array<PlayerStorageArrayProvider> PlayerStorageArrayProviders;
var config int DeviceStorageSizeNeeded;

function bool ReadData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum, int DeviceID, OnlinePlayerStorage PlayerStorage)
{
    return PlayerInterface.ReadPlayerStorage(LocalUserNum, PlayerStorage, DeviceID);
}

function bool WriteData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum, int DeviceID, OnlinePlayerStorage PlayerStorage)
{
    return PlayerInterface.WritePlayerStorage(LocalUserNum, PlayerStorage, DeviceID);
}

function bool GetData(OnlinePlayerInterface PlayerInterface, byte LocalUserNum)
{
    local OnlinePlayerStorage CachedStorage;

    CachedStorage = PlayerInterface.GetPlayerStorage(LocalUserNum);
    if(CachedStorage != none)
    {
        Profile = CachedStorage;
        PlayerInterface.ReadPlayerStorage(LocalUserNum, Profile);
        return true;
    }
    return false;
}

function AddReadCompleteDelegate(OnlinePlayerInterface PlayerInterface, byte LocalUserNum)
{
    PlayerInterface.AddReadPlayerStorageCompleteDelegate(LocalUserNum, OnReadStorageComplete);
}

function ClearReadCompleteDelegate(OnlinePlayerInterface PlayerInterface, byte LocalUserNum)
{
    PlayerInterface.ClearReadPlayerStorageCompleteDelegate(LocalUserNum, OnReadStorageComplete);
}

event OnRegister(LocalPlayer InPlayer)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    super.OnRegister(InPlayer);
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
            {
                PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
                AddReadCompleteDelegate(PlayerInterface, byte(PlayerControllerId));
                GetData(PlayerInterface, byte(PlayerControllerId));
                RefreshStorageData();
            }
        }
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, (none)))
        {
            OnlineSub.SystemInterface.AddStorageDeviceChangeDelegate(OnStorageDeviceChange);
            OnlineSub.SystemInterface.AddExternalUIChangeDelegate(OnExternalUIChange);
        }
    }
}

event OnUnregister()
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(OnlineSub != none)
    {
        PlayerInterface = OnlineSub.PlayerInterface;
        if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
        {
            PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
            ClearReadCompleteDelegate(PlayerInterface, byte(PlayerControllerId));
        }
        if(NotEqual_InterfaceInterface(OnlineSub.SystemInterface, (none)))
        {
            OnlineSub.SystemInterface.ClearStorageDeviceChangeDelegate(OnStorageDeviceChange);
            OnlineSub.SystemInterface.ClearExternalUIChangeDelegate(OnExternalUIChange);
        }
    }
    super.OnUnregister();
}

function OnReadStorageComplete(byte LocalUserNum, bool bWasSuccessful)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;

    if(bWasSuccessful == true)
    {
        if(!bWasErrorLastRead)
        {            
        }
        else
        {
            OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
            if(OnlineSub != none)
            {
                PlayerInterface = OnlineSub.PlayerInterface;
                if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
                {
                    bWasErrorLastRead = false;
                    if((ReadData(PlayerInterface, byte(PlayerControllerId), Profile.DeviceID, Profile)) == false)
                    {
                        bWasErrorLastRead = true;
                    }
                }
            }
        }        
    }
    else
    {
        bWasErrorLastRead = true;
        LogInternal("Failed to read online storage data", 'DevOnline');
    }
}

function OnLoginChange(byte LocalUserNum)
{
    local OnlineSubsystem OnlineSub;
    local OnlinePlayerInterface PlayerInterface;
    local OnlineSubsystem.ELoginStatus LoginStatus;
    local UniqueNetId NetId;

    if(LocalUserNum == PlayerControllerId)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(OnlineSub != none)
        {
            PlayerInterface = OnlineSub.PlayerInterface;
            if(NotEqual_InterfaceInterface(PlayerInterface, (none)))
            {
                LoginStatus = PlayerInterface.GetLoginStatus(byte(PlayerControllerId));
                PlayerInterface.GetUniquePlayerId(byte(PlayerControllerId), NetId);
                if(LoginStatus == 0)
                {
                    Profile.SetToDefaults();
                }
            }
        }
        RefreshStorageData();
    }
}

function RefreshStorageData()
{
    local OnlineSubsystem OnlineSub;
    local bool bFoundCachedData;

    if(!bIsExternalUIOpen)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, (none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, (none)))
        {
            bFoundCachedData = GetData(OnlineSub.PlayerInterface, byte(PlayerControllerId));
            if(!bFoundCachedData || bFoundCachedData && !OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceID, DeviceStorageSizeNeeded))
            {
                ShowDeviceSelection();
            }
        }        
    }
    else
    {
        bNeedsDeferredRefresh = true;
    }
}

function ShowDeviceSelection()
{
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, (none))) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterfaceEx, (none)))
    {
        OnlineSub.PlayerInterfaceEx.AddDeviceSelectionDoneDelegate(byte(PlayerControllerId), OnDeviceSelectionComplete);
        OnlineSub.PlayerInterfaceEx.ShowDeviceSelectionUI(byte(PlayerControllerId), DeviceStorageSizeNeeded);
    }
}

function OnDeviceSelectionComplete(bool bWasSuccessful)
{
    local OnlineSubsystem OnlineSub;
    local string Ignored;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    OnlineSub.PlayerInterfaceEx.ClearDeviceSelectionDoneDelegate(byte(PlayerControllerId), OnDeviceSelectionComplete);
    if(bWasSuccessful)
    {
        Profile.DeviceID = OnlineSub.PlayerInterfaceEx.GetDeviceSelectionResults(byte(PlayerControllerId), Ignored);
        LogInternal(((((("OnDeviceSelectionComplete(" $ string(bWasSuccessful)) $ ") for ControllerId (") $ string(PlayerControllerId)) $ ") with DeviceId (") $ string(Profile.DeviceID)) $ ")", 'DevOnline');
        if((ReadData(OnlineSub.PlayerInterface, byte(PlayerControllerId), Profile.DeviceID, Profile)) == false)
        {
        }        
    }
    else
    {
        Profile.DeviceID = -1;
    }
}

function OnStorageDeviceChange()
{
    local OnlineSubsystem OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.SystemInterface, (none)))
    {
        if(!OnlineSub.PlayerInterfaceEx.IsDeviceValid(Profile.DeviceID, DeviceStorageSizeNeeded))
        {
            Profile.DeviceID = -1;
            RefreshStorageData();
        }
    }
}

function OnExternalUIChange(bool bIsOpening)
{
    bIsExternalUIOpen = bIsOpening;
    if(!bIsOpening && bNeedsDeferredRefresh)
    {
        RefreshStorageData();
    }
}

defaultproperties
{
    ProviderName=PlayerStorageData
}