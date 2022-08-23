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
/** Threshold of health below which the Scrake will start rage charging (determined by difficulty) */
var(RageCharge) float       RageHealthThreshold;

// handle chainsaw idle here instead of through an anim-notify so that we can actually turn it off
simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		ChainsawIdleAkComponent.PlayEvent( PlayChainsawIdleAkEvent, true, true );
		CreateExhaustFx();
	}
}

/** Overridden to support loading the alternate body mic */
simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
	super.SetCharacterArch( Info );

    // Set our secondary material, attach our healing syringes
	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		CharacterMICs[1] = Mesh.CreateAndSetMaterialInstanceConstant( 2 );
	}
}

function PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFAIController_Monster KFAICM;

	super.PossessedBy( C, bVehicleTransition );

	if( !IsHumanControlled() )
	{
		KFAICM = KFAIController_Monster( C );

		if( KFAICM != none )
		{
	        // Determine what rage health threshold to use
	        if( KFAICM.Skill == class'KFGameDifficultyInfo'.static.GetDifficultyValue(0) ) // Normal
	        {
	            RageHealthThreshold = RageHealthThresholdNormal;
	        }
	        else if( KFAICM.Skill <= class'KFGameDifficultyInfo'.static.GetDifficultyValue(1) ) // Hard
	        {
	            RageHealthThreshold = RageHealthThresholdHard;
	        }
	        else if( KFAICM.Skill <= class'KFGameDifficultyInfo'.static.GetDifficultyValue(2) ) // Suicidal
	        {
	            RageHealthThreshold = RageHealthThresholdSuicidal;
	        }
	        else // Hell on Earth
	        {
	            RageHealthThreshold = RageHealthThresholdHellOnEarth;
	        }
	    }
	}
	else
	{
		if( WorldInfo.Game.GameDifficulty == 0 )
		{
            RageHealthThreshold = RageHealthThresholdNormal;
		}
		else if( WorldInfo.Game.GameDifficulty == 1 )
		{
            RageHealthThreshold = RageHealthThresholdHard;
		}
		else if( WorldInfo.Game.GameDifficulty == 2 )
		{
            RageHealthThreshold = RageHealthThresholdSuicidal;
		}
		else
		{
            RageHealthThreshold = RageHealthThresholdHellOnEarth;
		}
	}
}

simulated function CreateExhaustFx()
{
	local vector Loc;
	local rotator Rot;

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

event TakeDamage(int Damage, Controller InstigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	super.TakeDamage( Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser );

	if( bCanRage && !bPlayedDeath && (GetHealthPercentage() < RageHealthThreshold || GetHeadHealthPercent() < RageHealthThreshold) )
	{
		SetEnraged( true );
	}
}

/** Enrage this Scrake! */
simulated function SetEnraged( bool bNewEnraged )
{
	if( Role == ROLE_Authority && bNewEnraged == bIsEnraged )
	{
		return;
	}

	if ( Role == ROLE_Authority )
	{
		bIsEnraged = bNewEnraged;

		// End blocking on rage
		if( IsDoingSpecialMove(SM_Block) )
		{
			EndSpecialMove();
		}

		// Sprint right away if we're AI
		if( !IsHumanControlled() )
		{
			SetSprinting( bNewEnraged );
		}
	}
}

/** Returns TRUE if this zed can block attacks */
function bool CanBlock()
{
	return !bIsEnraged && super.CanBlock();
}

/** Called on server when pawn should have been crippled (e.g. Headless) */
function CauseHeadTrauma( float BleedOutTime=5.f )
{
	super.CauseHeadTrauma( BleedOutTime );

	// End rage when decapped
	SetEnraged( false );
}

/** Overridden to support secondary body material */
simulated event NotifyGoreMeshActive()
{
	super.NotifyGoreMeshActive();

    // Set our secondary MIC
	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		CharacterMICs[1] = Mesh.CreateAndSetMaterialInstanceConstant( 2 );
	}
}

simulated function TerminateEffectsOnDeath()
{
	CleanupChainsaw();
	super.TerminateEffectsOnDeath();
}

