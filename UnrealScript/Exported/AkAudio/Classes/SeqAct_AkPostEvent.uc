class SeqAct_AkPostEvent extends SeqAct_Latent
	native;

var transient int Signal;		// signal (event) used for EndOfEvent

/** If TRUE, will use PlayAkEvent() instead of the audio device to trigger the AkEvent on clients */
var() bool bReplicateToClients;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Event to post on the targeted actor(s) */
var() AkEvent Event;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Post")
   ObjName="AkPostEvent"
   ObjCategory="AkAudio"
   Name="Default__SeqAct_AkPostEvent"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
