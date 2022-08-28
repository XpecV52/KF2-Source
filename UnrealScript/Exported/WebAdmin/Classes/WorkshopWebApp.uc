Class WorkshopWebApp extends Object implements(IQueryHandler);

var KFWorkshopSteamworks Workshop;
var WorkshopTool Tool;
var WebAdmin webadmin;
var string WorkshopURL;
var bool bValidSetup;

function cleanup()
{
	//Workshop.ClearUGCDownloadProgressDelegate();
	Workshop = None;
	webadmin = None;
	Tool = None;
}
function init(WebAdmin webapp)
{
	local int i;

	Workshop = Tool.Workshop;
	webadmin = webapp;

	for( i=0; i<class'TcpNetDriver'.Default.DownloadManagers.Length; ++i )
	{
		if( class'TcpNetDriver'.Default.DownloadManagers[i]~="OnlineSubsystemSteamworks.SteamWorkshopDownload" )
		{
			bValidSetup = true;
			break;
		}
	}
}
function registerMenuItems(WebAdminMenu menu)
{
	menu.addMenu(WorkshopURL, "Workshop WebTool", self, "Modify workshop settings.", -125);
}
function bool handleQuery(WebAdminQuery q)
{
	switch (q.request.URI)
	{
		case WorkshopURL:
			handleWorkshop(q);
			return true;
	}
	return false;
}

final function IncludeFile( WebAdminQuery q, string file )
{
	local string S;
	
	if( webadmin.HTMLSubDirectory!="" )
	{
		S = webadmin.Path $ "/" $ webadmin.HTMLSubDirectory $ "/" $ file;
		if ( q.response.FileExists(S) )
		{
			q.response.IncludeUHTM(S);
			return;
		}
	}
	q.response.IncludeUHTM(webadmin.Path $ "/" $ file);
}
final function SendHeader( WebAdminQuery q, string Title )
{
	local IQueryHandler handler;
	
	q.response.Subst("page.title", Title);
	q.response.Subst("page.description", "");
	foreach webadmin.handlers(handler)
	{
		handler.decoratePage(q);
	}
	q.response.Subst("messages", webadmin.renderMessages(q));
	if (q.session.getString("privilege.log") != "")
	{
		q.response.Subst("privilege.log", webadmin.renderPrivilegeLog(q));
	}
	IncludeFile(q,"header.inc");
	q.response.SendText("<div id=\"content\"><h2>"$Title$"</h2></div><div class=\"section\">");
}
final function SendFooter( WebAdminQuery q )
{
	IncludeFile(q,"navigation.inc");
	IncludeFile(q,"footer.inc");
	q.response.ClearSubst();
}

function handleWorkshop(WebAdminQuery q)
{
	local int i;

	SendHeader(q,"Workshop Webtool");
	if( q.request.getVariable("add")=="Add" )
	{
		Tool.AddNewWorkshopItem(q.user.getUsername(),q.request.getVariable("ID"));
	}
	else if( q.request.getVariable("reload")!="" )
	{
		Workshop.UpdateWorkshopFiles();
	}
	else if( q.request.getVariable("update")!="" )
	{
		q.response.SendText("<font size=\"3\" color=\"red\">Settings updated, restarting map!</font><br>");
		SendFooter(q);
		LogInternal("Net Driver settings reconfigured, restarting map...");
		class'TcpNetDriver'.Default.DownloadManagers.Insert(0,1);
		class'TcpNetDriver'.Default.DownloadManagers[0] = "OnlineSubsystemSteamworks.SteamWorkshopDownload";
		class'TcpNetDriver'.Static.StaticSaveConfig();
		Tool.WorldInfo.Game.bUseSeamlessTravel = false;
		Tool.WorldInfo.ServerTravel("?restart");
		Tool.WorldInfo.NextSwitchCountdown = 0;
		bValidSetup = true;
		return;
	}
	else
	{
		for( i=0; i<Tool.CurrentItems.Length; ++i )
		{
			if( q.request.getVariable("del"$i)=="Delete" )
			{
				Tool.DeleteWorkshopItem(q.user.getUsername(),i);
				break;
			}
		}
	}

	q.response.SendText("<form method=\"post\" action=\""$webadmin.Path$WorkshopURL$"\">");
	
	if( !bValidSetup )
	{
		q.response.SendText("<font size=\"3\" color=\"red\">WARNING! Client workshop item downloading not enabled on this server!</font><br>");
		q.response.SendText("To enable, please click here: <input class=\"button\" type=\"submit\" name=\"update\" value=\"Update server settings\"><br>");
		q.response.SendText("This will update server settings and restart map.<br>");
		q.response.SendText("For more information, please visit this <a href=\"http://wiki.tripwireinteractive.com/index.php?title=Dedicated_Server_%28Killing_Floor_2%29#Setting_Up_Steam_Workshop_For_Servers\" target=\"_blank\">Wiki page</a>!<br><br>");
	}
	if( Workshop.CurrentDownloads.Length>0 )
	{
		Tool.CheckDownload();
		q.response.SendText("<font size=\"2\" color=\"red\">Server is currently downloading</font><br>");
		q.response.SendText("Items to download: "$Workshop.CurrentDownloads.Length$"<br>");
		q.response.SendText("Current item: "$Tool.LastDLID$" ("$Tool.LastDLFile$")<br>");
		//q.response.SendText("Progress: "$CurrentProgress$"%<br><br>");
	}
	
	q.response.SendText("<table id=\"settings\" class=\"grid\">");
	q.response.SendText("<thead><tr><th>Current items</th><th></th><th></th></tr></thead><tbody>");
	q.response.SendText("<tr><th>Item ID</th><th>Item Name</th><th></th></tr>");
	for( i=0; i<Tool.CurrentItems.Length; ++i )
	{
		q.response.SendText("<tr><td>"$Tool.CurrentItems[i].ID$"</td><td>"$Tool.CurrentItems[i].N$"</td><td><input class=\"button\" type=\"submit\" name=\"del"$i$"\" value=\"Delete\"></td></tr>");
	}
	q.response.SendText("<tr><th>New item (ID or URL):</th><td><input class=\"textbox\" class=\"text\" name=\"ID\" value=\"123456789\"></td><td><input class=\"button\" type=\"submit\" name=\"add\" value=\"Add\"></td></tr>");
	q.response.SendText("<tr><td colspan=2><input class=\"button\" type=\"submit\" name=\"reload\" value=\"Download items now!\"></td><td>and possibly restart map</td></tr>");
	q.response.SendText("</tbody></table></form>");
	q.response.SendText("</div></body></html>");
	SendFooter(q);
}

function bool producesXhtml()
{
	return true;
}
function bool unhandledQuery(WebAdminQuery q);
function decoratePage(WebAdminQuery q);

defaultproperties
{
   WorkshopURL="/settings/WorkshopTool"
   Name="Default__WorkshopWebApp"
   ObjectArchetype=Object'Core.Default__Object'
}
