//=============================================================================
// KFPawn_MonsterBoss
//=============================================================================
// A base (abstract) class for the boss character at the end of a wave
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_MonsterBoss extends KFPawn_Monster
	abstract
	native(Pawn);








































































































































































































































































































































































	




	




	




	














	




	














	












































































#linenumber 14

var KFPlayerController KFPC; //used to notify UI

var localized string BossName;
var localized array<string> BossCaptionStrings;

/** Info for minion wave spawning */
struct native BossMinionWaveInfo
{
    /** The minion wave to spawn for Phase 1 healing*/
    var	KFAIWaveInfo				PhaseOneWave;
    /** The minion wave to spawn for Phase 2 healing*/
    var	KFAIWaveInfo				PhaseTwoWave;
    /** The minion wave to spawn for Phase 3 healing*/
    var	KFAIWaveInfo				PhaseThreeWave;
};

/** Waves to summon at each stage by difficulty level*/
var	BossMinionWaveInfo				SummonWaves[4];

/** The base amount of minions to spawn when boss goes into hunt and heal mode */
var             vector2D                 NumMinionsToSpawn;

/** The current phase of the battle we're in */
var repnotify   int 				CurrentBattlePhase;

/** Whether this pawn is in theatric camera mode */
var 			bool 				bUseAnimatedTheatricCamera;

/** The name of the socket to use as a camera base for theatric sequences */
var 			Name 				TheatricCameraSocketName;

/** The relative offset to use for the cinematic camera */
var 			vector 				TheatricCameraAnimOffset;

/** Scalar to apply to attack range when there is only one player remaining in a multiplayer game */
var 			float				LastPlayerAliveAttackRangeScale;

/** Set when the speed increase timer detects that there is only one player left */
var protected 	float 				LastPlayerAliveStartTime;

/** How long after spawn before the boss starts to increase its speed */
var protected const float			TimeUntilSpeedIncrease;

/** How high the speed limit can go */
var protected const float 			SpeedLimitScalar;

/** How much to increase the sprint speed by (per minute) when the speed increase timer elapses */
var protected const	float 			SpeedPctIncreasePerMinute;

/** The final sprint speed after being modified by SetMonsterDefaults() */
var protected 	float 				ActualSprintSpeed;

replication
{
	if( bNetDirty )
		CurrentBattlePhase;
}

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == nameOf(CurrentBattlePhase) )
	{
		OnBattlePhaseChanged();
	}
	else
	{
		Super.ReplicatedEvent( VarName );
	}
}

// Called immediately before gameplay begins.
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();
	OnBattlePhaseChanged();
	KFPC = KFPlayerController(GetALocalPlayerController());
	if( KFPC != none )
	{
		if(KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.BossHealthBar != none)
		{
			KFPC.MyGFxHUD.BossHealthBar.SetBossPawn(self);
		}
	}
}

// Mostly indistinguishable from PreBeginPlay().  Following Pawn conventions only one is 'simulated'
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_Client )
	{
		if(WorldInfo.GRI != none && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ("boss_spawn", None, Class.Name);
	}
}

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	PlayBossMusic();

	// Set a timer to begin increasing this boss's speed after enough time has elapsed
	if( !IsHumanControlled() )
	{
		ActualSprintSpeed = SprintSpeed;
		SetTimer( TimeUntilSpeedIncrease, false, nameOf(Timer_IncreaseSpeed) );
	}
}

/** Gradually increases sprint speed */
function Timer_IncreaseSpeed()
{
	SetTimer( 10.f, false, nameOf(Timer_IncreaseSpeed) );

	if( IsOnePlayerLeftInTeamGame() )
	{
		if( LastPlayerAliveStartTime == 0.f )
		{
			LastPlayerAliveStartTime = WorldInfo.TimeSeconds;
		}

		// Adjust sprint speed but don't let it go below original or higher than 2x
		SprintSpeed = fClamp( ActualSprintSpeed + (((WorldInfo.TimeSeconds - LastPlayerAliveStartTime) / 60.f) 
						* (ActualSprintSpeed * SpeedPctIncreasePerMinute)), ActualSprintSpeed, ActualSprintSpeed * SpeedLimitScalar );
	}
	else
	{
		LastPlayerAliveStartTime = 0.f;
		SprintSpeed = ActualSprintSpeed;
	}
}

/** Returns the number of minions to spawn based on number of players */
function byte GetNumMinionsToSpawn()
{
	return byte( Lerp(NumMinionsToSpawn.X, NumMinionsToSpawn.Y, fMax(WorldInfo.Game.NumPlayers, 1)/float(WorldInfo.Game.MaxPlayers)) );
}

/** sends any notifications to anything that needs to know this pawn has taken damage */
function NotifyTakeHit(Controller InstigatedBy, vector HitLocation, int Damage, class<DamageType> DamageType, vector Momentum, Actor DamageCauser)
{
	Super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum, DamageCauser);

	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossTakeDamageDialog( self );
}


/** Return true if AI can target this pawn */
function bool CanAITargetThisPawn(Controller TargetingController)
{
    if( TargetingController.Pawn.IsSameTeam( self ) )
    {
        // Don't let weaker zeds target a boss!!!
        return false;
    }

    return Super.CanAITargetThisPawn(TargetingController);
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFGameReplicationInfo KFGRI;
    local string ClassName;

    super.PlayDying( DamageType, HitLoc );

	//@HSL_BEGIN - JRO - 5/17/2016 - PS4 Activity Feeds
    ClassName = string(Class.Name);
    ClassName -= '_Versus';
	class'GameEngine'.static.GetOnlineSubsystem().PlayerInterfaceEx.PostActivityFeedBossKill(ClassName, WorldInfo.GetMapName(true));
	//@HSL_END

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return;
	}

	if(KFPC != none)
	{
		KFPC.SetBossCamera( self );
	}
}

