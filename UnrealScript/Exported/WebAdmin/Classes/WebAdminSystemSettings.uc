/**
 * Configuration settings for the WebAdmin
 *
 * Copyright 2009 Epic Games, Inc. All Rights Reserved
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class WebAdminSystemSettings extends WebAdminSettings implements(IQueryHandler);








































	

















	








	




	


























	









	




	




	



























	












#linenumber 10

var WebAdmin webadmin;
var QHCurrent qhcurrent;
var ChatLog chatlog;

var SettingsRenderer settingsRenderer;

//!localized
var localized string menuSystem, menuSystemDesc, msgSettingsSaved;

function init(WebAdmin webapp)
{
	webadmin = webapp;
}

function delayedInit()
{
	local IQueryHandler qh;
	local Object o;
	foreach webadmin.handlers(qh)
	{
		if (qh.IsA('QHCurrent'))
		{
			o = qh;
			qhcurrent = QHCurrent(o);
		}
	}
	foreach webadmin.WorldInfo.AllActors(class'ChatLog', chatlog)
	{
		break;
	}
}

function cleanup()
{
	settingsRenderer = none;
	qhcurrent = none;
	chatlog = none;
	webadmin = none;
}

function registerMenuItems(WebAdminMenu menu)
{
	menu.addMenu("/webadmin", menuSystem, self, menuSystemDesc, 999);
	menu.addMenu("/system/allowancecache", "", self, "Rebuild the mutator allowance cache.");
}

function bool handleQuery(WebAdminQuery q)
{
	switch (q.request.URI)
	{
		case "/webadmin":
			handleSettings(q);
			return true;
		case "/system/allowancecache":
			handleRebuildAllowanceCache(q);
			return true;
	}
	return false;
}

function bool unhandledQuery(WebAdminQuery q);

function decoratePage(WebAdminQuery q);

function bool producesXhtml()
{
	return true;
}

function handleRebuildAllowanceCache(WebAdminQuery q)
{
	local array<DCEGameInfo> gts;
	local int i;

	if (q.request.getVariable("action") ~= "rebuild")
	{
		webadmin.dataStoreCache.allowanceCache.length = 0;
		gts = webadmin.dataStoreCache.getGameTypes();
		for (i = 0; i < gts.length; i++)
		{
			webadmin.dataStoreCache.getMutators(gts[i].data.ClassName);
		}
		webadmin.addMessage(q, "Mutator allowance cache has been rebuild.");
	}

	webadmin.addMessage(q, "<form action=\""$WebAdmin.Path$q.Request.URI$"\" method=\"post\">"
		$"<p>Only rebuild the mutator cache when the server is empty. It is strongly adviced to restart the game after rebuilding has been completed.</p>"
		$"<p><button type=\"submit\" name=\"action\" value=\"rebuild\">Rebuild cache</button></p></form>", MT_Warning);

	q.response.Subst("page.title", "Rebuild Mutator Allowance Cache");
	webadmin.sendPage(q, "message.html");
}

function handleSettings(WebAdminQuery q)
{
	local ISettingsPrivileges privs;

	if (settingsRenderer == none)
	{
		delayedInit();
		loadSettings();
		settingsRenderer = new class'SettingsRenderer';
		settingsRenderer.init(webadmin.path);
	}

	if (q.request.getVariable("action") ~= "save")
	{
		class'QHDefaults'.static.applySettings(self, q.request);
		saveSettings();
		webadmin.addMessage(q, msgSettingsSaved);
	}

	privs = q.user.getSettingsPrivileges();
	if (privs != none)
	{
		privs.setBasePrivilegeUri(webadmin.getAuthURL(q.request.uri));
	}

	settingsRenderer.render(self, q.response,, privs);
	q.response.subst("liveAdjustStyle", "style=\"display: none;\"");
	webadmin.sendPage(q, "default_settings_general.html");
}

/**
 * Load the webadmin settings
 */
