/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Implementation of interface for requesting UTC time from the server
 */
class McpServerTimeManager extends McpServerTimeBase;





















































































#linenumber 8

/** The class name to use in the factory method to create our instance */
var config String TimeStampUrl;

/** String for the last valid server time response */
var String LastTimeStamp;

/** HTTP request object that is used for the server time query. None when no request is in flight */
var HttpRequestInterface HTTPRequestServerTime;

/**
 * Request current UTC time from the server
 */
function QueryServerTime()
{
	local string Url,ErrorStr;
	local bool bPending;

	if (HTTPRequestServerTime == None)
	{
		HTTPRequestServerTime = class'HttpFactory'.static.CreateRequest();
		if (HTTPRequestServerTime != None)
		{
			Url = GetBaseURL() $ TimeStampUrl $ GetAppAccessURL();
			HTTPRequestServerTime.SetURL(Url);
			HTTPRequestServerTime.SetVerb("GET");
			HTTPRequestServerTime.OnProcessRequestComplete = OnQueryServerTimeHTTPRequestComplete;
			if (HTTPRequestServerTime.ProcessRequest())
			{
				bPending = true;
			}
			else
			{
				ErrorStr = "failed to start request, Url="$Url;
				LogInternal("McpServerTimeManager::"$GetStateName()$":"$GetFuncName()@ErrorStr);
			}
		}	
	}
	else
	{
		ErrorStr = "last request is still being processed";
		LogInternal("McpServerTimeManager::"$GetStateName()$":"$GetFuncName()@ErrorStr);
	}
	if (!bPending)
	{
		OnQueryServerTimeComplete(false,"",ErrorStr);
	}
}

/**
 * Called once the request/response has completed for getting server time from Mcp
 * 
 * @param Request the request object that was used
 * @param Response the response object that was generated
 * @param bWasSuccessful whether or not the request completed successfully
 */
private function OnQueryServerTimeHTTPRequestComplete(HttpRequestInterface Request, HttpResponseInterface Response, bool bWasSuccessful)
{
	local string TimeStr,ResponseStr,ErrorStr;
	local int Idx;
	local bool bResult;

	HTTPRequestServerTime = None;

	if (bWasSuccessful &&
		Response != None)
	{
		if (Response.GetResponseCode() == 200)
		{
			ResponseStr = Response.GetContentAsString();
			Idx = InStr(ResponseStr, "Timestamp=");
			if (Idx != INDEX_NONE)
			{
				// Example : TimeFormat="yyyy.MM.dd-HH.mm.ss" Timestamp=2011.10.29-03.19.49
				TimeStr = Mid(ResponseStr, Idx);
				Idx = InStr(ResponseStr, "=");
				TimeStr = Mid(TimeStr, Idx);

				// cache last valid time stamp
				LastTimeStamp = TimeStr;

				bResult = true;
			}
		}
		else
		{
			ErrorStr = "invalid server response code, status="$Response.GetResponseCode();
			LogInternal("McpServerTimeManager::"$GetStateName()$":"$GetFuncName()@ErrorStr);
		}
	}
	else
	{
		ErrorStr = "no response";
		LogInternal("McpServerTimeManager::"$GetStateName()$":"$GetFuncName()@ErrorStr);
	}
	OnQueryServerTimeComplete(bResult,TimeStr,ErrorStr);
}

/**
 * Retrieve cached timestamp from last server time query 
 *
 * @return string representation of time (yyyy.MM.dd-HH.mm.ss)
 */
function String GetLastServerTime()
{
	return LastTimeStamp;
}

defaultproperties
{
   TimeStampUrl="/timestamp"
   Name="Default__McpServerTimeManager"
   ObjectArchetype=McpServerTimeBase'IpDrv.Default__McpServerTimeBase'
}
