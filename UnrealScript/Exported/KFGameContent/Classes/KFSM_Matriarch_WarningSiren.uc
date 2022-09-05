//=============================================================================
// KFSM_Matriarch_WarningSiren
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFSM_Matriarch_WarningSiren extends KFSM_ScreamBase;

/** Max distance between the Matriarch and the current victim target */
var float MaxVictimDistance;

var name WindUpAnimName;

function SpecialMoveStarted(bool bForced, name PrevMove)
{
	super.SpecialMoveStarted(bForced, PrevMove);

	PlayWindUpAnimation();

	KFPawn_ZedMatriarch(KFPOwner).PlayWarningSirenDialog();
}

/** Plays subsequent animations in the barrage */
function AnimEndNotify(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
	switch (DeferredSeqName)
	{
	case WindUpAnimName:
		PlayFireAnim();
		break;

	case AnimName:
		KFPOwner.EndSpecialMove();
		break;
	}
}

/** Overridden to do nothing */
function PlayAnimation();

/** Plays our wind up anim, starts the barrel spin skel controller */
function PlayWindUpAnimation()
{
	PlaySpecialMoveAnim(WindUpAnimName, EAS_FullBody, BlendInTime, BlendOutTime, 1.f);
	KFPOwner.ZeroMovementVariables();
}

/** Plays our fire animation, starts weapon fire */
function PlayFireAnim()
{
	PlaySpecialMoveAnim(AnimName, EAS_FullBody, 0.1f, 0.2f);
	KFPOwner.ZeroMovementVariables();

	ScreamBegan(); // @todo: for the siren, this is called in an anim notify
}

function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded(PrevMove, NextMove);
}

defaultproperties
{
   MaxVictimDistance=300.000000
   WindUpAnimName="Warning_Siren_In"
   ScreamDamage=35
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFSM_Matriarch_WarningSiren:ExploTemplate0'
   AnimName="Warning_Siren"
   bCanBeInterrupted=False
   bDisableMovement=True
   bDisableSteering=True
   bShouldDeferToPostTick=True
   Handle="KFSM_Matriarch_WarningSiren"
   Name="Default__KFSM_Matriarch_WarningSiren"
   ObjectArchetype=KFSM_ScreamBase'kfgamecontent.Default__KFSM_ScreamBase'
}
