//=============================================================================
// KFSteamWebUpToDateCheck
//=============================================================================
// Makes a call to the Steam Web API to check the current version of the game server or client
//=============================================================================
// Copyright (C) 2015 Tripwire Interactive LLC
// - Joshua "Josh" Rowan
// All Rights Reserved.
//=============================================================================

class KFSteamWebUpToDateCheck extends KFSteamWebAPICall
	config(Game)
	native;

/** configurable steam app id */
var const int APIAppID;

event SendUpToDateCheck()
{
	CallWebProcedure(APICall, "appid="$APIAppID$"&version="$class'KFGameEngine'.static.GetKFGameVersion());
}

function ProcessResponse(JsonObject response)
{
	local JsonObject ResponseList;
	local bool bUpToDate;

	ResponseList = response.GetObject("response");
	if ( ResponseList == none )
	{
		if (bDebug) LogInternal(Name @ "got invalid JSON response.");
		return;
	}
	if (!ResponseList.HasKey("up_to_date"))
	{
		if (bDebug) LogInternal(Name @ "got unexpected JSON response.");
		return;
	}

	bUpToDate = ResponseList.GetBoolValue("up_to_date");
	if (!bUpToDate)
	{
		WarnInternal("Server is out of date, need version" @ ResponseList.GetIntValue("required_version"));
		class'KFGameInfo'.static.SetNeedsRestart(true);
	}

	if (bDebug) LogInternal(Name @ "response="$int(bUpToDate));
}

defaultproperties
{
   APIAppID=232130
   APICall="/ISteamApps/UpToDateCheck/v1/"
   Name="Default__KFSteamWebUpToDateCheck"
   ObjectArchetype=KFSteamWebAPICall'KFGame.Default__KFSteamWebAPICall'
}
