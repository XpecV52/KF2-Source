//=============================================================================
// KFSeqAct_MovePawnsNotInVolume
//=============================================================================
// Action that checks to see if a pawn is within a volume, and if not 
// attempt to move it to an actor's location.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFSeqAct_MovePawnsNotInVolume extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** If TRUE, will only process living players from an input object list containing players */
var() bool bOnlyLivingPlayers;

/** If TRUE, picks a random destination actor if there are multiple object inputs */
var() bool bRandomizeDestination;

/** If TRUE, checks to see if there is another pawn overlapping the actor before choosing it */
var() bool bCheckOverlap<EditCondition=!bRandomizeDestination>;

/** If TRUE, will set the pawn's rotation to the destination actor's rotation */
var() bool bSetRotation;

/** Should we fade in after teleporting? */
var(FadeIn) bool bFadeIn;
/** Color used to fade */
var(FadeIn) color FadeColor<EditCondition=bFadeIn>;
/** The opacity that the camera will fade to */
var(FadeIn) float EndFadeOpacity<ClampMin=0.0 | ClampMax=1.0 | EditCondition=bFadeIn>;
/** How long to fade to FadeOpacity from the camera's current fade opacity */
var(FadeIn) float FadeTime<ClampMin=0.0 | EditCondition=bFadeIn>;
/** Should audio be faded as well */
var(FadeIn) bool bFadeAudio<EditCondition=bFadeIn>;

var transient native vector2D FadeAlpha;

defaultproperties
{
   bOnlyLivingPlayers=True
   bCheckOverlap=True
   bSetRotation=True
   bFadeIn=True
   FadeColor=(B=255,G=255,R=255,A=255)
   FadeTime=1.000000
   VariableLinks(0)=(LinkDesc="Pawn",PropertyName=)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Volume")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Destination Actor")
   ObjName="Move Pawns Not In Volume"
   ObjCategory="Pawn"
   Name="Default__KFSeqAct_MovePawnsNotInVolume"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
