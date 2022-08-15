/*******************************************************************************
 * McpServerTimeManager generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class McpServerTimeManager extends McpServerTimeBase
    config(Engine);

var config string TimeStampUrl;
var string LastTimeStamp;
var HttpRequestInterface HTTPRequestServerTime;

function QueryServerTime()
{
    local string URL, ErrorStr;
    local bool bPending;

    if(HTTPRequestServerTime == none)
    {
        HTTPRequestServerTime = Class'HttpFactory'.static.CreateRequest();
        if(HTTPRequestServerTime != none)
        {
            URL = ((GetBaseURL()) $ TimeStampUrl) $ (GetAppAccessURL());
            HTTPRequestServerTime.SetURL(URL);
            HTTPRequestServerTime.SetVerb("GET");
            HTTPRequestServerTime.__OnProcessRequestComplete__Delegate = OnQueryServerTimeHTTPRequestComplete;
            if(HTTPRequestServerTime.ProcessRequest())
            {
                bPending = true;                
            }
            else
            {
                ErrorStr = "failed to start request, Url=" $ URL;
                LogInternal(((("McpServerTimeManager::" $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ ErrorStr);
            }
        }        
    }
    else
    {
        ErrorStr = "last request is still being processed";
        LogInternal(((("McpServerTimeManager::" $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ ErrorStr);
    }
    if(!bPending)
    {
        OnQueryServerTimeComplete(false, "", ErrorStr);
    }
}

private final function OnQueryServerTimeHTTPRequestComplete(HttpRequestInterface Request, HttpResponseInterface Response, bool bWasSuccessful)
{
    local string TimeStr, ResponseStr, ErrorStr;
    local int Idx;
    local bool bResult;

    HTTPRequestServerTime = none;
    if(bWasSuccessful && Response != none)
    {
        if(Response.GetResponseCode() == 200)
        {
            ResponseStr = Response.GetContentAsString();
            Idx = InStr(ResponseStr, "Timestamp=");
            if(Idx != -1)
            {
                TimeStr = Mid(ResponseStr, Idx);
                Idx = InStr(ResponseStr, "=");
                TimeStr = Mid(TimeStr, Idx);
                LastTimeStamp = TimeStr;
                bResult = true;
            }            
        }
        else
        {
            ErrorStr = "invalid server response code, status=" $ string(Response.GetResponseCode());
            LogInternal(((("McpServerTimeManager::" $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ ErrorStr);
        }        
    }
    else
    {
        ErrorStr = "no response";
        LogInternal(((("McpServerTimeManager::" $ string(GetStateName())) $ ":") $ string(GetFuncName())) @ ErrorStr);
    }
    OnQueryServerTimeComplete(bResult, TimeStr, ErrorStr);
}

function string GetLastServerTime()
{
    return LastTimeStamp;
}

defaultproperties
{
    TimeStampUrl="/timestamp"
}