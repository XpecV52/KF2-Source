/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * This is the base class for Facebook integration (each platform has a subclass
 */
class FacebookWindows extends FacebookIntegration 
	native
	config(Engine)
	inherits(FTickableObject)
	;





















































































#linenumber 12

var const native private{private} transient pointer ChildProcHandle{void};

native function bool Init();
native function bool Authorize();
native function bool IsAuthorized();
native function Disconnect();

function FacebookRequest(string GraphRequest)
{
	class'HttpFactory'.static.CreateRequest()
		.SetURL("https://graph.facebook.com/"@GraphRequest@"?access_token="$AccessToken)
		.SetVerb("GET")
		.SetProcessRequestCompleteDelegate(FacebookRequestCallback)
		.ProcessRequest();
}

native function ProcessFacebookRequest(string Payload, INT ResponseCode);

/** Delegate to use for Facebook requests. */
function FacebookRequestCallback(HttpRequestInterface OriginalRequest, HttpResponseInterface Response, bool bDidSucceed)
{
	local string Payload;
	if (bDidSucceed)
	{
		Payload = Response.GetContentAsString();
	}
	ProcessFacebookRequest(Payload, bDidSucceed ? Response.GetResponseCode() : 400);
}

private event RequestFacebookMeInfo()
{
	Username = "";
	UserId = "";

	class'HttpFactory'.static.CreateRequest()
		.SetURL("https://graph.facebook.com/me?access_token="$AccessToken)
		.SetHeader("Content-Type", "application/json")
		.SetVerb("GET")
		.SetProcessRequestCompleteDelegate(OnFacebookMeRequestComplete)
		.ProcessRequest();

}

private function OnFacebookMeRequestComplete(HttpRequestInterface OriginalRequest, HttpResponseInterface Response, bool bDidSucceed)
{
	local string JsonPayload;
	local JsonObject ParsedJson;
	local PlatformInterfaceDelegateResult DelegateResult;

	if (bDidSucceed && 
		Response.GetResponseCode() == 200)
	{
		JsonPayload = Response.GetContentAsString();
		LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@""
			$"JsonPayload="$JsonPayload);

		if (Len(JsonPayload) > 0)
		{
			DelegateResult.bSuccessful = true;
			ParsedJson = class'JsonObject'.static.DecodeJson(JsonPayload);
			if (ParsedJson != None)
			{
				Username = ParsedJson.GetStringValue("name");
				UserId = ParsedJson.GetStringValue("id");
			}
			else
			{
				LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"Failed to parse JSON");
			}
		}
		else
		{
			LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"JSON payload is empty");
		}

		CallDelegates(FID_AuthorizationComplete,DelegateResult);

		// kick off request to get FB friends
		RequestFacebookFriends();
	}
	else
	{
		LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"Failed to get valid response: "
			$" code="$Response.GetResponseCode());

		DelegateResult.bSuccessful = false;
		DelegateResult.Data.Type = PIDT_String;
		DelegateResult.Data.StringValue = "Failed to request user id and name";

		CallDelegates(FID_AuthorizationComplete,DelegateResult);
	}	
}

private event RequestFacebookFriends()
{
	FriendsList.Length = 0;

	class'HttpFactory'.static.CreateRequest()
		.SetURL("https://graph.facebook.com/me/friends?access_token="$AccessToken)
		.SetHeader("Content-Type", "application/json")
		.SetVerb("GET")
		.SetProcessRequestCompleteDelegate(OnFacebookFriendsRequestComplete)
		.ProcessRequest();

}

private function OnFacebookFriendsRequestComplete(HttpRequestInterface OriginalRequest, HttpResponseInterface Response, bool bDidSucceed)
{
	local string JsonPayload;
	local JsonObject ParsedJson,FriendsJson;
	local int JsonIndex;
	local PlatformInterfaceDelegateResult DelegateResult;
	local FacebookFriend Friend;

	if (bDidSucceed && 
		Response.GetResponseCode() == 200)
	{
		JsonPayload = Response.GetContentAsString();
		LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@""
			$"JsonPayload="$JsonPayload);

		if (Len(JsonPayload) > 0)
		{
			ParsedJson = class'JsonObject'.static.DecodeJson(JsonPayload);
			if (ParsedJson != None)
			{
				FriendsJson = ParsedJson.GetObject("data");
				if (FriendsJson != None)
				{
					DelegateResult.bSuccessful = true;
					for (JsonIndex=0; JsonIndex < FriendsJson.ObjectArray.Length; JsonIndex++)
					{
						Friend.Name = FriendsJson.ObjectArray[JsonIndex].GetStringValue("name");
						Friend.Id = FriendsJson.ObjectArray[JsonIndex].GetStringValue("id");
						FriendsList.AddItem(Friend);
					}
				}
				else
				{
					LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"Missing data entry in JSON");
				}
			}
			else
			{
				LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"Failed to parse JSON");
			}
		}
		else
		{
			LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"JSON payload is empty");
		}
		CallDelegates(FID_FriendsListComplete,DelegateResult);
	}
	else
	{
		LogInternal("("$Name$") FacebookWindows::"$GetStateName()$":"$GetFuncName()@"Failed to get valid response: "
			$" code="$Response.GetResponseCode());

		DelegateResult.bSuccessful = false;
		DelegateResult.Data.Type = PIDT_String;
		DelegateResult.Data.StringValue = "Failed to request friends list";

		CallDelegates(FID_FriendsListComplete,DelegateResult);
	}
}

defaultproperties
{
   Name="Default__FacebookWindows"
   ObjectArchetype=FacebookIntegration'Engine.Default__FacebookIntegration'
}
