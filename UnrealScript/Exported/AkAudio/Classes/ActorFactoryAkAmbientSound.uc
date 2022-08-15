class ActorFactoryAkAmbientSound extends ActorFactory
	config(Editor)
	collapsecategories
	hidecategories(Object)
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var()	AKEvent		AmbientEvent;

defaultproperties
{
   MenuName="Add AkAmbientSound"
   NewActorClass=Class'AkAudio.AkAmbientSound'
   Name="Default__ActorFactoryAkAmbientSound"
   ObjectArchetype=ActorFactory'Engine.Default__ActorFactory'
}