simulated function CleanupChainsaw()
{
	local MaterialInstanceConstant ChainsawBladeMIC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
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
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="ChainsawAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   ChainsawIdleAkComponent=ChainsawAkComponent0
   PlayChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake_2.ZED_Scrake_SFX_Chainsaw_Idle_LP'
   StopChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake_2.ZED_Scrake_SFX_Chainsaw_Idle_LP_Stop'
   ExhaustSocketName="FX_Exhaust"
   ExhaustTemplate=ParticleSystem'ZED_Scrake_EMIT.FX_Scrake_Smoke_Idle_01'
   RageHealthThresholdNormal=0.500000
   RageHealthThresholdHard=0.750000
   RageHealthThresholdSuicidal=0.750000
   RageHealthThresholdHellOnEarth=0.900000
   bLargeZed=True
   bCanRage=True
   MonsterArchPath="ZED_ARCH.ZED_Scrake_Archetype"
   HeadlessBleedOutTime=6.000000
   ParryResistance=4
   MinSpawnSquadSizeType=EST_Large
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=30.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_Scrake'
      MomentumTransfer=45000.000000
      MaxHitRange=200.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedScrake:MeleeHelper_0'
   DoshValue=75
   XPValues(0)=34.000000
   XPValues(1)=45.000000
   XPValues(2)=60.000000
   XPValues(3)=69.000000
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun')
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle')
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.900000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.800000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.300000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave')
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.750000))
   DamageTypeModifiers(11)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_RPG7Impact',DamageScale=(4.000000))
   DamageTypeModifiers(12)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   ZedBumpDamageScale=0.100000
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Scrake'
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   OnDeathAchievementID=132
   PawnAnimInfo=KFPawnAnimInfo'ZED_Scrake_ANIM.Scrake_AnimGroup'
   LocalizationKey="KFPawn_ZedScrake"
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
   HitZones(8)=(GoreHealth=20,DmgScale=0.200000,SkinID=2)
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   HitZones(18)=(ZoneName="rchainsaw",BoneName="RightForearm",GoreHealth=20,DmgScale=0.200000,Limb=BP_RightArm,SkinID=2)
   HitZones(19)=(ZoneName="rchainsawblade",BoneName="RightForearm",GoreHealth=20,DmgScale=0.200000,Limb=BP_RightArm,SkinID=2)
   PenetrationResistance=4.000000
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
      AfflictionClasses(0)=Class'KFGame.KFAffliction_EMPDisrupt'
      AfflictionClasses(1)=()
      AfflictionClasses(2)=()
      AfflictionClasses(3)=()
      AfflictionClasses(4)=()
      AfflictionClasses(5)=()
      AfflictionClasses(6)=()
      AfflictionClasses(7)=()
      AfflictionClasses(8)=()
      AfflictionClasses(9)=()
      AfflictionClasses(10)=()
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedScrake:Afflictions_0'
   IncapSettings(0)=(Duration=2.200000,Cooldown=10.000000,Vulnerability=(0.980000))
   IncapSettings(1)=(Duration=3.500000,Cooldown=7.000000,Vulnerability=(0.800000))
   IncapSettings(2)=(Cooldown=1.350000,Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=1.700000,Vulnerability=(0.200000))
   IncapSettings(4)=(Cooldown=3.500000,Vulnerability=(0.300000))
   IncapSettings(5)=(Duration=1.550000,Cooldown=10.000000,Vulnerability=(0.500000,1.000000,0.500000,0.500000,0.500000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.150000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=5.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000))
   IncapSettings(8)=(Cooldown=10.000000,Vulnerability=(0.400000,0.400000,0.500000,0.400000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=6.000000,Vulnerability=(0.980000))
   IncapSettings(10)=(Duration=2.500000,Cooldown=10.000000,Vulnerability=(1.000000))
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
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=Class'KFGame.KFSM_Block'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedScrake:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedScrake:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.850000
   DamageRecoveryTimeMedium=0.750000
   Mass=130.000000
   GroundSpeed=170.000000
   Health=1100
   ControllerClass=Class'kfgamecontent.KFAIController_ZedScrake'
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
