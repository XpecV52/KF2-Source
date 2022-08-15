//=============================================================================
// KFAnim_TurnInPlace
//=============================================================================
// Blender to handle turning in place transitions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// Based on GearAnim_TurnInPlace 
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class KFAnim_TurnInPlace extends AnimNodeBlend
	native(Anim);

/** Node needs to be initialized to track Pawn rotations */
var		const transient bool		bInitialized;
/** Track Pawn rotation changes */
var		const transient int			LastPawnYaw;
/** Pawn rotation rate for this frame */
var		const transient float		PawnRotationRate;
/** Current Yaw offset between camera and Pawn */
var()		  transient	int			YawOffset;

/**
 * If TRUE, this node will try to delay his parent from blending to another child,
 * So the turn in place animation can play fully.
 */
var()	bool					bDelayBlendOutToPlayAnim;

/** Internal cached pointer to Owner */
var const transient KFPawn	PawnOwner;
var const transient Actor   CachedBase;

struct native RotTransitionInfo
{
	var()	Float	RotationOffset;
	var()	Name	TransName;
};

var()	Array<RotTransitionInfo>	RotTransitions;

var()	float						TransitionBlendInTime;
var		const bool					bPlayingTurnTransition;
var		const INT					CurrentTransitionIndex;
var()	float						TransitionThresholdAngle;

/**
 * Internal, cached array of player nodes.
 * Used to play different types of transition animations.
 */
var	duplicatetransient array<KFAnimSeq_TurnInPlace>	PlayerNodes;
//var	duplicatetransient KFAnimSeq_TurnInPlace PlayerNodeSeq;

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
// (cpptext)
// (cpptext)

simulated native function ResetRotation();

defaultproperties
{
   RotTransitions(0)=(RotationOffset=16384.000000,TransName="Rt_90")
   RotTransitions(1)=(RotationOffset=32768.000000,TransName="Rt_180")
   RotTransitions(2)=(RotationOffset=-16384.000000,TransName="Lt_90")
   RotTransitions(3)=(RotationOffset=-32768.000000,TransName="Lt_180")
   TransitionBlendInTime=0.150000
   TransitionThresholdAngle=4096.000000
   Children(0)=(Name="Source")
   Children(1)=(Name="TurnTransition")
   BlendType=ABT_Cubic
   CategoryDesc="TurnInPlace"
   Name="Default__KFAnim_TurnInPlace"
   ObjectArchetype=AnimNodeBlend'Engine.Default__AnimNodeBlend'
}
