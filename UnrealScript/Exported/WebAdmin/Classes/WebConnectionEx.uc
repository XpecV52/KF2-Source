/**
 * Quick fix for handling request content type
 *
 * Copyright 2008 Epic Games, Inc. All Rights Reserved
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class WebConnectionEx extends WebConnection;

function CheckRawBytes()
{
	if(RawBytesExpecting <= 0)
	{
		if(InStr(Locs(Request.ContentType), "application/x-www-form-urlencoded") != 0)
		{
			LogInternal("WebConnection: Unknown form data content-type: "$Request.ContentType);
			Response.HTTPError(400); // Can't deal with this type of form data
		}
		else
		{
			Request.DecodeFormData(ReceivedData);
			if (Application.PreQuery(Request, Response))
			{
			  Application.Query(Request, Response);
			  Application.PostQuery(Request, Response);
			}
			ReceivedData = "";
		}
		Cleanup();
	}
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'IpDrv.Default__WebConnection:Sprite'
      SpriteCategoryName="Info"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'IpDrv.Default__WebConnection:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__WebConnectionEx"
   ObjectArchetype=WebConnection'IpDrv.Default__WebConnection'
}
