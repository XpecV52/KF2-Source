/*******************************************************************************
 * KFSteamWebUpToDateCheck generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFSteamWebUpToDateCheck extends KFSteamWebAPICall
    native;

var const int APIAppID;

event SendUpToDateCheck()
{
    CallWebProcedure(APICall, (("appid=" $ string(APIAppID)) $ "&version=") $ string(Class'KFGameEngine'.static.GetKFGameVersion()));
}

function ProcessResponse(JsonObject Response)
{
    local JsonObject ResponseList;
    local bool bUpToDate;

    ResponseList = Response.GetObject("response");
    if(ResponseList == none)
    {
        if(bDebug)
        {
            LogInternal(string(Name) @ "got invalid JSON response.");
        }
        return;
    }
    if(!ResponseList.HasKey("up_to_date"))
    {
        if(bDebug)
        {
            LogInternal(string(Name) @ "got unexpected JSON response.");
        }
        return;
    }
    bUpToDate = ResponseList.GetBoolValue("up_to_date");
    if(!bUpToDate)
    {
        WarnInternal("Server is out of date, need version" @ string(ResponseList.GetIntValue("required_version")));
        Class'KFGameInfo'.static.StaticSetNeedsRestart();
    }
    if(bDebug)
    {
        LogInternal((string(Name) @ "response=") $ string(int(bUpToDate)));
    }
}

defaultproperties
{
    APIAppID=232130
    APICall="/ISteamApps/UpToDateCheck/v1/"
}