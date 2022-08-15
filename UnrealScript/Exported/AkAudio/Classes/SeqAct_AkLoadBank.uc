class SeqAct_AkLoadBank extends SeqAct_Latent
	native;

var() bool Async;					// Asynchronous loading
var() AkBank Bank;					// Bank to be loaded / unloaded
var transient int Signal;			// signal (event) used during async load

var transient bool bWaitingCallback;// true if the ojbect must cancel a cookie on destroy.

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Async=True
   InputLinks(0)=(LinkDesc="Load")
   InputLinks(1)=(LinkDesc="Unload")
   ObjName="AkLoadBank"
   ObjCategory="AkAudio"
   Name="Default__SeqAct_AkLoadBank"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
