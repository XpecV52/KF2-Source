/**
 * Cache entry for UIGameInfoSummary
 *
 * Copyright (C) 2011,2014 Tripwire Interactive LLC
 *
 * @author  Michiel 'elmuerte' Hendriks
 */
class DCEGameInfo extends DataStoreCacheEntry;

var string ClassName;

var UIGameInfoSummary data;

function init(UIGameInfoSummary source)
{
	data = source;
	if (data == none)
	{
		WarnInternal("No UIGameInfoSummary");
		return;
	}
	FriendlyName = ensureFriendlyName(data.GameName, data.ClassName, string(data.name));
	Description = class'WebAdminUtils'.static.getLocalized(data.Description);
	ClassName = data.ClassName;
}

defaultproperties
{
   Name="Default__DCEGameInfo"
   ObjectArchetype=DataStoreCacheEntry'webadmin.Default__DataStoreCacheEntry'
}
