//=============================================================================
// KFPawn_ZedStalker
//=============================================================================
// Stalker
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedStalker extends KFPawn_Monster;

var MaterialInstanceConstant SpottedMaterial;

var AkBaseSoundObject CloakedLoop;
var AkBaseSoundObject CloakedLoopEnd;

var float CloakPercent;

/** The local player controller viewing this pawn */
var KFPlayerController ViewerPlayer;

/** Cloak speeds */
var float CloakSpeed;
var float DeCloakSpeed;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	SetCloaked( true );
	PlayStealthSoundLoop();
}

/**
* Check on various replicated data and act accordingly.
*/
simulated event ReplicatedEvent(name VarName)
{
	switch( VarName )
	{
	case nameof(bIsCloakingSpottedByTeam):
		SetGameplayMICParams();
		break;
	case nameof(bIsCloaking):
		ClientCloakingStateUpdated();
		break;
	}

	Super.ReplicatedEvent(VarName);
}

/** Toggle cloaking material */
function SetCloaked(bool bNewCloaking)
{
	if ( bCanCloak )
	{
		if( IsImpaired() && bNewCloaking )
		{
			return;
		}

		if( MaxHeadChunkGoreWhileAlive == 0 && bIsCloaking != bNewCloaking && IsAliveAndWell() )
		{
			`DialogManager.PlaySpotCloakDialog( self, bNewCloaking );
		}

		bIsCloaking = bNewCloaking;

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			SetGameplayMICParams();
			Mesh.SetPerObjectShadows(!bNewCloaking);
		}

		super.SetCloaked( bNewCloaking );
	}
}

/** 
 * bIsCloaking replicated state changed
 * Network: Local and Remote Clients
 */
simulated function ClientCloakingStateUpdated()
{
	if( bIsCloaking )
	{
		ClearBloodDecals();
	}
	
	SetGameplayMICParams();
	Mesh.SetPerObjectShadows( !bIsCloaking );
}

/** Handle cloaking materials */
simulated function SetGameplayMICParams()
{
	local bool bIsSpotted;

	super.SetGameplayMICParams();

	// Cannot cloak after stalker has been gored
	if ( !bIsGoreMesh && WorldInfo.NetMode != NM_DedicatedServer )
	{
		// visible by local player or team (must go after ServerCallOutCloaking)
		bIsSpotted = (bIsCloakingSpottedByLP || bIsCloakingSpottedByTeam);

		if ( bIsSpotted && bIsCloaking )
		{
			BodyMIC.SetParent(SpottedMaterial);
		}
		else if( BodyMIC.Parent == SpottedMaterial )
		{
			BodyMIC.SetParent(Mesh.SkeletalMesh.Materials[0]);
			PlayStealthSoundLoop();
		}
	}
}

/** Called when SwitchToGoreLOD is successful */
simulated event NotifyGoreMeshActive()
{
	super.NotifyGoreMeshActive();

	`DialogManager.PlaySpotCloakDialog( self, false );

	PlayStealthSoundLoopEnd();

	// Restore to uncloaked values
	bIsCloaking = false;
	bIsCloakingSpottedByLP = false;
	bIsCloakingSpottedByTeam = false;

	// Set to our solid gore mat (only AI-controlled)
	if( PlayerReplicationInfo == none && Mesh.SkeletalMesh.Materials.Length > 2 )
	{
		BodyMIC.SetParent( Mesh.SkeletalMesh.Materials[2] );	
	}
}

simulated function PlayStealthSoundLoop()
{
	PlaySoundBase( CloakedLoop, true );
}

simulated function PlayStealthSoundLoopEnd()
{
	PlaySoundBase( CloakedLoopEnd, true );
}

/** Overridden to support transparency scalar */
simulated event Tick( float DeltaTime )
{
	local float MinCloakPct;

	super.Tick( DeltaTime );

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( ViewerPlayer == none )
		{
			ViewerPlayer = KFPlayerController( WorldInfo.GetALocalPlayerController() );
		}

		MinCloakPct = GetMinCloakPct();

		if( !bIsCloaking )
		{
			if( CloakPercent < 1.0f )
			{
				CloakPercent = fMin( CloakPercent + DeltaTime*DeCloakSpeed, 1.0f );
				BodyMIC.SetScalarParameterValue( 'Transparency', CloakPercent );
			}
		}
		else if( CloakPercent > MinCloakPct )
		{
			CloakPercent = fMax( CloakPercent - DeltaTime*CloakSpeed, MinCloakPct );
			BodyMIC.SetScalarParameterValue( 'Transparency', CloakPercent );
		}
	}
}


/** Gets the minimum cloaked amount based on the viewer */
simulated protected function float GetMinCloakPct()
{
	if( ViewerPlayer != none && (ViewerPlayer.GetTeamNum() == GetTeamNum() || ViewerPlayer.PlayerReplicationInfo.bOnlySpectator) )
	{
		return 0.5f;
	}

	return 0.f;
}

/*********************************************************************************************
`* Perk related
********************************************************************************************* */

/**
 * Called every 0.5f seconds to check if a cloaked zed has been spotted
 * Network: All but dedicated server
 */
simulated event UpdateSpottedStatus()
{
	local bool bOldSpottedByLP;
	local KFPlayerController LocalPC;
	local KFPerk LocalPerk;
	local float DistanceSq, Range;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	bOldSpottedByLP = bIsCloakingSpottedByLP;
	bIsCloakingSpottedByLP = false;

    if( !IsHumanControlled() || bIsSprinting )
    {
		LocalPC = KFPlayerController(GetALocalPlayerController());
		if( LocalPC != none )
		{
			LocalPerk = LocalPC.GetPerk();
		}

		if ( LocalPC != none && LocalPC.Pawn != None && LocalPC.Pawn.IsAliveAndWell() && LocalPerk != none &&
			 LocalPerk.bCanSeeCloakedZeds && `TimeSince( LastRenderTime ) < 1.f )
		{
			DistanceSq = VSizeSq(LocalPC.Pawn.Location - Location);
			Range = LocalPerk.GetCloakDetectionRange();

			if ( DistanceSq < Square(Range) )
			{
				bIsCloakingSpottedByLP = true;
				if ( LocalPerk.IsCallOutActive() )
				{
					// Beware of server spam.  This RPC is marked unreliable and UpdateSpottedStatus has it's own cooldown timer
					LocalPC.ServerCallOutPawnCloaking(self);
				}
			}
		}
	}
	
	// If spotted by team already, there is no point in trying to update the MIC here
	if ( !bIsCloakingSpottedByTeam )
	{
		if ( bIsCloakingSpottedByLP != bOldSpottedByLP )
		{
			SetGameplayMICParams();
		}
	}
}

/** notification from player with CallOut ability */
function CallOutCloaking( optional KFPlayerController CallOutController )
{
	bIsCloakingSpottedByTeam = true;
	LastStoredCC = CallOutController;
	SetGameplayMICParams();
	SetTimer(2.f, false, nameof(CallOutCloakingExpired));
}

/** Call-out cloaking ability has timed out */
function CallOutCloakingExpired()
{
	bIsCloakingSpottedByTeam = false;
	LastStoredCC = none;
	SetGameplayMICParams();
}

/** Spawns and attaches the rally effect to a specified bone */
simulated function SpawnRallyEffect( ParticleSystem RallyEffect, name EffectBoneName, vector EffectOffset )
{
	local PlayerController PC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		PC = WorldInfo.GetALocalPlayerController();

		// Don't spawn rally effect if cloaking but not spotted
		if( bIsCloaking
			&& !bIsCloakingSpottedByLP
			&& !bIsCloakingSpottedByTeam
			&& PC.GetTeamNum() < 255
			&& PC.Pawn != none
			&& PC.Pawn.IsAliveAndWell() )
		{
			return;
		}
	}

	super.SpawnRallyEffect( RallyEffect, EffectBoneName, EffectOffset );
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	// Uncloak on death
	SetCloaked(false);
	bCanCloak = false;

	Super.PlayDying(DamageType, HitLoc);
}

/** Disable cloaking when crippled/headless */
function CauseHeadTrauma( float BleedOutTime=5.f )
{
	Super.CauseHeadTrauma( BleedOutTime );

	if( bIsHeadless && IsAliveAndWell() && !IsDoingSpecialMove() )
	{
		SetCloaked( false );
	}
}

/** Interrupt certain moves when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if( Role == ROLE_Authority && IsAliveAndWell() )
	{
		if ( Id == SAF_EMPPanic || Id == SAF_EMPDisrupt )
		{
			SetCloaked( !bEMPPanicked && !bEMPDisrupted );
		}
	}
}

function PlayHit( float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo )
{
 	super.PlayHit( Damage, InstigatedBy, HitLocation, damageType, Momentum, HitInfo );

	SetCloaked( false );

	// SetTimer times are max values pulled from KFPawnAnimInfo::PlayHitReactionAnim

	// if last hit caused call to DoPauseAI
	if( HitFxInfo.DamageType != none && HitFxInfo.DamageType.default.MeleeHitPower > 0 )
	{
		SetTimer( 1.f, false, nameof(ReCloakTimer) );
	}
	else // light hit or DOT
	{
		SetTimer( 0.35f, false, nameof(ReCloakTimer) );
	}
}

simulated function PlayHeadAsplode()
{
	if( bIsCloaking )
	{
		SetCloaked( false );
	}

	bCanCloak = false;

	super.PlayHeadAsplode();
}

simulated function ReCloakTimer()
{
	SetCloaked( true );
}

static function bool IsStalkerPawn()
{
	return true;
}

/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 66;//KILL_Female
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	if( bIsCloaking && MaxHeadChunkGoreWhileAlive == 0 )
    {
        return 135;//SPOTZ_Cloaked
    }

	return 125;//SPOTZ_Generic
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 40;//TRAD_AdviceStalker
}

DefaultProperties
{
	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling for bAlwaysFullAnimWeight bones
		bUpdateKinematicBonesFromAnimation=true
		// Shadows off at spawn since she spawns cloaked
		bAllowPerObjectShadows=false
	End Object

	// ---------------------------------------------
	// Stats
	XPValues(0)=8
	XPValues(1)=10
	XPValues(2)=10
	XPValues(3)=10

	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Stalker_ARCH.ZED_Stalker_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Stalker_ANIM.Stalker_AnimGroup'
	SpottedMaterial=MaterialInstanceConstant'ZED_Stalker_MAT.ZED_Stalker_Visible_MAT'

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Evade)				=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)			=class'KFSM_Evade_Fear'
		SpecialMoveClasses(SM_Emerge)				=class'KFSM_Emerge'
	End Object

	InstantIncaps(IAF_Stun)=(Head=43,Torso=45,Leg=60,Arm=60,LowHealthBonus=10,Cooldown=3.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=75,Leg=75,Arm=75,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=43,Torso=46,Arm=46,LowHealthBonus=10,Cooldown=2.0)
	InstantIncaps(IAF_LegStumble)=(Leg=46,LowHealthBonus=10,Cooldown=1.0)
	InstantIncaps(IAF_GunHit)=(Head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.0)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=6.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=3.0,Duration=5.0,Cooldown=20.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=2.0,Duration=2.5,Cooldown=5.0,DissipationRate=0.05)

	ParryResistance=1

	// ---------------------------------------------
	// Gameplay
	bCanGrabAttack=false
	bCanMeleeAttack=true

	Begin Object Name=MeleeHelper_0
		BaseDamage=9.f
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	Health=75
	DoshValue=15
	Mass=50.f

	bIsStalkerClass=true

	// Penetration
    PenetrationResistance=0.5

	// ---------------------------------------------
	// Resistance & Vulnerability
	ResistantDamageTypes.Add((DamageType=class'KFDT_Toxic'))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Microwave'))

    // ---------------------------------------------
	// Movement / Physics
	GroundSpeed=400.f
	SprintSpeed=500.f
	PhysRagdollImpulseScale=0.9f
	KnockdownImpulseScale=0.9f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedStalker'
	DamageRecoveryTimeHeavy=0.2f
	DamageRecoveryTimeMedium=1.0f

	RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)

	// cloaking
	bIsCloaking=true
	bCanCloak=true
	bCloakOnMeleeEnd=true
	CloakPercent=1.0f
	DeCloakSpeed=4.5f
	CloakSpeed=4.0f
	//CloakDuration=1.2

	// audio
	CloakedLoop=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP'
	CloakedLoopEnd=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP_Stop'

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Stalker';
`endif
}
