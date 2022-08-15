//=============================================================================
// KFAnim_BlendByTargetingMode
//=============================================================================
// Chooses blend child from weapon aim/stance
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFAnim_BlendByTargetingMode extends AnimNodeBlendList
	native(Anim);

enum ETargetingBlendChild
{
	ETBC_Idle,
	ETBC_Aiming,
	ETBC_DownSights,
};

/** Internal cached pointer to KFPawn Owner */
var const transient	KFPawn	PawnOwner;

// OnChildAnimChange registers valid target child nodes
var() editconst bool bAllowDownSightsChild;
var() editconst bool bAllowAimingChild;

/** Custom blend in time for each child */
var() editfixedsize array<float> ChildBlendInTime;

/** Time Pawn is going to keep aiming after firing a weapon, before returning to idle/ready pose */
var() float AimTimeAfterFiring;

/** When moving the slider, keep nodes with same property in sync. */
var(Editor)	bool	bSynchronizeNodesInEditor;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function SetActiveChild(INT ChildIndex, FLOAT BlendTime);

defaultproperties
{
   bSynchronizeNodesInEditor=True
   ChildBlendInTime(0)=0.330000
   ChildBlendInTime(1)=0.200000
   ChildBlendInTime(2)=0.200000
   AimTimeAfterFiring=2.000000
   Children(0)=(Name="Idle/Default")
   Children(1)=(Name="Aim/Ready")
   Children(2)=(Name="DownSights")
   bFixNumChildren=True
   BlendType=ABT_EaseInOutExponent3
   NodeName="Blend Targeting Mode"
   Name="Default__KFAnim_BlendByTargetingMode"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
