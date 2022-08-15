/**
 * Server wide settings
 *
 * Copyright (C) 2011,2014 Tripwire Interactive LLC
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class GeneralSettings extends WebAdminSettings;








































	

















	








	




	


























	









	




	




	























	












#linenumber 10

























































var GameInfo gameinfo;

function setCurrentGameInfo(GameInfo instance)
{
	super.setCurrentGameInfo(instance);
	gameinfo = instance;
	// reload values
	if (gameinfo != none)
	{
		initSettings();
	}
}

function cleanupSettings()
{
	gameinfo = none;
	super.cleanupSettings();
}

function initSettings()
{
	local OnlineGameSettings GameSettings;

	// Server Information
	if (gameinfo != none && gameinfo.GameReplicationInfo != none)
	{
		SetStringPropertyByName('ServerName', gameinfo.GameReplicationInfo.ServerName);
	}
	else {
		SetStringPropertyByName('ServerName', class'GameReplicationInfo'.default.ServerName);
	}

	// Connection settings
	if (gameinfo  != none){SetIntPropertyByName('MaxPlayers' , gameinfo .MaxPlayers);}else {SetIntPropertyByName('MaxPlayers' , class'GameInfo '.default.MaxPlayers);};
	if (gameinfo  != none){SetFloatPropertyByName('MaxIdleTime' , gameinfo .MaxIdleTime);}else {SetFloatPropertyByName('MaxIdleTime' , class'GameInfo '.default.MaxIdleTime);};

	// Cheat Detection
	if (gameinfo != none)
	{
		GameSettings = gameinfo.GameInterface.GetGameSettings(gameinfo.PlayerReplicationInfoClass.default.SessionName);
	}
	if (GameSettings != None)
	{
		SetIntPropertyByName('bAntiCheatProtected', int(GameSettings.bAntiCheatProtected));
	}
	else {
		SetIntPropertyByName('bAntiCheatProtected', int(false));
	}

	// Game settings
	if (gameinfo  != none){SetFloatPropertyByName('GameDifficulty' , gameinfo .GameDifficulty);}else {SetFloatPropertyByName('GameDifficulty' , class'GameInfo '.default.GameDifficulty);};
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('GameLength' ,  KFGameInfo (gameinfo) .GameLength);}else {SetIntPropertyByName('GameLength' , class' KFGameInfo '.default.GameLength);};
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bDisableTeamCollision' , int( KFGameInfo (gameinfo) .bDisableTeamCollision));}else {SetIntPropertyByName('bDisableTeamCollision' , int(class' KFGameInfo '.default.bDisableTeamCollision));};
	// TODO: use custom map list?

	// Administration settings
	if (gameinfo  != none){SetIntPropertyByName('bAdminCanPause' , int(gameinfo .bAdminCanPause));}else {SetIntPropertyByName('bAdminCanPause' , int(class'GameInfo '.default.bAdminCanPause));};
	if (gameinfo != none && KFAccessControl(gameinfo.AccessControl) != none)
	{
		SetIntPropertyByName('bSilentAdminLogin', int(KFAccessControl(gameinfo.AccessControl).bSilentAdminLogin));
	}
	else {
		SetIntPropertyByName('bSilentAdminLogin', int(class'KFAccessControl'.default.bSilentAdminLogin));
	}

	// Map Voting
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bDisableMapVote' , int( KFGameInfo (gameinfo) .bDisableMapVote));}else {SetIntPropertyByName('bDisableMapVote' , int(class' KFGameInfo '.default.bDisableMapVote));};
	if ( KFGameInfo (gameinfo)  != none){SetFloatPropertyByName('MapVoteDuration' ,  KFGameInfo (gameinfo) .MapVoteDuration);}else {SetFloatPropertyByName('MapVoteDuration' , class' KFGameInfo '.default.MapVoteDuration);};
	if ( KFGameInfo (gameinfo)  != none){SetFloatPropertyByName('MapVotePercentage' ,  KFGameInfo (gameinfo) .MapVotePercentage);}else {SetFloatPropertyByName('MapVotePercentage' , class' KFGameInfo '.default.MapVotePercentage);};

	// Kick voting
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bDisableKickVote' , int( KFGameInfo (gameinfo) .bDisableKickVote));}else {SetIntPropertyByName('bDisableKickVote' , int(class' KFGameInfo '.default.bDisableKickVote));};
	if ( KFGameInfo (gameinfo)  != none){SetFloatPropertyByName('KickVotePercentage' ,  KFGameInfo (gameinfo) .KickVotePercentage);}else {SetFloatPropertyByName('KickVotePercentage' , class' KFGameInfo '.default.KickVotePercentage);};

	// Chat
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bDisableVOIP' , int( KFGameInfo (gameinfo) .bDisableVOIP));}else {SetIntPropertyByName('bDisableVOIP' , int(class' KFGameInfo '.default.bDisableVOIP));};
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bDisablePublicTextChat' , int( KFGameInfo (gameinfo) .bDisablePublicTextChat));}else {SetIntPropertyByName('bDisablePublicTextChat' , int(class' KFGameInfo '.default.bDisablePublicTextChat));};
	if ( KFGameInfo (gameinfo)  != none){SetIntPropertyByName('bPartitionSpectators' , int( KFGameInfo (gameinfo) .bPartitionSpectators));}else {SetIntPropertyByName('bPartitionSpectators' , int(class' KFGameInfo '.default.bPartitionSpectators));};
}

function saveSettings()
{
	local int val;
	local OnlineGameSettings GameSettings;

	// Cheat Detection
	if (gameinfo != none)
	{
		GameSettings = gameinfo.GameInterface.GetGameSettings(gameinfo.PlayerReplicationInfoClass.default.SessionName);
	}
	if (GameSettings != None)
	{
		GetIntPropertyByName('bAntiCheatProtected', val);
		if (GameSettings.bAntiCheatProtected != (val != 0))
		{
			GameSettings.bAntiCheatProtected = val != 0;
			gameinfo.GameInterface.UpdateOnlineGame(gameinfo.PlayerReplicationInfoClass.default.SessionName, GameSettings, true);
		}
	}

	// GRI
	GetStringPropertyByName('ServerName', class'GameReplicationInfo'.default.ServerName);
	class'GameReplicationInfo'.static.StaticSaveConfig();
	if (gameinfo != none && gameinfo.GameReplicationInfo != none)
	{
		GetStringPropertyByName('ServerName', gameinfo.GameReplicationInfo.ServerName);
		gameinfo.GameReplicationInfo.SaveConfig();
	}

	// AccessControl
	if (GetIntPropertyByName('bSilentAdminLogin', val)) {	class'KFAccessControl'.default.bSilentAdminLogin= val != 0; };
	class'KFAccessControl'.static.StaticSaveConfig();
	if (gameinfo != none && KFAccessControl (gameinfo.AccessControl) != none)
	{
		if (GetIntPropertyByName('bSilentAdminLogin', val)) {	KFAccessControl(gameinfo.AccessControl).bSilentAdminLogin= val != 0; };
		gameinfo.AccessControl.SaveConfig();
	}

	// KFGameInfo
	if (GetIntPropertyByName('bDisableTeamCollision' , val)){class' KFGameInfo '.default.bDisableTeamCollision = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bDisableTeamCollision = val != 0;}};

	if (GetIntPropertyByName('bDisableVOIP' , val)){class' KFGameInfo '.default.bDisableVOIP = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bDisableVOIP = val != 0;}};
	if (GetIntPropertyByName('bDisablePublicTextChat' , val)){class' KFGameInfo '.default.bDisablePublicTextChat = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bDisablePublicTextChat = val != 0;}};
	if (GetIntPropertyByName('bPartitionSpectators' , val)){class' KFGameInfo '.default.bPartitionSpectators = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bPartitionSpectators = val != 0;}};

	if (GetIntPropertyByName('bDisableMapVote' , val)){class' KFGameInfo '.default.bDisableMapVote = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bDisableMapVote = val != 0;}};
	GetFloatPropertyByName('MapVoteDuration' , class' KFGameInfo '.default.MapVoteDuration);if ( KFGameInfo (gameinfo)  != none){GetFloatPropertyByName('MapVoteDuration' ,  KFGameInfo (gameinfo) .MapVoteDuration);};
	GetFloatPropertyByName('MapVotePercentage' , class' KFGameInfo '.default.MapVotePercentage);if ( KFGameInfo (gameinfo)  != none){GetFloatPropertyByName('MapVotePercentage' ,  KFGameInfo (gameinfo) .MapVotePercentage);};

	if (GetIntPropertyByName('bDisableKickVote' , val)){class' KFGameInfo '.default.bDisableKickVote = val != 0;if ( KFGameInfo (gameinfo)  != none){ KFGameInfo (gameinfo) .bDisableKickVote = val != 0;}};
	GetFloatPropertyByName('KickVotePercentage' , class' KFGameInfo '.default.KickVotePercentage);if ( KFGameInfo (gameinfo)  != none){GetFloatPropertyByName('KickVotePercentage' ,  KFGameInfo (gameinfo) .KickVotePercentage);};
	class'KFGameInfo'.static.StaticSaveConfig();

	// GameInfo
	GetIntPropertyByName( 'MaxPlayers', class'GameInfo '.default.MaxPlayers);if (gameinfo  != none){GetIntPropertyByName( 'MaxPlayers', gameinfo .MaxPlayers);};
	if (GetIntPropertyByName( 'bAdminCanPause', val)){class'GameInfo '.default.bAdminCanPause = val != 0;if (gameinfo  != none){gameinfo .bAdminCanPause = val != 0;}};
	GetFloatPropertyByName( 'MaxIdleTime', class'GameInfo '.default.MaxIdleTime);if (gameinfo  != none){GetFloatPropertyByName( 'MaxIdleTime', gameinfo .MaxIdleTime);};
	class'GameInfo'.static.StaticSaveConfig();

	if (gameinfo != none) {
		gameinfo.SaveConfig();

		// WD JMH - Make sure the advertised settings get updated now
		gameinfo.UpdateGameSettings();
		gameinfo.UpdateGameSettingsCounts();
	}

	// The following values should only change on map change
	GetIntPropertyByName('GameLength' , class' KFGameInfo '.default.GameLength);if ( KFGameInfo (gameinfo)  != none){GetIntPropertyByName('GameLength' ,  KFGameInfo (gameinfo) .GameLength);};
	class'KFGameInfo'.static.StaticSaveConfig();

	GetFloatPropertyByName( 'GameDifficulty', class'GameInfo '.default.GameDifficulty);if (gameinfo  != none){GetFloatPropertyByName( 'GameDifficulty', gameinfo .GameDifficulty);};
	class'GameInfo'.static.StaticSaveConfig();
}

defaultproperties
{
   SettingsGroups(0)=(GroupID="Server",DisplayName="Server Information",pMax=100)
   SettingsGroups(1)=(GroupID="Connection",DisplayName="Connection",pMin=100,pMax=200)
   SettingsGroups(2)=(GroupID="CheatDetection",DisplayName="Cheat Detection",pMin=200,pMax=300)
   SettingsGroups(3)=(GroupID="Game",DisplayName="Game",pMin=300,pMax=400)
   SettingsGroups(4)=(GroupID="Administration",DisplayName="Administration",pMin=500,pMax=600)
   SettingsGroups(5)=(GroupID="MapVoting",DisplayName="Map Voting",pMin=600,pMax=650)
   SettingsGroups(6)=(GroupID="KickVoting",DisplayName="Kick Voting",pMin=650,pMax=700)
   SettingsGroups(7)=(GroupID="Chat",DisplayName="Chat",pMin=700,pMax=800)
   FloatPredefinedValues(0)=(PropertyId=303,Values=(0.000000,1.000000,2.000000,3.000000))
   Properties(0)=(Data=(Type=SDT_String))
   Properties(1)=(PropertyId=101,Data=(Type=SDT_Int32))
   Properties(2)=(PropertyId=102,Data=(Type=SDT_Float))
   Properties(3)=(PropertyId=200,Data=(Type=SDT_Int32))
   Properties(4)=(PropertyId=302,Data=(Type=SDT_Int32))
   Properties(5)=(PropertyId=303,Data=(Type=SDT_Float))
   Properties(6)=(PropertyId=304,Data=(Type=SDT_Int32))
   Properties(7)=(PropertyId=500,Data=(Type=SDT_Int32))
   Properties(8)=(PropertyId=501,Data=(Type=SDT_Int32))
   Properties(9)=(PropertyId=701,Data=(Type=SDT_Int32))
   Properties(10)=(PropertyId=702,Data=(Type=SDT_Int32))
   Properties(11)=(PropertyId=703,Data=(Type=SDT_Int32))
   Properties(12)=(PropertyId=650,Data=(Type=SDT_Int32))
   Properties(13)=(PropertyId=654,Data=(Type=SDT_Float))
   Properties(14)=(PropertyId=600,Data=(Type=SDT_Int32))
   Properties(15)=(PropertyId=601,Data=(Type=SDT_Float))
   Properties(16)=(PropertyId=602,Data=(Type=SDT_Float))
   PropertyMappings(0)=(Name="ServerName",ColumnHeaderText="Server Name",MaxVal=256.000000)
   PropertyMappings(1)=(Id=101,Name="MaxPlayers",ColumnHeaderText="Maximum Players",MappingType=PVMT_Ranged,MaxVal=6.000000,RangeIncrement=1.000000)
   PropertyMappings(2)=(Id=102,Name="MaxIdleTime",ColumnHeaderText="Maximum Idle Time",MappingType=PVMT_Ranged,MaxVal=300.000000,RangeIncrement=5.000000)
   PropertyMappings(3)=(Id=200,Name="bAntiCheatProtected",ColumnHeaderText="Cheat Protection (VAC)",MappingType=PVMT_IdMapped,ValueMappings=((Name="Disabled"),(Id=1,Name="Enabled")))
   PropertyMappings(4)=(Id=302,Name="bDisableTeamCollision",ColumnHeaderText="Team Collision",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(5)=(Id=303,Name="GameDifficulty",ColumnHeaderText="Game Difficulty",MappingType=PVMT_PredefinedValues,ValueMappings=((Name="Normal"),(Id=1,Name="Hard"),(Id=2,Name="Suicidal"),(Id=3,Name="Hell on Earth")),PredefinedValues=((Type=SDT_Float),(Type=SDT_Float),(Type=SDT_Float),(Type=SDT_Float)),MaxVal=3.000000,RangeIncrement=1.000000)
   PropertyMappings(6)=(Id=304,Name="GameLength",ColumnHeaderText="Game Length",MappingType=PVMT_IdMapped,ValueMappings=((Name="Short"),(Id=1,Name="Normal"),(Id=2,Name="Long"),(Id=3,Name="Custom")),PredefinedValues=((Type=SDT_Int32),(Type=SDT_Int32),(Type=SDT_Int32),(Type=SDT_Int32)),MaxVal=3.000000,RangeIncrement=1.000000)
   PropertyMappings(7)=(Id=500,Name="bAdminCanPause",ColumnHeaderText="Admin Can Pause",MappingType=PVMT_IdMapped,ValueMappings=((Name="No"),(Id=1,Name="Yes")))
   PropertyMappings(8)=(Id=501,Name="bSilentAdminLogin",ColumnHeaderText="Admin Login",MappingType=PVMT_IdMapped,ValueMappings=((Name="Announce"),(Id=1,Name="Keep Silent")))
   PropertyMappings(9)=(Id=701,Name="bDisableVOIP",ColumnHeaderText="VoIP",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(10)=(Id=702,Name="bDisablePublicTextChat",ColumnHeaderText="Public Text Chat",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(11)=(Id=703,Name="bPartitionSpectators",ColumnHeaderText="Spectators",MappingType=PVMT_IdMapped,ValueMappings=((Name="Talk to Everybody"),(Id=1,Name="Only Talk to Spectators")))
   PropertyMappings(12)=(Id=650,Name="bDisableKickVote",ColumnHeaderText="Kick Voting",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(13)=(Id=654,Name="KickVotePercentage",ColumnHeaderText="Vote Kick Percentage",MappingType=PVMT_Ranged,MaxVal=100.000000,RangeIncrement=5.000000)
   PropertyMappings(14)=(Id=600,Name="bDisableMapVote",ColumnHeaderText="Map Voting",MappingType=PVMT_IdMapped,ValueMappings=((Name="Enabled"),(Id=1,Name="Disabled")))
   PropertyMappings(15)=(Id=601,Name="MapVoteDuration",ColumnHeaderText="Map Voting Time",MappingType=PVMT_Ranged,MinVal=10.000000,MaxVal=300.000000,RangeIncrement=5.000000)
   PropertyMappings(16)=(Id=602,Name="MapVotePercentage",ColumnHeaderText="Mid Game Voting Percentage",MappingType=PVMT_Ranged,MaxVal=100.000000,RangeIncrement=5.000000)
   Name="Default__GeneralSettings"
   ObjectArchetype=WebAdminSettings'webadmin.Default__WebAdminSettings'
}
