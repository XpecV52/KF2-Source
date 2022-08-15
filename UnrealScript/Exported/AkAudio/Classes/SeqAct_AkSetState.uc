class SeqAct_AkSetState extends SequenceAction
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() string StateGroup;
var() string State;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Set")
   ObjName="AkSetState"
   ObjCategory="AkAudio"
   Name="Default__SeqAct_AkSetState"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
