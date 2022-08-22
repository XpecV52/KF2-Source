/*******************************************************************************
 * GeneralSettings generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class GeneralSettings extends WebAdminSettings;

var GameInfo GameInfo;

function setCurrentGameInfo(GameInfo Instance)
{
    super.setCurrentGameInfo(Instance);
    GameInfo = Instance;
    if(GameInfo != none)
    {
        initSettings();
    }
}

function cleanupSettings()
{
    GameInfo = none;
    super.cleanupSettings();
}

function initSettings()
{
    local OnlineGameSettings GameSettings;
    local GameEngine GEngine;

    GEngine = GameEngine(Class'Engine'.static.GetEngine());
    if((GameInfo != none) && GameInfo.GameReplicationInfo != none)
    {
        SetStringPropertyByName('ServerName', GameInfo.GameReplicationInfo.ServerName);        
    }
    else
    {
        SetStringPropertyByName('ServerName', Class'GameReplicationInfo'.default.ServerName);
    }
    if(GEngine != none)
    {
        SetIntPropertyByName('bUsedForTakeover', int(GEngine.bUsedForTakeover));        
    }
    else
    {
        SetIntPropertyByName('bUsedForTakeover', int(Class'GameEngine'.default.bUsedForTakeover));
    }
    if(GameInfo != none)
    {
        SetIntPropertyByName('MaxPlayers', GameInfo.MaxPlayers);        
    }
    else
    {
        SetIntPropertyByName('MaxPlayers', Class'GameInfo'.default.MaxPlayers);
    }
    if(GameInfo != none)
    {
        SetFloatPropertyByName('MaxIdleTime', GameInfo.MaxIdleTime);        
    }
    else
    {
        SetFloatPropertyByName('MaxIdleTime', Class'GameInfo'.default.MaxIdleTime);
    }
    if(GameInfo != none)
    {
        GameSettings = GameInfo.GameInterface.GetGameSettings(GameInfo.PlayerReplicationInfoClass.default.SessionName);
    }
    if(GameSettings != none)
    {
        SetIntPropertyByName('bAntiCheatProtected', int(GameSettings.bAntiCheatProtected));        
    }
    else
    {
        SetIntPropertyByName('bAntiCheatProtected', int(false));
    }
    if(GameInfo != none)
    {
        SetFloatPropertyByName('GameDifficulty', GameInfo.GameDifficulty);        
    }
    else
    {
        SetFloatPropertyByName('GameDifficulty', Class'GameInfo'.default.GameDifficulty);
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('GameLength', KFGameInfo(GameInfo).GameLength);        
    }
    else
    {
        SetIntPropertyByName('GameLength', Class'KFGameInfo'.default.GameLength);
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bDisableTeamCollision', int(KFGameInfo(GameInfo).bDisableTeamCollision));        
    }
    else
    {
        SetIntPropertyByName('bDisableTeamCollision', int(Class'KFGameInfo'.default.bDisableTeamCollision));
    }
    if(GameInfo != none)
    {
        SetIntPropertyByName('bAdminCanPause', int(GameInfo.bAdminCanPause));        
    }
    else
    {
        SetIntPropertyByName('bAdminCanPause', int(Class'GameInfo'.default.bAdminCanPause));
    }
    if((GameInfo != none) && KFAccessControl(GameInfo.AccessControl) != none)
    {
        SetIntPropertyByName('bSilentAdminLogin', int(KFAccessControl(GameInfo.AccessControl).bSilentAdminLogin));        
    }
    else
    {
        SetIntPropertyByName('bSilentAdminLogin', int(Class'KFAccessControl'.default.bSilentAdminLogin));
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bDisableMapVote', int(KFGameInfo(GameInfo).bDisableMapVote));        
    }
    else
    {
        SetIntPropertyByName('bDisableMapVote', int(Class'KFGameInfo'.default.bDisableMapVote));
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetFloatPropertyByName('MapVoteDuration', KFGameInfo(GameInfo).MapVoteDuration);        
    }
    else
    {
        SetFloatPropertyByName('MapVoteDuration', Class'KFGameInfo'.default.MapVoteDuration);
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetFloatPropertyByName('MapVotePercentage', KFGameInfo(GameInfo).MapVotePercentage);        
    }
    else
    {
        SetFloatPropertyByName('MapVotePercentage', Class'KFGameInfo'.default.MapVotePercentage);
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bDisableKickVote', int(KFGameInfo(GameInfo).bDisableKickVote));        
    }
    else
    {
        SetIntPropertyByName('bDisableKickVote', int(Class'KFGameInfo'.default.bDisableKickVote));
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetFloatPropertyByName('KickVotePercentage', KFGameInfo(GameInfo).KickVotePercentage);        
    }
    else
    {
        SetFloatPropertyByName('KickVotePercentage', Class'KFGameInfo'.default.KickVotePercentage);
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bDisableVOIP', int(KFGameInfo(GameInfo).bDisableVOIP));        
    }
    else
    {
        SetIntPropertyByName('bDisableVOIP', int(Class'KFGameInfo'.default.bDisableVOIP));
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bDisablePublicTextChat', int(KFGameInfo(GameInfo).bDisablePublicTextChat));        
    }
    else
    {
        SetIntPropertyByName('bDisablePublicTextChat', int(Class'KFGameInfo'.default.bDisablePublicTextChat));
    }
    if(KFGameInfo(GameInfo) != none)
    {
        SetIntPropertyByName('bPartitionSpectators', int(KFGameInfo(GameInfo).bPartitionSpectators));        
    }
    else
    {
        SetIntPropertyByName('bPartitionSpectators', int(Class'KFGameInfo'.default.bPartitionSpectators));
    }
}

function saveSettings()
{
    local int Val;
    local OnlineGameSettings GameSettings;
    local GameEngine GEngine;
    local bool bWasUsedForTakeover;

    GEngine = GameEngine(Class'Engine'.static.GetEngine());
    if(GameInfo != none)
    {
        GameSettings = GameInfo.GameInterface.GetGameSettings(GameInfo.PlayerReplicationInfoClass.default.SessionName);
    }
    if(GameSettings != none)
    {
        GetIntPropertyByName('bAntiCheatProtected', Val);
        if(GameSettings.bAntiCheatProtected != (Val != 0))
        {
            GameSettings.bAntiCheatProtected = Val != 0;
            GameInfo.GameInterface.UpdateOnlineGame(GameInfo.PlayerReplicationInfoClass.default.SessionName, GameSettings, true);
        }
    }
    GetStringPropertyByName('ServerName', Class'GameReplicationInfo'.default.ServerName);
    Class'GameReplicationInfo'.static.StaticSaveConfig();
    if((GameInfo != none) && GameInfo.GameReplicationInfo != none)
    {
        GetStringPropertyByName('ServerName', GameInfo.GameReplicationInfo.ServerName);
        GameInfo.GameReplicationInfo.SaveConfig();
    }
    if(GetIntPropertyByName('bUsedForTakeover', Val))
    {
        Class'GameEngine'.default.bUsedForTakeover = Val != 0;
    }
    Class'GameEngine'.static.StaticSaveConfig();
    if(GEngine != none)
    {
        bWasUsedForTakeover = GEngine.bUsedForTakeover;
        if(GetIntPropertyByName('bUsedForTakeover', Val))
        {
            GEngine.bUsedForTakeover = Val != 0;
        }
        GEngine.SaveConfig();
        if(!GEngine.bUsedForTakeover)
        {
            GEngine.bAvailableForTakeover = false;            
        }
        else
        {
            if(!bWasUsedForTakeover)
            {
                GEngine.bAvailableForTakeover = true;
            }
        }
    }
    if(GetIntPropertyByName('bSilentAdminLogin', Val))
    {
        Class'KFAccessControl'.default.bSilentAdminLogin = Val != 0;
    }
    Class'KFAccessControl'.static.StaticSaveConfig();
    if((GameInfo != none) && KFAccessControl(GameInfo.AccessControl) != none)
    {
        if(GetIntPropertyByName('bSilentAdminLogin', Val))
        {
            KFAccessControl(GameInfo.AccessControl).bSilentAdminLogin = Val != 0;
        }
        GameInfo.AccessControl.SaveConfig();
    }
    if(GetIntPropertyByName('bDisableTeamCollision', Val))
    {
        Class'KFGameInfo'.default.bDisableTeamCollision = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bDisableTeamCollision = Val != 0;
        }
    }
    if(GetIntPropertyByName('bDisableVOIP', Val))
    {
        Class'KFGameInfo'.default.bDisableVOIP = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bDisableVOIP = Val != 0;
        }
    }
    if(GetIntPropertyByName('bDisablePublicTextChat', Val))
    {
        Class'KFGameInfo'.default.bDisablePublicTextChat = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bDisablePublicTextChat = Val != 0;
        }
    }
    if(GetIntPropertyByName('bPartitionSpectators', Val))
    {
        Class'KFGameInfo'.default.bPartitionSpectators = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bPartitionSpectators = Val != 0;
        }
    }
    if(GetIntPropertyByName('bDisableMapVote', Val))
    {
        Class'KFGameInfo'.default.bDisableMapVote = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bDisableMapVote = Val != 0;
        }
    }
    GetFloatPropertyByName('MapVoteDuration', Class'KFGameInfo'.default.MapVoteDuration);
    if(KFGameInfo(GameInfo) != none)
    {
        GetFloatPropertyByName('MapVoteDuration', KFGameInfo(GameInfo).MapVoteDuration);
    }
    GetFloatPropertyByName('MapVotePercentage', Class'KFGameInfo'.default.MapVotePercentage);
    if(KFGameInfo(GameInfo) != none)
    {
        GetFloatPropertyByName('MapVotePercentage', KFGameInfo(GameInfo).MapVotePercentage);
    }
    if(GetIntPropertyByName('bDisableKickVote', Val))
    {
        Class'KFGameInfo'.default.bDisableKickVote = Val != 0;
        if(KFGameInfo(GameInfo) != none)
        {
            KFGameInfo(GameInfo).bDisableKickVote = Val != 0;
        }
    }
    GetFloatPropertyByName('KickVotePercentage', Class'KFGameInfo'.default.KickVotePercentage);
    if(KFGameInfo(GameInfo) != none)
    {
        GetFloatPropertyByName('KickVotePercentage', KFGameInfo(GameInfo).KickVotePercentage);
    }
    Class'KFGameInfo'.static.StaticSaveConfig();
    GetIntPropertyByName('MaxPlayers', Class'GameInfo'.default.MaxPlayers);
    if(GameInfo != none)
    {
        GetIntPropertyByName('MaxPlayers', GameInfo.MaxPlayers);
    }
    if(GetIntPropertyByName('bAdminCanPause', Val))
    {
        Class'GameInfo'.default.bAdminCanPause = Val != 0;
        if(GameInfo != none)
        {
            GameInfo.bAdminCanPause = Val != 0;
        }
    }
    GetFloatPropertyByName('MaxIdleTime', Class'GameInfo'.default.MaxIdleTime);
    if(GameInfo != none)
    {
        GetFloatPropertyByName('MaxIdleTime', GameInfo.MaxIdleTime);
    }
    Class'GameInfo'.static.StaticSaveConfig();
    if(GameInfo != none)
    {
        GameInfo.SaveConfig();
        GameInfo.UpdateGameSettings();
        GameInfo.UpdateGameSettingsCounts();
    }
    GetIntPropertyByName('GameLength', Class'KFGameInfo'.default.GameLength);
    if(KFGameInfo(GameInfo) != none)
    {
        GetIntPropertyByName('GameLength', KFGameInfo(GameInfo).GameLength);
    }
    Class'KFGameInfo'.static.StaticSaveConfig();
    GetFloatPropertyByName('GameDifficulty', Class'GameInfo'.default.GameDifficulty);
    if(GameInfo != none)
    {
        GetFloatPropertyByName('GameDifficulty', GameInfo.GameDifficulty);
    }
    Class'GameInfo'.static.StaticSaveConfig();
}

defaultproperties
{
    SettingsGroups(0)=(GroupID="Server",DisplayName="Server Information",pMin=0,pMax=100,lMin=0,lMax=0)
    SettingsGroups(1)=(GroupID="Connection",DisplayName="Connection",pMin=100,pMax=200,lMin=0,lMax=0)
    SettingsGroups(2)=(GroupID="CheatDetection",DisplayName="Cheat Detection",pMin=200,pMax=300,lMin=0,lMax=0)
    SettingsGroups(3)=(GroupID="Game",DisplayName="Game",pMin=300,pMax=400,lMin=0,lMax=0)
    SettingsGroups(4)=(GroupID="Administration",DisplayName="Administration",pMin=500,pMax=600,lMin=0,lMax=0)
    SettingsGroups(5)=(GroupID="MapVoting",DisplayName="Map Voting",pMin=600,pMax=650,lMin=0,lMax=0)
    SettingsGroups(6)=(GroupID="KickVoting",DisplayName="Kick Voting",pMin=650,pMax=700,lMin=0,lMax=0)
    SettingsGroups(7)=(GroupID="Chat",DisplayName="Chat",pMin=700,pMax=800,lMin=0,lMax=0)
    FloatPredefinedValues(0)=(PropertyId=303,Values=(0,1,2,3))
    Properties=/* Array type was not detected. */
    PropertyMappings=/* Array type was not detected. */
}