protected function loadSettings()
{
	// generic
	SetStringPropertyByName('AuthenticationClass', webadmin.AuthenticationClass);
	SetStringPropertyByName('SessionHandlerClass', webadmin.SessionHandlerClass);
	SetIntPropertyByName('bHttpAuth', int(webadmin.bHttpAuth));
	SetStringPropertyByName('startpage', webadmin.startpage);
	SetIntPropertyByName('bChatLog', int(webadmin.bChatLog));
	SetIntPropertyByName('bUseStrictContentType', int(webadmin.bUseStrictContentType));
	SetIntPropertyByName('sessionOctetValidation', webadmin.sessionOctetValidation);
	SetIntPropertyByName('MaxAuthFails', webadmin.MaxAuthFails);

	// qhcurrent
	if (qhcurrent != none)
	{
		SetIntPropertyByName('ChatRefresh', qhcurrent.ChatRefresh);
		SetIntPropertyByName('bConsoleEnabled', int(qhcurrent.bConsoleEnabled));
		SetStringArrayPropertyByName('denyUrlOptions', qhcurrent.denyUrlOptions, chr(10));
		SetStringArrayPropertyByName('denyConsoleCommands', qhcurrent.denyConsoleCommands, chr(10));
		SetIntPropertyByName('bAdminConsoleCommandsHack', int(qhcurrent.bAdminConsoleCommandsHack));
		SetStringPropertyByName('AdminCommandHandlerClass', qhcurrent.AdminCommandHandlerClass);
		SetIntPropertyByName('bEnableTeamChat', int(qhcurrent.bEnableTeamChat));
		SetIntPropertyByName('hideNews', int(qhcurrent.hideNews));
	}
	else {
		SetIntPropertyByName('ChatRefresh', class'QHCurrent'.default.ChatRefresh);
		SetIntPropertyByName('bConsoleEnabled', int(class'QHCurrent'.default.bConsoleEnabled));
		SetStringArrayPropertyByName('denyUrlOptions', class'QHCurrent'.default.denyUrlOptions, chr(10));
		SetStringArrayPropertyByName('denyConsoleCommands', class'QHCurrent'.default.denyConsoleCommands, chr(10));
		SetIntPropertyByName('bAdminConsoleCommandsHack', int(class'QHCurrent'.default.bAdminConsoleCommandsHack));
		SetStringPropertyByName('AdminCommandHandlerClass', class'QHCurrent'.default.AdminCommandHandlerClass);
		SetIntPropertyByName('bEnableTeamChat', int(class'QHCurrent'.default.bEnableTeamChat));
		SetIntPropertyByName('hideNews', int(class'QHCurrent'.default.hideNews));
	}

	if (chatlog != none)
	{
		SetStringPropertyByName('chatLogFilename', chatlog.filename);
		SetIntPropertyByName('chatLogUnique', int(chatlog.bUnique));
		SetIntPropertyByName('chatLogIncludeTimeStamp', int(chatlog.bIncludeTimeStamp));
	}
	else {
		SetStringPropertyByName('chatLogFilename', class'ChatLog'.default.filename);
		SetIntPropertyByName('chatLogUnique', int(class'ChatLog'.default.bUnique));
		SetIntPropertyByName('chatLogIncludeTimeStamp', int(class'ChatLog'.default.bIncludeTimeStamp));
	}
}

