/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 *
 * Interface for processing events as they are read out of the game stats stream
 */
class GameplayEventsHandler extends Object
	abstract
	config(GameStats)
	native;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Array of event types that will be ignored */
var config array<int> EventIDFilter;

/** Array of groups to filter, expands out into EventIDFilter above */
var config array<GameStatGroup> GroupFilter;

/** Reference to the reader for access to metadata, etc */
var transient private{protected} GameplayEventsReader Reader;

/** Set the reader on this handler */
function SetReader(GameplayEventsReader NewReader)
{
	Reader = NewReader;
}

/** A chance to do something before the stream starts */
native event PreProcessStream();

/** A chance to do something after the stream ends */
event PostProcessStream();

/** Iterate over all events, checking to see if they should be filtered out by their group */
event ResolveGroupFilters()
{
	local int EventIdx, FilterIdx;

	for (EventIdx=0; EventIdx<Reader.SupportedEvents.length; EventIdx++)
	{
		// Are we filtering this stats group at all?
		FilterIdx = GroupFilter.Find('Group', Reader.SupportedEvents[EventIdx].StatGroup.Group);
		if (FilterIdx != INDEX_NONE)
		{
			// Stats filter above the indicated level
			if (Reader.SupportedEvents[EventIdx].StatGroup.Level > GroupFilter[FilterIdx].Level)
			{
				AddFilter(Reader.SupportedEvents[EventIdx].EventID);
			}
		}
	}
}

/** Add an event id to ignore while processing */
function AddFilter(int EventID)
{
	if (EventIDFilter.Find(EventID) == INDEX_NONE)
	{
		EventIDFilter.AddItem(EventID);
	}
}

/** Remove an event id to ignore while processing */
function RemoveFilter(int EventID)
{
	EventIDFilter.RemoveItem(EventID);
}

defaultproperties
{
   Name="Default__GameplayEventsHandler"
   ObjectArchetype=Object'Core.Default__Object'
}
