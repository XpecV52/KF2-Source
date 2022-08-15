//=============================================================================
// KFPawn_ZedScrake
//=============================================================================
// Scrake
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedScrake extends KFPawn_Monster;

var protected AkComponent 	ChainsawIdleAkComponent;
var protected AkEvent		PlayChainsawIdleAkEvent;
var protected AkEvent		StopChainsawIdleAkEvent;

// Chainsaw Particle Fx
var name ExhaustSocketName;
var ParticleSystem ExhaustTemplate;
var ParticleSystemComponent ExhaustPSC;

/** Threshold of health below which the Scrake will start rage charging on normal */
var(RageCharge) float       RageHealthThresholdNormal;
/** Threshold of health below which the Scrake will start rage charging on hard */
var(RageCharge) float       RageHealthThresholdHard;
/** Threshold of health below which the Scrake will start rage charging on suicidal */
var(RageCharge) float       RageHealthThresholdSuicidal;
/** Threshold of health below which the Scrake will start rage charging on hell on earth */
var(RageCharge) float       RageHealthThresholdHellOnEarth;

// handle chainsaw idle here instead of through an anim-notify so that we can actually turn it off
simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	ChainsawIdleAkComponent.PlayEvent( PlayChainsawIdleAkEvent );
	CreateExhaustFx();
}

simulated function CreateExhaustFx()
{
	local vector Loc;
	local rotator Rot;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if ( ExhaustPSC == none && ExhaustTemplate != None )
		{
			if ( Mesh.GetSocketWorldLocationAndRotation(ExhaustSocketName, Loc, Rot) )
			{
				ExhaustPSC = new(self) class'ParticleSystemComponent';
				ExhaustPSC.SetTemplate( ExhaustTemplate );

				Mesh.AttachComponentToSocket(ExhaustPSC, ExhaustSocketName);
			}
		}
	}
}

simulated function PlayDying( class<DamageType> DamageType, vector HitLoc )
{
	CleanupChainsaw();
	super.PlayDying( DamageType, HitLoc );
}

simulated event Destroyed()
{
	CleanupChainsaw();
	super.Destroyed();
}

simulated function CleanupChainsaw()
{
	local MaterialInstanceConstant ChainsawBladeMIC;

	ChainsawBladeMIC = Mesh.CreateAndSetMaterialInstanceConstant(1);
	ChainsawBladeMIC.SetScalarParameterValue('Animation_Scalar', 0.f);

	ChainsawIdleAkComponent.PlayEvent( StopChainsawIdleAkEvent );

	// Murder chainsaw Fx
	if( ExhaustPSC != none )
	{
		ExhaustPSC.DeactivateSystem();
		DetachComponent(ExhaustPSC);
		WorldInfo.MyEmitterPool.OnParticleSystemFinished(ExhaustPSC);
		ExhaustPSC = None;
	}
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 129;//SPOTZ_Scrake
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 42;//TRAD_AdviceScrake
}

/*********************************************************************************************
* Movement
********************************************************************************************* */

function SetSprinting( bool bNewSprintStatus )
{
	if( bEmpDisrupted && bNewSprintStatus && (MyKFAIC == none || !MyKFAIC.bHasDebugCommand) )
	{
		return;
	}

	super.SetSprinting( bNewSprintStatus );
}

/*********************************************************************************************
* Notifications
********************************************************************************************* */

/** Interrupt certain moves when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if( bEMPDisrupted && bIsSprinting && MyKFAIC != none && IsAliveAndWell() )
	{
		SetSprinting( false );
	}
}

defaultproperties
{
   Begin Object Class=AkComponent Name=ChainsawAkComponent0
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="ChainsawAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   ChainsawIdleAkComponent=ChainsawAkComponent0
   PlayChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake.ZED_Scrake_SFX_Chainsaw_Idle_LP'
   StopChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake.ZED_Scrake_SFX_Chainsaw_Idle_LP_Stop'
   ExhaustSocketName="FX_Exhaust"
   ExhaustTemplate=ParticleSystem'ZED_Scrake_EMIT.FX_Scrake_Smoke_Idle_01'
   RageHealthThresholdNormal=0.500000
   RageHealthThresholdHard=0.750000
   RageHealthThresholdSuicidal=0.750000
   RageHealthThresholdHellOnEarth=0.900000
   bLargeZed=True
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Scrake_ARCH.ZED_Scrake_Archetype'
   HeadlessBleedOutTime=6.000000
   ParryResistance=4
   MinSpawnSquadSizeType=EST_Large
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=30.000000
      MaxHitRange=200.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedScrake:MeleeHelper_0'
   DoshValue=75
   XPValues(0)=34.000000
   XPValues(1)=45.000000
   XPValues(2)=60.000000
   XPValues(3)=69.000000
   VulnerableDamageTypes(0)=(DamageType=Class'KFGameContent.KFDT_Microwave')
   ResistantDamageTypes(0)=(DamageType=Class'KFGame.KFDT_Slashing')
   ResistantDamageTypes(1)=(DamageType=Class'KFGame.KFDT_Explosive')
   ZedBumpDamageScale=0.100000
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   PawnAnimInfo=KFPawnAnimInfo'ZED_Scrake_ANIM.Scrake_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=600)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=(GoreHealth=20,DmgScale=0.500000,SkinID=2)
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   PenetrationResistance=4.000000
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      InstantAffl(0)=(head=55,Torso=110,Leg=110,Arm=140,LowHealthBonus=10,Cooldown=17.000000)
      InstantAffl(1)=(head=53,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(2)=(head=53,Torso=53,Arm=60,LowHealthBonus=10,Cooldown=8.000000)
      InstantAffl(3)=(Leg=54,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(4)=(head=29,Torso=40,Leg=40,Arm=40,LowHealthBonus=10,Cooldown=4.000000)
      InstantAffl(5)=(head=134,Torso=134,Leg=134,Arm=134,LowHealthBonus=10,Cooldown=3.000000)
      StackingAffl(0)=(Threshhold=2.000000,Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=12.000000,Duration=2.000000,Cooldown=5.000000)
      StackingAffl(2)=(Threshhold=5.000000,Duration=1.500000,Cooldown=20.000000)
      StackingAffl(3)=(Threshhold=7.500000,Duration=1.500000,Cooldown=20.000000)
      StackingAffl(4)=(Threshhold=0.000000,Cooldown=5.000000)
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedScrake:Afflictions_0'
   KnockdownImpulseScale=2.000000
   SprintSpeed=600.000000
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
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedScrake:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedScrake:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.200000
   DamageRecoveryTimeMedium=0.090000
   Mass=130.000000
   GroundSpeed=170.000000
   Health=1100
   ControllerClass=Class'KFGameContent.KFAIController_ZedScrake'
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
      CollisionRadius=55.000000
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
   Components(8)=ChainsawAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)
   Name="Default__KFPawn_ZedScrake"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
