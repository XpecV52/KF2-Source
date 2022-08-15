/**
 *
 */
class AnimNotify_AkEvent extends AnimNotify
	native(Anim);

var()	AkEvent		AkEvent;
var()	bool		bFollowActor;
var()	Name		BoneName;


var()   bool        bIgnoreIfActorHidden;
/** This is the percent to play this Sound.  Defaults to 100% (aka 1.0f) **/
var()   float       PercentToPlay;


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

defaultproperties
{
   bFollowActor=True
   PercentToPlay=1.000000
   Name="Default__AnimNotify_AkEvent"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
