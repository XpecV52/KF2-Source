//=============================================================================
// KFAnim_MovementNode
//=============================================================================
// Anim Node used to determine movement state
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFAnim_Movement extends AnimNodeBlendBySpeed
	native(Anim);

/** Scale Animations Play Rate using Constraints as base speed */
var() bool	bScaleAnimPlayRateBySpeed;
/** Position of the movement cycle when starting to move */
var() float	MoveCycleFirstStepStartPosition;

/** Synchronization node info. To access normalized movement info */
var	  const transient AnimTree	RootNode;
var() Name						SynchGroupName;

/** When moving the slider, keep nodes with same property in sync. */
var() bool	bSynchronizeNodesInEditor;

/** If set, calculate speed from owner's base instead of owner */
var() bool  bUseOwnersBase;

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

/** for MoveCycleFirstStepStartPosition */
native function SetActiveChild( INT ChildIndex, FLOAT BlendTime );

	

defaultproperties
{
   bSynchronizeNodesInEditor=True
   MoveCycleFirstStepStartPosition=0.300000
   SynchGroupName="RunWalk"
   BlendUpTime=0.300000
   BlendDownTime=0.300000
   Constraints(1)=300.000000
   Constraints(2)=500.000000
   Children(0)=(Name="Idle")
   Children(1)=(Name="Walk")
   Children(2)=(Name="Run")
   Name="Default__KFAnim_Movement"
   ObjectArchetype=AnimNodeBlendBySpeed'Engine.Default__AnimNodeBlendBySpeed'
}