/** Called when pawn dies or is destroyed. Overloaded to call OnBattlePhaseChanged. */
simulated function TerminateEffectsOnDeath()
{
	super.TerminateEffectsOnDeath();

	OnBattlePhaseChanged();
}

/** Reapply active gameplay related MIC params (e.g. when switching to the gore mesh) */
simulated function UpdateGameplayMICParams()
{
	super.UpdateGameplayMICParams();
	OnBattlePhaseChanged();
}

/** Returns current battle phase, used by KFPawnAnimInfo */
simulated function int GetCurrentBattlePhase()
{
	return CurrentBattlePhase;
}

/** Called when current battle phase changes */
/* Network: ALL
 */
simulated function OnBattlePhaseChanged()
{
	UpdateBattlePhaseOnLocalPlayerUI();
}

simulated function UpdateBattlePhaseOnLocalPlayerUI()
{
	if( KFPC == none || KFPC.MyGFxHUD == none || KFPC.MyGFxHUD.bossHealthBar == none )
	{
		return;
	}

    KFPC.MyGFxHUD.bossHealthBar.UpdateBossBattlePhase(CurrentBattlePhase);   
}

/** Called from AICommand_MoveToGoal::NotifyHitWall() and AICommand_MoveToGoal::ReachedIntermediateMoveGoal() */
function bool HandleAIDoorBump( KFDoorActor Door )
{
	return TryDestroyDoor( Door );
}

/** Destroy unwelded doors instantly when there are few players remaining */
function bool TryDestroyDoor( KFDoorActor Door )
{
	if( Door != none && !Door.bIsDoorOpen && !Door.bIsDestroyed && Door.WeldIntegrity == 0 && CanObliterateDoors() )
	{
		Door.IncrementHitCount( self );
		Door.DestroyDoor( Controller );
		return true;
	}

	return false;
}

/** If we're a player, process hitwall and destroy doors here if all conditions are met */
event HitWall( vector HitNormal, actor Wall, PrimitiveComponent WallComp )
{
	local KFDoorActor Door;

	if( IsHumanControlled() )
	{
		if( !Wall.bStatic && IsAliveAndWell() )
		{
			Door = KFDoorActor( Wall );
			if( Door != none )
			{
				TryDestroyDoor( Door );
			}
		}
	}

	super.HitWall( HitNormal, Wall, WallComp );
}

/** Determines if this boss can plow through doors */
function bool CanObliterateDoors()
{
	// We only want the kool-aid man effect if we're sprinting
	if( !bIsSprinting )
	{
		return false;
	}

	// Only allow door obliteration if there is one player remaining in a multiplayer game
	return true;//IsOnePlayerLeftInTeamGame();
}

/** Returns the attack range scalar when there is only one player remaining */
function float GetAttackRangeScale()
{
	if( IsOnePlayerLeftInTeamGame() )
	{
		return LastPlayerAliveAttackRangeScale;
	}

	return 1.f;
}

/** Returns true if there is only one player remaining in a multiplayer game */
function bool IsOnePlayerLeftInTeamGame()
{

	if( WorldInfo.Game.NumPlayers > 1 )
	{
		return KFGameInfo(WorldInfo.Game).GetLivingPlayerCount() == 1;
	}

	return false;
}

/** Similar to IsOnePlayerLeftInTeamGame(), but more expensive and can be called on clients */
native function bool LocalIsOnePlayerLeftInTeamGame();

/************************************
 * @name	Ephemeral Stats Tracking
 ************************************/

static function bool IsABoss(){ return true; }

/**
 * This pawn has died.
 */
function bool Died( Controller Killer, class<DamageType> DamageType, vector HitLocation )
{
	local bool result;

	result = super.Died( Killer, DamageType, HitLocation );
	if (result)
	{
		KFGameInfo(WorldInfo.Game).BossDied(Killer);
	}

	ClearTimer( nameOf(Timer_IncreaseSpeed) );

	return result;
}

/** Used by subclasses to determine if the boss icon can be rendered */
function bool ShouldDrawBossIcon()
{
	return false;
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic();

// bosses cannot be decapitated
function CauseHeadTrauma(float BleedOutTime=5.f);
simulated function PlayHeadAsplode();

function PlayMonologue( byte MonologueType )
{
	//`DialogManager.PlayBossMonologue( self, MonologueType );
}

function PlayGrabDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossGrabDialog( self );
}

function PlayHealDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossHealDialog( self );
}

function PlayLeapedDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLeapedDialog( self );
}

function PlayLandedDialog()
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossLandedDialog( self );
}

function PlayGrabbedPlayerDialog( KFPawn_Human Target );

function PlayGrabKilledDialog();

defaultproperties
{
   BossName="Boss"
   BossCaptionStrings(0)="Boss caption 1"
   BossCaptionStrings(1)="Boss caption 2"
   LastPlayerAliveAttackRangeScale=0.750000
   TimeUntilSpeedIncrease=60.000000
   SpeedLimitScalar=1.300000
   SpeedPctIncreasePerMinute=0.200000
   MinSpawnSquadSizeType=EST_Boss
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=6.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGame.Default__KFPawn_MonsterBoss:MeleeHelper_0'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bWeakZedGrab=False
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
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
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
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
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGame.Default__KFPawn_MonsterBoss:WeaponAmbientEchoHandler_0'
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
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
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
   bAlwaysRelevant=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_MonsterBoss"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
