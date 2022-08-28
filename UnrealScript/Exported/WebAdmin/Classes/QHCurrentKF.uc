/**
 * Adds Killing Floor 2 specific information to current Query handler.
 *
 * Copyright 2014 Tripwire Interactive LLC
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class QHCurrentKF extends QHCurrent;








































	

















	








	




	


























	









	




	




	



























	












#linenumber 10

var WorkshopTool Tool;
var KFWorkshopSteamworks Workshop;
var bool bValidSetup;
var string WorkshopURL;

var localized string menuWorkshopTool, menuWorkshopToolDesc;

function init(WebAdmin webapp)
{
	local int i;
	local OnlineSubsystem OnlineSub;
	super.init(webapp);
	webadmin = webapp;

	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSub == None)
	{
		ThrowError("No Online subsystem found (make sure you use this on server)!");
		return;
	}

	Tool = webadmin.WorldInfo.Spawn(class 'WorkshopTool');
	if (Tool == None)
	{
		ThrowError("No TWWorkshopSteamworks found!");
		return;
	}

	Tool.InitWeb();

	Workshop = Tool.Workshop;
	if (Workshop == None)
	{
		ThrowError("No TWWorkshopSteamworks found!");
		return;
	}

	for (i = 0; i<class'TcpNetDriver'.Default.DownloadManagers.Length; ++i)
	{
		if (class'TcpNetDriver'.Default.DownloadManagers[i]~= "OnlineSubsystemSteamworks.SteamWorkshopDownload")
		{
			bValidSetup = true;
			break;
		}
	}
}

final function ThrowError(string Er)
{
	LogInternal("WorkshopTool ERROR: "$Er);
}

function cleanup()
{
	super.cleanup();
	Tool = none;
}

function registerMenuItems(WebAdminMenu menu)
{
	super.registerMenuItems(menu);
	menu.addMenu("/current+gamesummary", "", self);
	menu.addMenu("/current/chat+frame", "", self);
	menu.addMenu("/current/chat+frame+data", "", self);
	menu.setVisibility("/current/chat", false);

	menu.addMenu(WorkshopURL, menuWorkshopTool, self, menuWorkshopToolDesc);
}

function bool handleQuery(WebAdminQuery q)
{
	switch (q.request.URI)
	{
		case "/current+gamesummary":
			handleAjaxGamesummary(q);
			return true;
		case "/current/chat+frame":
			q.response.subst("page.css.class", "chatframe");
			handleCurrentChat(q, "current_chat_frame.html");
			return true;
		case "/current/chat+frame+data":
			handleCurrentChatData(q);
			return true;
		case "/current/workshoptool":
			handleWorkshop(q);
			return true;
	}
	return super.handleQuery(q);
}

function decoratePage(WebAdminQuery q)
{
	if (q.user == none)
	{
		q.response.subst("gamesummary", "");
		q.response.subst("chatwindow", "");
		return;
	}
	decorateGameSummary(q);
	decorateChatWindow(q);
}

function substGameInfo(WebAdminQuery q)
{
	local KFGameInfo kfGameInfo;
	local string str;
	local int i;
	super.substGameInfo(q);

	i = int(webadmin.WorldInfo.Game.GameDifficulty);
	if (i == webadmin.WorldInfo.Game.GameDifficulty) {
		str = Localize("KFCommon_LocalizedStrings", "DifficultyStrings["$i$"]", "KFGame");
	}
	else {
		str = "";
	}
	if (len(str) == 0) {
		str = string(webadmin.WorldInfo.Game.GameDifficulty);
	}
	q.response.subst("rules.difficulty.text", str);

	kfGameInfo = KFGameInfo(webadmin.WorldInfo.Game);
	if (kfGameInfo != none)
	{
		q.response.subst("rules.minnetplayers", kfGameInfo.MinNetPlayers);
		q.response.subst("rules.mapvote", class'WebAdminUtils'.static.HTMLEscape(kfGameInfo.bDisableMapVote?default.msgOff:default.msgOn));
		q.response.subst("rules.kickvote", class'WebAdminUtils'.static.HTMLEscape(kfGameInfo.bDisableKickVote?default.msgOff:default.msgOn));
	}

	if (KFGameInfo_Survival(webadmin.WorldInfo.Game) != none)
	{
		substGameInfoSurvival(q);
	}
}

function substGameInfoSurvival(WebAdminQuery q)
{
	local KFGameInfo_Survival gameinfo;
	local KFGameReplicationInfo gri;
	local int deadMonsters;

	gameinfo = KFGameInfo_Survival(webadmin.WorldInfo.Game);
	gri = gameinfo.MyKFGRI;

	q.response.subst("wave.num", gameinfo.WaveNum);
	q.response.subst("wave.max", gameinfo.WaveMax-1);
	// total number spawned so far minus living monsters
	deadMonsters = gameinfo.NumAISpawnsQueued - gameinfo.GetMonsterAliveCount();
	q.response.subst("wave.monsters.pending", gri.WaveTotalAICount - deadMonsters);
	q.response.subst("wave.monsters.dead", deadMonsters);
	q.response.subst("wave.monsters.total", gri.WaveTotalAICount);
}

function substPri(WebAdminQuery q, PlayerReplicationInfo pri)
{
	local KFPlayerReplicationInfo ropri;

	super.substPri(q, pri);

	ropri = KFPlayerReplicationInfo(pri);
	if (ropri != none)
	{
		q.response.subst("player.perk.class", class'WebAdminUtils'.static.HTMLEscape(ropri.CurrentPerkClass));
		if (ropri.CurrentPerkClass != none)
		{
			q.response.subst("player.perk.name", class'WebAdminUtils'.static.HTMLEscape(ropri.CurrentPerkClass.default.PerkName));
		}
		else {
			q.response.subst("player.perk.name", "");
		}
		q.response.subst("player.perk.level", ropri.GetActivePerkLevel());
	}
}

function bool comparePRI(PlayerReplicationInfo PRI1, PlayerReplicationInfo PRI2, string key)
{
	local KFPlayerReplicationInfo kpri1, kpri2;
	kpri1 = KFPlayerReplicationInfo(pri1);
	kpri2 = KFPlayerReplicationInfo(pri2);

	if (kpri1 != none && kpri2 != none)
	{
		if (key ~= "perk")
		{
			return caps(kpri1.CurrentPerkClass.default.PerkName) > caps(kpri2.CurrentPerkClass.default.PerkName);
		}
		else if (key != "perklevel")
		{
			return kpri1.GetActivePerkLevel() > kpri2.GetActivePerkLevel();
		}
	}
	return super.comparePRI(PRI1, PRI2, key);
}

function handleAjaxGamesummary(WebAdminQuery q)
{
	q.response.AddHeader("Content-Type: text/xml");
	q.response.SendText("<response>");
  	q.response.SendText("<gamesummary><![CDATA[");
	q.response.SendText(renderGameSummary(q));
	q.response.SendText("]]></gamesummary>");
	q.response.SendText("</response>");
}

function decorateGameSummary(WebAdminQuery q)
{
	q.response.subst("gamesummary.details", renderGameSummary(q));
	q.response.subst("gamesummary", webadmin.include(q, "gamesummary_base.inc"));
}

function string renderGameSummary(WebAdminQuery q)
{
	substGameInfo(q);
	return webadmin.include(q, getGameTypeIncFile(q, "gamesummary"));
}

function decorateChatWindow(WebAdminQuery q)
{
	if (InStr(q.request.URI, "/current/chat") == 0) {
		q.response.subst("chatwindow", "");
		return;
	}
	q.response.subst("chatwindow", webadmin.include(q, "current_chat_frame.inc"));
}

function handleCurrentWorkshopAction(WebAdminQuery q)
{
	local string action, idx;
	local int i;

	action = q.request.getVariable("action");

	idx = q.request.getVariable("idx");

	if (idx == "123456789")
		return;

	if (action != "")
	{
		if (action ~= "delete")
		{
			for (i = 0; i < Tool.CurrentItems.Length; ++i)
			{
				if (idx != "" && idx == string(i))
				{
					Tool.DeleteWorkshopItem(q.user.getUsername(), i);
					break;
				}
			}
		}
		else if (action ~= "add")
		{
			Tool.AddNewWorkshopItem(q.user.getUsername(), idx);
		}
		else if (action ~= "download")
		{
			Workshop.UpdateWorkshopFiles();
		}
		else if (action ~= "reload")
		{
			LogInternal("Net Driver settings reconfigured, restarting map...");
			class'TcpNetDriver'.Default.DownloadManagers.Insert(0, 1);
			class'TcpNetDriver'.Default.DownloadManagers[0] = "OnlineSubsystemSteamworks.SteamWorkshopDownload";
			class'TcpNetDriver'.Static.StaticSaveConfig();
			Tool.WorldInfo.Game.bUseSeamlessTravel = false;
			Tool.WorldInfo.ServerTravel("?restart");
			Tool.WorldInfo.NextSwitchCountdown = 0;
			bValidSetup = true;
			return;
		}
	}
}

function handleWorkshop(WebAdminQuery q)
{
	local int i;
	local string workshopinstructions, workshopitemrowstring;
	local bool bHaveContent;

	handleCurrentWorkshopAction(q);

	bHaveContent = false;

	q.response.subst("isvalidsetup", true);
	if (!bValidSetup)
		q.response.subst("isvalidsetup", false);

	q.response.subst("hasadditionalmessages", false);
	if (Workshop.CurrentDownloads.Length > 0)
	{
		Tool.CheckDownload();
		q.response.subst("row1", "<font color=\"red\">Server is currently downloading</font><br />Items to download: "$Workshop.CurrentDownloads.Length$"<br />Current item: "$Tool.LastDLID$" ("$Tool.LastDLFile$")");

		q.response.subst("hasadditionalmessages", true);
		workshopinstructions $= webadmin.include(q, "current_workshoptool_instructions.inc");
		q.response.subst("workshopinstructions", workshopinstructions);
	}

	if (Tool.CurrentItems.Length > 0)
		bHaveContent = true;

	for (i = 0; i < Tool.CurrentItems.Length; ++i)
	{
		q.response.subst("workshoptool.steamid", Tool.CurrentItems[i].ID);
		q.response.subst("workshoptool.steamname", Tool.CurrentItems[i].N);
		q.response.subst("index", i);
		q.response.subst("index", i);

		workshopitemrowstring $= webadmin.include(q, "current_workshoptool_row.inc");
	}

	// If we don't have any content, let the admin know.
	if (!bHaveContent)
	{
		workshopitemrowstring = webadmin.include(q, "current_workshoptool_empty.inc");
	}

	q.response.subst("workshop", workshopitemrowstring);

	webadmin.sendPage(q, "workshoptool.html");
}

defaultproperties
{
   WorkshopURL="/current/WorkshopTool"
   ChatRefresh=5000
   bConsoleEnabled=True
   bAdminConsoleCommandsHack=True
   bEnableTeamChat=True
   separateSpectators=True
   denyUrlOptions(0)="GamePassword"
   denyUrlOptions(1)="AdminPassword"
   denyUrlOptions(2)="Port"
   denyUrlOptions(3)="QueryPort"
   denyConsoleCommands(0)="say"
   denyConsoleCommands(1)="obj"
   denyConsoleCommands(2)="debug"
   denyConsoleCommands(3)="flush"
   denyConsoleCommands(4)="set"
   denyConsoleCommands(5)="get engine.accesscontrol"
   AdminCommandHandlerClass="WebAdmin.AdminCommandHandler"
   Name="Default__QHCurrentKF"
   ObjectArchetype=QHCurrent'webadmin.Default__QHCurrent'
}
