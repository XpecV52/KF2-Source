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
			if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog( self, bNewCloaking );
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

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlaySpotCloakDialog( self, false );

	PlayStealthSoundLoopEnd();

	// Restore to uncloaked values
	bIsCloaking = false;
	bIsCloakingSpottedByLP = false;
	bIsCloakingSpottedByTeam = false;

	// Set to our solid gore mat (only AI-controlled)
	if( PlayerReplicationInfo == none )
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
			 LocalPerk.bCanSeeCloakedZeds && (WorldInfo.TimeSeconds - LastRenderTime) < 1.f )
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

defaultproperties
{
   SpottedMaterial=MaterialInstanceConstant'ZED_Stalker_MAT.ZED_Stalker_Visible_MAT'
   CloakedLoop=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP'
   CloakedLoopEnd=AkEvent'WW_ZED_Stalker.ZED_Stalker_SFX_Stealth_LP_Stop'
   CloakPercent=1.000000
   CloakSpeed=4.000000
   DeCloakSpeed=4.500000
   bCloakOnMeleeEnd=True
   bIsStalkerClass=True
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Stalker_ARCH.ZED_Stalker_Archetype'
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=9.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedStalker:MeleeHelper_0'
   DoshValue=15
   XPValues(0)=8.000000
   XPValues(1)=10.000000
   XPValues(2)=10.000000
   XPValues(3)=10.000000
   ResistantDamageTypes(16)=(DamageType=Class'KFGame.KFDT_Toxic')
   ResistantDamageTypes(17)=(DamageType=Class'kfgamecontent.KFDT_Microwave')
   PawnAnimInfo=KFPawnAnimInfo'ZED_Stalker_ANIM.Stalker_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bCanCloak=True
   bIsCloaking=True
   PenetrationResistance=0.500000
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedStalker:Afflictions_0'
   InstantIncaps(0)=(head=50,Torso=75,Leg=75,Arm=75,LowHealthBonus=10,Cooldown=9.000000)
   InstantIncaps(1)=(head=43,Torso=45,Leg=60,Arm=60,LowHealthBonus=10,Cooldown=3.000000)
   InstantIncaps(2)=(head=43,Torso=46,Arm=46,LowHealthBonus=10)
   InstantIncaps(3)=(Leg=46,LowHealthBonus=10,Cooldown=1.000000)
   InstantIncaps(4)=(head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.350000)
   InstantIncaps(5)=(head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.000000)
   StackingIncaps(1)=(Threshhold=2.000000,Duration=2.500000,DissipationRate=0.050000)
   StackingIncaps(2)=(Threshhold=6.000000,Cooldown=20.500000)
   StackingIncaps(3)=(Cooldown=20.500000)
   StackingIncaps(4)=()
   StackingIncaps(5)=()
   PhysRagdollImpulseScale=0.900000
   KnockdownImpulseScale=0.900000
   SprintSpeed=500.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_GrappleAttack'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(10)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Emerge'
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(29)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedStalker:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_Monster:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedStalker:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   DamageRecoveryTimeHeavy=0.200000
   Mass=50.000000
   GroundSpeed=400.000000
   Health=75
   ControllerClass=Class'kfgamecontent.KFAIController_ZedStalker'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bUseAsOccluder=False
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPawn_Monster:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPawn_Monster:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)
   Name="Default__KFPawn_ZedStalker"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
