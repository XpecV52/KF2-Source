//=============================================================================
// KFAnimSeq_TurnInPlace
//=============================================================================
// Node to play a transition animation referenced by transition type.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
// Based on GearAnim_TurnInPlace_Player 
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class KFAnimSeq_TurnInPlace extends AnimNodeSequenceBlendBase
	native(Anim);

struct native TIP_Transition
{
	var()	Name	TransName;
	var()	Name	AnimName;
};

var()	Array<TIP_Transition>	TIP_Transitions;

/** Transition blend time */
var()	FLOAT			TransitionBlendTime;
var		transient INT	ActiveChildIndex;
var		transient FLOAT	BlendTimeToGo;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   TIP_Transitions(0)=(TransName="Rt_90",AnimName="AR_Idle_Ready_Turn_Rt_90")
   TIP_Transitions(1)=(TransName="Rt_180",AnimName="AR_Idle_Ready_Turn_Rt_180")
   TIP_Transitions(2)=(TransName="Lt_90",AnimName="AR_Idle_Ready_Turn_Lt_90")
   TIP_Transitions(3)=(TransName="Lt_180",AnimName="AR_Idle_Ready_Turn_Lt_180")
   TransitionBlendTime=0.330000
   RootRotationOption(0)=RRO_Discard
   RootRotationOption(1)=RRO_Discard
   RootRotationOption(2)=RRO_Discard
   Name="Default__KFAnimSeq_TurnInPlace"
   ObjectArchetype=AnimNodeSequenceBlendBase'Engine.Default__AnimNodeSequenceBlendBase'
}
