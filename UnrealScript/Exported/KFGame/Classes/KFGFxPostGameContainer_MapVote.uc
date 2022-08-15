//=============================================================================
// KFGFxPostGameContainer_MapVote
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Zane Gholson 05/19/2015
//=============================================================================

class KFGFxPostGameContainer_MapVote extends KFGFxObject_Container;

var localized string YourVoteString;
var localized string TopVotesString;
var string MapVoteString; //localized in parent and parent passes it to this class

//==============================================================
// Initialization
//==============================================================
function Initialize( KFGFxObject_Menu NewParentMenu )
{
	super.Initialize( NewParentMenu );
	LocalizeText();
	SetMapOptions();
}

function LocalizeText()
{
	local GFxObject TextObject;

	TextObject = CreateObject("Object");

	TextObject.SetString("yourVote", 	YourVoteString);
	TextObject.SetString("mapList", 	MapVoteString);
	TextObject.SetString("topVotes", 	TopVotesString);

	SetObject("localizedText", TextObject);
}

function SetMapOptions()
{
	local GFxObject MapList;
	local GFxObject MapObject;
	local int i;
	local array<string> ServerMapList;
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if(KFGRI != none && KFGRI.VoteCollector != none)
	{
		ServerMapList = KFGRI.VoteCollector.MapList;

		//gfx
		MapList = CreateArray();

		for (i = 0; i < ServerMapList.length; i++)
		{
			MapObject = CreateObject("Object");
			MapObject.SetString("label", ServerMapList[i]);
			MapObject.SetString("mapSource", GetMapSource(ServerMapList[i]));
			MapList.SetElementObject(i, MapObject);
		}
	}

	SetObject("mapChoices", MapList);
}

function RecieveTopMaps(const out TopVotes VoteObject)
{
	//For array of objects based on the index pass for map at position.
	local GFxObject MapList;
	local array<string> TopMapList;
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(GetPC().WorldInfo.GRI);

	if(KFGRI != none && KFGRI.VoteCollector != none)
	{
		TopMapList = KFGRI.VoteCollector.MapList;

		//gfx
		MapList = CreateArray();
		if(VoteObject.Map1Index != 255 && VoteObject.Map1Votes > 0)
		{
			MapList.SetElementObject(0, IndexToTopMapObject(TopMapList, VoteObject.Map1Index, VoteObject.Map1Votes));	
		}
		if(VoteObject.Map2Index != 255 && VoteObject.Map2Votes > 0)
		{
			MapList.SetElementObject(1, IndexToTopMapObject(TopMapList, VoteObject.Map2Index, VoteObject.Map2Votes));	
		}
		if(VoteObject.Map3Index != 255 && VoteObject.Map3Votes > 0)
		{
			MapList.SetElementObject(2, IndexToTopMapObject(TopMapList, VoteObject.Map3Index, VoteObject.Map3Votes));	
		}		
	}

	SetObject("currentVotes", MapList);
}

function GFxObject IndexToTopMapObject(const out array<String> TopMapList, int MapIndex, int VoteCount)
{
	local GFxObject MapObject;

	MapObject = CreateObject("Object");
	MapObject.SetString("label", TopMapList[MapIndex]);
	MapObject.SetString("secondaryText", String(VoteCount));
	MapObject.SetString("mapSource", GetMapSource(TopMapList[MapIndex]));
		
	return MapObject;
}

function string GetMapSource(string MapName)
{
	local KFMapSummary MapData;

	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName(MapName);
	if ( MapData != none )
	{
		return "img://" $MapData.ScreenshotPathName;
    }
    else
    {    	
    	// Failed to find map image, use the default instead
    	MapData = class'KFUIDataStore_GameResource'.static.GetMapSummaryFromMapName("KF-Default");
    	if ( MapData != none )
		{
			return "img://" $MapData.ScreenshotPathName;			
    	}
    }
}

defaultproperties
{
   YourVoteString="YOUR VOTE"
   TopVotesString="TOP VOTES"
   Name="Default__KFGFxPostGameContainer_MapVote"
   ObjectArchetype=KFGFxObject_Container'KFGame.Default__KFGFxObject_Container'
}
