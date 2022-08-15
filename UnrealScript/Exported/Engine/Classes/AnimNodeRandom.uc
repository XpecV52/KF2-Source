/**
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */

class AnimNodeRandom extends AnimNodeBlendList
	native(Anim)
	hidecategories(Object);

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

struct native RandomAnimInfo
{
	/** Chance this child will be selected */
	var() float		Chance;
	/** Minimum number of loops to play this animation */
	var() Byte		LoopCountMin;
	/** Maximum number of loops to play this animation */
	var() Byte		LoopCountMax;
	/** Blend in time for this child */
	var() float		BlendInTime;
	/** Animation Play Rate Scale */
	var() Vector2D	PlayRateRange;
	/** If it's a still frame, don't play animation. Just randomly pick one, and stick to it until we lose focus */
	var() bool		bStillFrame;

	/** Number of loops left to play for this round */
	var transient byte	LoopCount;
	/** Keep track of last position */
	var transient float LastPosition;

	structdefaultproperties
	{
		Chance=1.f
		LoopCountMin=0
		LoopCountMax=0
		BlendInTime=0.25f
		PlayRateRange=(X=1.f,Y=1.f)
	}
};

var() editfixedsize editinline Array<RandomAnimInfo> RandomInfo;

/** Pointer to AnimNodeSequence currently playing random animation. */
var transient	AnimNodeSequence	PlayingSeqNode;
var transient	INT					PendingChildIndex;
var transient   bool                bPickedPendingChildIndex;

defaultproperties
{
   ActiveChildIndex=-1
   CategoryDesc="Random"
   Name="Default__AnimNodeRandom"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
