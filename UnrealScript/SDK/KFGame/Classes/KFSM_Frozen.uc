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

var() 	float FreezeDuration, FreezeInTime, FreezeOutTime;

var		transient float BeginFreezePhaseTime;

var protected ParticleSystem FrozenShatterTemplate;
var protected ParticleSystem FrozenSteamTemplate;
var protected ParticleSystemComponent FrozenSteamEffect;

var transient bool bShatter;

/** Notification called when Special Move starts */
function SpecialMoveStarted(bool bForced, Name PrevMove )
{
	super.SpecialMoveStarted( bForced, PrevMove );
	DoFreeze();
}

/** Stop the movement and play the stun animation for all clients */
function DoFreeze()
{
	if ( KFPOwner.Role == ROLE_Authority )
	{
		// Disable Movement by using the DefaultAICommandClass to call LockdownAI()
		FreezeDuration = default.FreezeDuration - (default.FreezeDuration/4.f) + ((default.FreezeDuration/2.f)*FRand());//( default.FreezeDuration * FRand() );
		KFPOwner.SetTimer(FreezeDuration, false, nameof(DoThaw), self);
	}

	BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
	KFPOwner.SetTimer( 0.1f, true, nameof(UpdateFreezeInParam), self );

	// use a really slow rate to fake being "frozen"
	PlaySpecialMoveAnim( FrozenAnim, EAS_FullBody, FreezeInTime, 0.3f, 0.001f, true );

	FrozenSteamEffect = KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(FrozenSteamTemplate, KFPOwner.Mesh, 'root');

	bShatter = true;
}

/** Thaw the zed once the servers timer has finished */
function DoThaw()
{
	// replicate to all clients
	if ( KFPOwner.Role == ROLE_Authority )
	{
		KFPOwner.SpecialMoveFlags = 1;
		KFPOwner.ReplicatedSpecialMove.Flags = 1;
        PlayThawAnimation();
	}
}

/* Play a random wakeup animation */
function PlayThawAnimation()
{
	local byte ThawIndex;

	ThawIndex = Rand( ThawAnims.Length );
	PlaySpecialMoveAnim(ThawAnims[ThawIndex], EAS_FullBody, FreezeOutTime, 0.3f, 0.5f, false);

	// if pawn's head has already been blown off, just shatter
	if( KFPawn_Monster(KFPOwner).bIsHeadless )
	{
		KFPOwner.Died( none, none, KFPOwner.Location );
	}
	else
	{
		bShatter = false;
		BeginFreezePhaseTime = KFPOwner.WorldInfo.TimeSeconds;
		KFPOwner.SetTimer( 0.1f, true, nameof(UpdateFreezeOutParam), self );
	}
}

function UpdateFreezeInParam()
{
	local float Param;

	Param = FMin( 1.f, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeInTime );
    KFPOwner.AfflictionHandler.SetFrozenParameter(Param);
    KFPawn_Monster(KFPOwner).RepFrozenMatParam = FloatToByte(Param);

    if( Param >= FreezeInTime )
    {
    	KFPOwner.ClearTimer( nameof(UpdateFreezeInParam), self );
    }
}

function UpdateFreezeOutParam()
{
	local float Param;

	Param = 1.f - FMin( 1.f, (KFPOwner.WorldInfo.TimeSeconds - BeginFreezePhaseTime) / FreezeOutTime );
	KFPOwner.AfflictionHandler.SetFrozenParameter(Param);
	KFPawn_Monster(KFPOwner).RepFrozenMatParam = FloatToByte(Param);

    if( Param >= FreezeOutTime )
    {
    	KFPOwner.ClearTimer( nameof(UpdateFreezeOutParam), self );
    }
}

/* Play the wakeup animation for all clients */
function SpecialMoveFlagsUpdated()
{
	PlayThawAnimation();
}

/** Notification called when Special Move starts when ReplicatedSpecialMove changes*/
function SpecialMoveEnded(Name PrevMove, Name NextMove)
{
	super.SpecialMoveEnded( PrevMove, NextMove );

	// Enable movement
	if ( KFPOwner.MyKFAIC != None )
	{
		KFPOwner.MyKFAIC.bPreparingMove = false;
	}

	KFPOwner.DetachEmitter( FrozenSteamEffect );

	// if we're dead, shatter
	if( bShatter )
	{
		Shatter();
	}

	KFPOwner.ClearTimer( nameof(UpdateFreezeInParam), self );
	KFPOwner.ClearTimer( nameof(UpdateFreezeOutParam), self );
	KFPOwner.ClearTimer( nameof(DoThaw), self );
}

function Shatter()
{
	KFPOwner.WorldInfo.MyEmitterPool.SpawnEmitter( FrozenShatterTemplate, KFPOwner.Location, rotator(vect(0,0,1)) );
	KFPawn_Monster(KFPOwner).ForceBreakAllConstraints();
}

defaultproperties
{
	Handle=KFSM_Frozen

	FrozenAnim=Stun_Loop_V1
	ThawAnims.Add(Stun_Wakeup_V1)
	ThawAnims.Add(Stun_Wakeup_V2)
	ThawAnims.Add(Stun_Wakeup_V3)

	FreezeDuration=4
	FreezeInTime=1
	FreezeOutTime=1

	bAllowHitReactions=FALSE
	bDisableMovement=TRUE
	bLockPawnRotation=TRUE

	DefaultAICommandClass=class'KFGame.AICommand_PushedBySM'
	bDisablesWeaponFiring=true
	bCanOnlyWanderAtEnd=true
}


