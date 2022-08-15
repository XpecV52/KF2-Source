//=============================================================================
// KFAnimSeq_BlendByDirection
//=============================================================================
// Anim Node Sequence which blends Fwd/Bwd/Lt/Rt movement anims
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
// Based on GearAnim_BlendAnimsByDirection 
// Copyright 1998-2012 Epic Games, Inc.
//=============================================================================

class KFAnimSeq_Directional extends AnimNodeSequenceBlendBase
	native(Anim);

/** Should Rotation Rate be taken into account. */
var()			bool	bAddRotationRate;

/** Internal */
var				float	DirAngle;
var             float   TargetAngle;
var	transient	vector	MoveDir;
var transient	INT		LastYaw;
var transient	FLOAT	YawRotationRate;

/** Cached pointer to PawnOwner */
var transient KFPawn	PawnOwner;

enum EDirectionInterpType
{
	EDIT_None,
	EDIT_Circular,
	EDIT_Linear
};

var() EDirectionInterpType  DirectionInterpType;
var() FLOAT                 CircularInterpSpeed, LinearInterpSpeed;

/** When moving the slider, keep nodes with same property in sync. */
var()	bool	bSynchronizeNodesInEditor;

/** Restart animations on become relevant */
var()	bool	bRestartOnBecomeRelevant;

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
   bSynchronizeNodesInEditor=True
   DirectionInterpType=EDIT_Linear
   CircularInterpSpeed=180.000000
   LinearInterpSpeed=10.000000
   Anims(0)=(AnimName="Forward")
   Anims(1)=(AnimName="Backward")
   Anims(2)=(AnimName="Left")
   Anims(3)=(AnimName="Right")
   Name="Default__KFAnimSeq_Directional"
   ObjectArchetype=AnimNodeSequenceBlendBase'Engine.Default__AnimNodeSequenceBlendBase'
}
