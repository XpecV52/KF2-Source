class SeqAct_AkSetSwitch extends SequenceAction
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() string SwitchGroup;
var() string Switch;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Set")
   ObjName="AkSetSwitch"
   ObjCategory="AkAudio"
   Name="Default__SeqAct_AkSetSwitch"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
