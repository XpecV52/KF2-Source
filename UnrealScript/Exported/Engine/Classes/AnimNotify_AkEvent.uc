/**
 *
 */
class AnimNotify_AkEvent extends AnimNotify
	native(Anim);

var()	AkEvent		AkEvent;
var()	bool		bFollowActor;
var()	Name		BoneName;


var()   bool        bIgnoreIfActorHidden;
/** Useful to ensure it won't activate while blending from this anim into a death anim */
var()   bool        bIgnoreIfActorDead;
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
   bIgnoreIfActorDead=True
   PercentToPlay=1.000000
   Name="Default__AnimNotify_AkEvent"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
