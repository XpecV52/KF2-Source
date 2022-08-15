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

var localized string BossName;
var localized array<string> BossCaptionStrings;

/** Called from Possessed event when this controller has taken control of a Pawn */
function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	PlayBossMusic();
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
	local KFPlayerController KFPC;

    super.PlayDying( DamageType, HitLoc );

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if( KFGRI != none && !KFGRI.IsFinalWave() )
	{
		return;
	}

	foreach LocalPlayerControllers(class'KFPlayerController', KFPC)
	{
		KFPC.SetBossCamera( self );
	}
}

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

	return result;
}

/** Play music for this boss (overridden for each boss) */
function PlayBossMusic();

// bosses cannot be decapitated
function CauseHeadTrauma(float BleedOutTime=5.f);
simulated function PlayHeadAsplode();

function PlayMonologue( byte MonologueType )
{
	if( Role == ROLE_Authority && KFGameInfo(WorldInfo.Game) != none && KFGameInfo(WorldInfo.Game).DialogManager != none) KFGameInfo(WorldInfo.Game).DialogManager.PlayBossMonologue( self, MonologueType );
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

defaultproperties
{
   BossName="Boss"
   BossCaptionStrings(0)="Boss caption 1"
   BossCaptionStrings(1)="Boss caption 2"
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
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      StackingAffl(0)=(Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=10.000000,Cooldown=5.000000)
      StackingAffl(2)=(Threshhold=3.000000,Cooldown=5.000000)
      StackingAffl(3)=(Threshhold=3.000000,Cooldown=5.000000)
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGame.Default__KFPawn_MonsterBoss:Afflictions_0'
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
      SpecialMoveClasses(10)=None
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(13)=None
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      SpecialMoveClasses(21)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGame.Default__KFPawn_MonsterBoss:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
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
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGame.Default__KFPawn_Monster:DialogAkSoundComponent'
      BoneName="head"
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
      bAllowPerObjectShadows=True
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
   bAlwaysRelevant=True
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_MonsterBoss"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