function saveSettings()
{
	local int intval;
	// generic
	GetStringPropertyByName('AuthenticationClass', webadmin.AuthenticationClass);
	GetStringPropertyByName('SessionHandlerClass', webadmin.SessionHandlerClass);
	if (GetIntPropertyByName('bHttpAuth', intval))
	{
		webadmin.bHttpAuth = intval != 0;
	}
	GetStringPropertyByName('startpage', webadmin.startpage);
	if (GetIntPropertyByName('bChatLog', intval))
	{
		webadmin.bChatLog = intval != 0;
	}
	if (GetIntPropertyByName('bUseStrictContentType', intval))
	{
		webadmin.bUseStrictContentType = intval != 0;
	}
	GetIntPropertyByName('sessionOctetValidation', webadmin.sessionOctetValidation);
	GetIntPropertyByName('MaxAuthFails', webadmin.MaxAuthFails);
	webadmin.SaveConfig();

	// qhcurrent
	if (qhcurrent != none)
	{
		GetIntPropertyByName('ChatRefresh', qhcurrent.ChatRefresh);
		if (GetIntPropertyByName('bConsoleEnabled', intval))
		{
			qhcurrent.bConsoleEnabled = intval != 0;
		}
		GetStringArrayPropertyByName('denyUrlOptions', qhcurrent.denyUrlOptions, chr(10));
		GetStringArrayPropertyByName('denyConsoleCommands', qhcurrent.denyConsoleCommands, chr(10));
		if (GetIntPropertyByName('bAdminConsoleCommandsHack', intval))
		{
			qhcurrent.bAdminConsoleCommandsHack = intval != 0;
		}
		GetStringPropertyByName('AdminCommandHandlerClass', qhcurrent.AdminCommandHandlerClass);
		if (GetIntPropertyByName('bEnableTeamChat', intval))
		{
			qhcurrent.bEnableTeamChat = intval != 0;
		}
		if (GetIntPropertyByName('hideNews', intval))
		{
			qhcurrent.hideNews = intval != 0;
		}
		qhcurrent.SaveConfig();
	}
	else {
		GetIntPropertyByName('ChatRefresh', class'QHCurrent'.default.ChatRefresh);
		if (GetIntPropertyByName('bConsoleEnabled', intval))
		{
			class'QHCurrent'.default.bConsoleEnabled = intval != 0;
		}
		GetStringArrayPropertyByName('denyUrlOptions', class'QHCurrent'.default.denyUrlOptions, chr(10));
		GetStringArrayPropertyByName('denyConsoleCommands', class'QHCurrent'.default.denyConsoleCommands, chr(10));
		if (GetIntPropertyByName('bAdminConsoleCommandsHack', intval))
		{
			class'QHCurrent'.default.bAdminConsoleCommandsHack = intval != 0;
		}
		GetStringPropertyByName('AdminCommandHandlerClass', class'QHCurrent'.default.AdminCommandHandlerClass);
		if (GetIntPropertyByName('bEnableTeamChat', intval))
		{
			class'QHCurrent'.default.bEnableTeamChat = intval != 0;
		}
		if (GetIntPropertyByName('hideNews', intval))
		{
			class'QHCurrent'.default.hideNews = intval != 0;
		}
		class'QHCurrent'.static.StaticSaveConfig();
	}

	// chatlog
	if (chatlog != none)
	{
		GetStringPropertyByName('chatLogFilename', chatlog.filename);
		if (GetIntPropertyByName('chatLogUnique', intval))
		{
			chatlog.bUnique = intval != 0;
		}
		if (GetIntPropertyByName('chatLogIncludeTimeStamp', intval))
		{
			chatlog.bIncludeTimeStamp = intval != 0;
		}
		chatlog.SaveConfig();
	}
	else {
		GetStringPropertyByName('chatLogFilename', class'ChatLog'.default.filename);
		if (GetIntPropertyByName('chatLogUnique', intval))
		{
			class'ChatLog'.default.bUnique = intval != 0;
		}
		if (GetIntPropertyByName('chatLogIncludeTimeStamp', intval))
		{
			class'ChatLog'.default.bIncludeTimeStamp = intval != 0;
		}
		class'ChatLog'.static.StaticSaveConfig();
	}
}

