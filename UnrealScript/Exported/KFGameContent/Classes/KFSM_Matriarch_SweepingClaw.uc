//=============================================================================
// KFSM_Matriarch_SweepingClaw
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFSM_Matriarch_SweepingClaw extends KFSM_PlaySingleAnim;

/** Max distance between the Matriarch and the current victim target */
var float MaxVictimDistance;

function SpecialMoveStarted( bool bForced, Name PrevMove )
{
    super.SpecialMoveStarted(bForced, PrevMove);

	KFPawn_ZedMatriarch(KFPOwner).PlaySweepingClawDialog();
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
    super.SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
   MaxVictimDistance=100.000000
   AnimName="Sweeping_Claw_V1"
   bUseRootMotion=True
   Handle="KFSM_Matriarch_SweepingClaw"
   Name="Default__KFSM_Matriarch_SweepingClaw"
   ObjectArchetype=KFSM_PlaySingleAnim'KFGame.Default__KFSM_PlaySingleAnim'
}
