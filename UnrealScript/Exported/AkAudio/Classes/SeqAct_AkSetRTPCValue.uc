class SeqAct_AkSetRTPCValue extends SeqAct_Latent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of game parameter */
var() string Param;

/** Value of game parameter, default value used if no variable linked */
var() float Value;

/** True when sending RTPC signal */
var transient bool Running;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Value",PropertyName="Value")
   ObjName="AkSetRTPCValue"
   ObjCategory="AkAudio"
   Name="Default__SeqAct_AkSetRTPCValue"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