defaultproperties
{
   menuSystem="WebAdmin Settings"
   menuSystemDesc="Change the web administration configuration."
   msgSettingsSaved="Settings saved."
   SettingsGroups(0)=(GroupID="General",DisplayName="General",pMax=20)
   SettingsGroups(1)=(GroupID="ChatLogging",DisplayName="Chat Logging",pMin=20,pMax=30)
   SettingsGroups(2)=(GroupID="Authentication",DisplayName="Authentication",pMin=30,pMax=40)
   SettingsGroups(3)=(GroupID="Advanced",DisplayName="Advanced",pMin=100,pMax=120)
   Properties(0)=(PropertyId=100,Data=(Type=SDT_String))
   Properties(1)=(PropertyId=101,Data=(Type=SDT_String))
   Properties(2)=(PropertyId=30,Data=(Type=SDT_Int32))
   Properties(3)=(Data=(Type=SDT_String))
   Properties(4)=(PropertyId=20,Data=(Type=SDT_Int32))
   Properties(5)=(PropertyId=102,Data=(Type=SDT_Int32))
   Properties(6)=(PropertyId=1,Data=(Type=SDT_Int32))
   Properties(7)=(PropertyId=2,Data=(Type=SDT_Int32))
   Properties(8)=(PropertyId=3,Data=(Type=SDT_String))
   Properties(9)=(PropertyId=4,Data=(Type=SDT_String))
   Properties(10)=(PropertyId=104,Data=(Type=SDT_Int32))
   Properties(11)=(PropertyId=103,Data=(Type=SDT_String))
   Properties(12)=(PropertyId=5,Data=(Type=SDT_Int32))
   Properties(13)=(PropertyId=6,Data=(Type=SDT_Int32))
   Properties(14)=(PropertyId=21,Data=(Type=SDT_String))
   Properties(15)=(PropertyId=22,Data=(Type=SDT_Int32))
   Properties(16)=(PropertyId=23,Data=(Type=SDT_Int32))
   Properties(17)=(PropertyId=31,Data=(Type=SDT_Int32))
   Properties(18)=(PropertyId=32,Data=(Type=SDT_Int32))
   PropertyMappings(0)=(Id=100,Name="AuthenticationClass",ColumnHeaderText="Authentication Class",MaxVal=256.000000)
   PropertyMappings(1)=(Id=101,Name="SessionHandlerClass",ColumnHeaderText="Session Handler class",MaxVal=256.000000)
   PropertyMappings(2)=(Id=30,Name="bHttpAuth",ColumnHeaderText="HTTP Authentication",MappingType=PVMT_IdMapped,ValueMappings=((Name="Use Login Form"),(Id=1,Name="Use HTTP Authentication")))
   PropertyMappings(3)=(Name="startpage",ColumnHeaderText="Starting Page",MaxVal=256.000000)
   PropertyMappings(4)=(Id=20,Name="bChatLog",ColumnHeaderText="Chat Logging",MappingType=PVMT_IdMapped,ValueMappings=((Name="Disabled"),(Id=1,Name="Enabled")))
   PropertyMappings(5)=(Id=102,Name="bUseStrictContentType",ColumnHeaderText="Send XHTML headers",MappingType=PVMT_IdMapped,ValueMappings=((Name="No"),(Id=1,Name="Yes")))
   PropertyMappings(6)=(Id=1,Name="ChatRefresh",ColumnHeaderText="Chat Window Refresh",MappingType=PVMT_Ranged,MaxVal=9999.000000,RangeIncrement=10.000000)
   PropertyMappings(7)=(Id=2,Name="bConsoleEnabled",ColumnHeaderText="Management Console Enabled",MappingType=PVMT_IdMapped,ValueMappings=((Name="Disabled"),(Id=1,Name="Enabled")))
   PropertyMappings(8)=(Id=3,Name="denyUrlOptions",ColumnHeaderText="Deny URL options",MaxVal=1024.000000)
   PropertyMappings(9)=(Id=4,Name="denyConsoleCommands",ColumnHeaderText="Deny Console Commands",MaxVal=1024.000000)
   PropertyMappings(10)=(Id=104,Name="bAdminConsoleCommandsHack",ColumnHeaderText="Admin Console Commands Enabled",MappingType=PVMT_IdMapped,ValueMappings=((Name="Disabled"),(Id=1,Name="Enabled")))
   PropertyMappings(11)=(Id=103,Name="AdminCommandHandlerClass",ColumnHeaderText="Admin Console Commands Handler",MaxVal=256.000000)
   PropertyMappings(12)=(Id=5,Name="bEnableTeamChat",ColumnHeaderText="Team Chatting",MappingType=PVMT_IdMapped,ValueMappings=((Name="Disabled"),(Id=1,Name="Enabled")))
   PropertyMappings(13)=(Id=6,Name="hideNews",ColumnHeaderText="Hide News",MappingType=PVMT_IdMapped,ValueMappings=((Name="Show"),(Id=1,Name="Hide")))
   PropertyMappings(14)=(Id=21,Name="chatLogFilename",ColumnHeaderText="Filename",MaxVal=256.000000)
   PropertyMappings(15)=(Id=22,Name="chatLogUnique",ColumnHeaderText="Force Unique Name",MappingType=PVMT_IdMapped,ValueMappings=((Name="No"),(Id=1,Name="Yes")))
   PropertyMappings(16)=(Id=23,Name="chatLogIncludeTimeStamp",ColumnHeaderText="Append Timestamp",MappingType=PVMT_IdMapped,ValueMappings=((Name="No"),(Id=1,Name="Yes")))
   PropertyMappings(17)=(Id=31,Name="sessionOctetValidation",ColumnHeaderText="IP Octet Validation",MappingType=PVMT_PredefinedValues,PredefinedValues=((Type=SDT_Int32),(Type=SDT_Int32,Value1=1),(Type=SDT_Int32,Value1=2),(Type=SDT_Int32,Value1=3),(Type=SDT_Int32,Value1=4)),MaxVal=4.000000,RangeIncrement=1.000000)
   PropertyMappings(18)=(Id=32,Name="MaxAuthFails",ColumnHeaderText="Authentication Failure Threshold",MappingType=PVMT_Ranged,MaxVal=9999.000000,RangeIncrement=1.000000)
   Name="Default__WebAdminSystemSettings"
   ObjectArchetype=WebAdminSettings'webadmin.Default__WebAdminSettings'
}
