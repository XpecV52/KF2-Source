class InterpTrackAkEvent extends InterpTrack
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

/** Information for one sound in the track. */
struct native AkEventTrackKey
{
	var		float		Time;
	var()	AkEvent		Event;
};	

/** Array of sounds to play at specific times. */
var	array<AkEventTrackKey>	AkEvents;

defaultproperties
{
   TrackInstClass=Class'AkAudio.InterpTrackInstAkEvent'
   TrackTitle="AkEvent"
   Name="Default__InterpTrackAkEvent"
   ObjectArchetype=InterpTrack'Engine.Default__InterpTrack'
}
