//=============================================================================
// KFSM_Matriarch_ScorpionWhip
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFSM_Matriarch_ScorpionWhip extends KFSM_TentacleGrappleBase;

function SpecialMoveStarted(bool bForced, Name PrevMove)
{
	super.SpecialMoveStarted(bForced, PrevMove);

	KFPawn_ZedMatriarch(KFPOwner).PlayScorpionWhipDialog();
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded(PrevMove, NextMove);
}

event vector GetSourceLocation()
{
	return PawnOwner.Mesh.GetBoneLocation(TentacleStartBone);
}

defaultproperties
{
   MaxRange=1500.000000
   TentacleEndBone="Tentacle7"
   TentacleStartBone="Tentacle2"
   RetractAirSpeed=5000.000000
   TentacleControlNames(0)="Tentacle3"
   TentacleControlNames(1)="Tentacle4"
   TentacleControlNames(2)="Tentacle5"
   TentacleControlNames(3)="Tentacle6"
   TentacleControlNames(4)="Tentacle7"
   TentacleStartCtrlName="TentacleAnchor"
   Handle="KFSM_Matriarch_ScorpionWhip"
   Name="Default__KFSM_Matriarch_ScorpionWhip"
   ObjectArchetype=KFSM_TentacleGrappleBase'KFGame.Default__KFSM_TentacleGrappleBase'
}
