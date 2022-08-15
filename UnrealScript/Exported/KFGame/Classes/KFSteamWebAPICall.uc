//=============================================================================
// KFSteamWebAPICall
//=============================================================================
// Base class for Steamworks Web API functionality. Copypasta from KF1
//=============================================================================
// Copyright (C) 2015 Tripwire Interactive LLC
// - Joshua "Josh" Rowan
// Based off of KFSteamWebApi Copyright 2007 Tripwire Interactive, Inc.
// All Rights Reserved.
//=============================================================================

class KFSteamWebAPICall extends Object
	native
	abstract
	inherits(FTickableObject);

var float RequestTimeout;
var string steamAPIAddr;
var string Format;
var native pointer Downloader{class FHttpDownloadString};

/** Used to toggle debug logging */
var bool bDebug;

//Used by concrete subclasses
var string APICall;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function CallWebProcedure(string FunctionCall, string Parameters)
{
	local string URL;
	local string Payload;

	URL = "http://" $ steamAPIAddr $ FunctionCall;
	Payload = Parameters;
	if (Len(payload) > 0)
	{
		Payload = Payload $ "&";
	}
	Payload = Payload $ Format; 

	SendHTTPGet(steamAPIAddr, URL, Payload, RequestTimeout);
}

native function SendHTTPGet(string Domain, string URL, string Payload, float Timeout);

event Finished(bool success, string ReturnStr)
{
	local JsonObject response;

	if (!success)
	{
		if (bDebug) LogInternal(Class.Name @ "did not get HTTP response.");
		return;
	}
	response = class'JsonObject'.static.DecodeJson(ReturnStr);

	if ( response == none )
	{
		if (bDebug) LogInternal(Class.Name @ "could not parse HTTP response.");
		return;
	}

	ProcessResponse(response);
}

function ProcessResponse(JsonObject response);

defaultproperties
{
   RequestTimeout=10.000000
   steamAPIAddr="api.steampowered.com"
   Format="format=json"
   Name="Default__KFSteamWebAPICall"
   ObjectArchetype=Object'Core.Default__Object'
}
