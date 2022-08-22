//=============================================================================
// KFSM_Frozen
//=============================================================================
// Used to stop a zed from moving and play a freeze and thaw animation
// for a random amount of time
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Jeff Robinson
//=============================================================================

class KFSM_Frozen extends KFSpecialMove;

var()	name		FrozenAnim;
var()	array<name>	ThawAnims;

var() float FreezeInTime, FreezeOutTime;
var() Vector2D FreezeDuration;

var	float BeginFreezePhaseTime;
var float FreezeMatParamValue;

var protected ParticleSystem FrozenSteamTemplate;
var protected ParticleSystemComponent FrozenSteamEffect;

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );
	DoFreeze();
}

/** Stop the movement and play the stun animation for all clients */
function DoFreeze()
{
	local float TimeUntilThaw;

	if ( KFPOwner.Role == ROLE_Authority )
	{
		// Disable Movement by using the DefaultAICommandClass to call LockdownAI()
		TimeUntilThaw = KFPOwner.IncapSettings[AF_Freeze].Duration > 0 ? KFPOwner.IncapSettings[AF_Freeze].Duration : RandRange(FreezeDuration.X, FreezeDuration.Y);
		KFPOwner.SetTimer(TimeUntilThaw, false, nameof(DoThaw), self);
	}

	if ( PawnOwner.WorldInfo.NetMode != NM_DedicatedServer )
	{
		BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
		KFPOwner.SetTimer( 0.1f, true, nameof(UpdateFreezeInParam), self );
		FrozenSteamEffect = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(FrozenSteamTemplate, KFPOwner.Mesh, 'root');
	}	

	// use a really slow rate to emulate being frozen
	PlaySpecialMoveAnim( FrozenAnim, EAS_FullBody, FreezeInTime, 0.3f, 0.001f, true );
}

/* Play a random wakeup animation */
function DoThaw()
{
	local KFPawn_Monster P;

	if ( PawnOwner.Role == ROLE_Authority )
	{		
		// if pawn's head has already been blown off, skip thawing
		P = KFPawn_Monster(PawnOwner);
		if( P != None && P.bIsHeadless )
		{
			P.BleedOutTimer();
		}
		else
		{
			KFPOwner.SpecialMoveFlags = 1 + Rand( ThawAnims.Length );
			KFPOwner.ReplicatedSpecialMove.Flags = KFPOwner.SpecialMoveFlags;
			PlayThawAnimation();
		}
	}
}

/* Play a random wakeup animation */
function PlayThawAnimation()
{
	local byte ThawIndex;

	ThawIndex = KFPOwner.SpecialMoveFlags - 1;
	PlaySpecialMoveAnim(ThawAnims[ThawIndex], EAS_FullBody, FreezeOutTime, 0.3f, 0.5f, false);
	
	if ( PawnOwner.WorldInfo.NetMode != NM_DedicatedServer )
	{
		BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
		KFPOwner.SetTimer( 0.1f, true, nameof(UpdateFreezeOutParam), self );
		// Match the material param blend time to the animation length
		FreezeOutTime = PawnOwner.Mesh.GetAnimLength(ThawAnims[ThawIndex]);
	}
}

/* Play the wakeup animation for all clients */
function SpecialMoveFlagsUpdated()
{
	PlayThawAnimation();
}

function UpdateFreezeInParam()
{
	local float Param;

	Param = FMin( 1.f, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeInTime );
    SetFrozenParameter(Param);
 
    if( Param == 1.f )
    {
    	KFPOwner.ClearTimer( nameof(UpdateFreezeInParam), self );
    }
}

function UpdateFreezeOutParam()
{
	local float Param;

	Param = 1.f - FMin( 1.f, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeOutTime );
	SetFrozenParameter(Param);

    if( Param == 0.f )
    {
    	KFPOwner.ClearTimer( nameof(UpdateFreezeOutParam), self );
    }
}

/** Notification called when Special Move starts when ReplicatedSpecialMove changes*/
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );
	
	if ( PawnOwner.WorldInfo.NetMode != NM_DedicatedServer )
	{
		KFPOwner.DetachEmitter( FrozenSteamEffect );

		// if we're dead, shatter
		if( !PawnOwner.IsAliveAndWell() )
		{
			PlayDeathEffects();
			KFPOwner.ClearTimer( nameof(UpdateFreezeOutParam), self );
		}
	}

	KFPOwner.ClearTimer( nameof(UpdateFreezeInParam), self );
	KFPOwner.ClearTimer( nameof(DoThaw), self );
}

/** Reapply material param (e.g. headless or head chunk during freeze) */
function OnGoreMeshSwap()
{
	SetFrozenParameter(FreezeMatParamValue);
}

/** Enable/Disable the Frozen material effect */
function SetFrozenParameter(float FreezeAmount)
{
	local MaterialInstanceConstant MIC;

    if ( PawnOwner.WorldInfo.NetMode != NM_DedicatedServer )
    {
    	FreezeMatParamValue = FreezeAmount;

	    foreach KFPOwner.CharacterMICs(MIC)
	    {
			MIC.SetScalarParameterValue( 'Scalar_Ice', FreezeMatParamValue );
	    }
    }
}

/** Do shatter VFX & Gore on death */
function PlayDeathEffects()
{
	if ( PawnOwner.WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	// As long as we were killed by a weapon, add some VFX
	if ( PawnOwner.HitDamageType != class'KFDT_Bleeding' )
	{
		// This happens "just" before ragdoll death is triggered
		class'KFDT_Freeze'.static.PlayShatter(KFPOwner, false);
	}
	else
	{
		PawnOwner.SetTimer(0.5f, false, nameof(DelayedShatterTimer), self);
	}
}

function DelayedShatterTimer()
{
	class'KFDT_Freeze'.static.PlayShatter(KFPOwner, true);
}

defaultproperties
{
	Handle=KFSM_Frozen

	FrozenAnim=Stun_Loop_V1
	ThawAnims.Add(Stun_Wakeup_V1)
	ThawAnims.Add(Stun_Wakeup_V2)
	ThawAnims.Add(Stun_Wakeup_V3)

	FreezeDuration=(X=3,Y=5)
	FreezeInTime=0.5
	FreezeOutTime=1

	bAllowHitReactions=FALSE
	bDisableMovement=TRUE
	bLockPawnRotation=TRUE

	DefaultAICommandClass=class'KFGame.AICommand_PushedBySM'
	bDisablesWeaponFiring=true
	bCanOnlyWanderAtEnd=true

	FrozenSteamTemplate=ParticleSystem'WEP_Freeze_Grenade_EMIT.FX_Freeze_Grenade_Smoke'
}


