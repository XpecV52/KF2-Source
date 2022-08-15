/**
 * The webadmin user used for the multi admin authentication
 *
 * Copyright 2008 Epic Games, Inc. All Rights Reserved
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class MultiWebAdminUser extends BasicWebAdminUser implements(ISettingsPrivileges);

var MultiAdminData adminData;

var string settingsPrivBaseUri;

function string getUserid()
{
	return string(adminData.name);
}

function logout()
{
	adminData = none;
	super.logout();
}

function bool canPerform(string uri)
{
	local int idx;
	addCheckedPrivileges(uri);
	if (adminData != none)
	{
		if (left(uri, 11) ~= "webadmin://")
		{
			idx = InStr(uri, "/",,, 11);
			if (idx != INDEX_NONE)
			{
				uri = Mid(uri, idx);
				if (uri == "/") return true; // always allow root
				return adminData.canAccess(uri);
			}
		}
	}
	return false;
}

function ISettingsPrivileges getSettingsPrivileges()
{
	return self;
}

function setBasePrivilegeUri(String uri)
{
	settingsPrivBaseUri = uri;
}

function bool hasSettingsGroupAccess(class<WebAdminSettings> settings, string groupId)
{
	return canPerform(settingsPrivBaseUri$"#"$groupId);
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'webadmin.Default__BasicWebAdminUser:Sprite'
      SpriteCategoryName="Info"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'webadmin.Default__BasicWebAdminUser:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__MultiWebAdminUser"
   ObjectArchetype=BasicWebAdminUser'webadmin.Default__BasicWebAdminUser'
}
