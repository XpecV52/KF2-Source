//=============================================================================
// KFPawn_ZedClot_AlphaKing
//=============================================================================
// Alpha clot King
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedClot_AlphaKing extends KFPawn_ZedClot_Alpha;

/** Self-rally damage modifiers */
var protected float SelfRallyDealtDamageModifier;
var protected float SelfRallyTakenDamageModifier;

/** If TRUE, this rally was applied to ourselves */
var protected bool bWasSelfRally;

/** Called immediately after gameplay begins */
simulated event PostBeginPlay()
{
	local class<KFDifficulty_ClotAlphaKing> MyDifficultySettings;
	local KFGameReplicationInfo KFGRI;

	super.PostBeginPlay();

	MyDifficultySettings = class<KFDifficulty_ClotAlphaKing>( DifficultySettings );
	if( MyDifficultySettings != none )
	{
		// Set our (Network: ALL) difficulty-based settings
		KFGRI = KFGameReplicationInfo( WorldInfo.GRI );
		if( KFGRI != none )
		{
			SelfRallyDealtDamageModifier = MyDifficultySettings.default.RallyTriggerSettings[KFGRI.GameDifficulty].SelfDealtDamageModifier;
			SelfRallyTakenDamageModifier = MyDifficultySettings.default.RallyTriggerSettings[KFGRI.GameDifficulty].SelfTakenDamageModifier;
		}
	}
}

event PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFAIController_ZedClot_AlphaKing AlphaController;

	super.PossessedBy( C, bVehicleTransition );

	// Initialize our rally settings
	AlphaController = KFAIController_ZedClot_AlphaKing( MyKFAIC );
	if( AlphaController != none )
	{
		AlphaController.InitRallySettings();
	}
}


/** Applies the rally buff and spawns a rally effect */
simulated function bool Rally(
							KFPawn 			RallyInstigator,
							ParticleSystem 	RallyEffect,
							name 			EffectBoneName,
							vector			EffectOffset,
							ParticleSystem	AltRallyEffect,
							name 			AltEffectBoneNames[2],
							vector 			AltEffectOffset,
							optional bool	bSkipEffects=false
						)
{
	if( RallyInstigator == self )
	{
		bWasSelfRally = true;
	}
	else
	{
		bWasSelfRally = false;
	}

    return super.Rally(RallyInstigator, RallyEffect, EffectBoneName, EffectOffset, AltRallyEffect, AltEffectBoneNames, AltEffectOffset, bSkipEffects);
}

/** Applies the rally damage boost if applicable */
simulated function int GetRallyBoostDamage( int NewDamage )
{
	if( bWasSelfRally && SelfRallyDealtDamageModifier > 0.f )
	{
		return NewDamage * ( IsTimerActive(nameOf(Timer_EndRallyBoost)) ? SelfRallyDealtDamageModifier : 1.f );
	}
	else
	{
		return super.GetRallyBoostDamage( NewDamage );
	}
}

/** Applies the rally damage reduction if applicable */
simulated function int GetRallyBoostResistance( int NewDamage )
{
	if( bWasSelfRally && SelfRallyTakenDamageModifier > 0.f )
	{
		return NewDamage * ( IsTimerActive(nameOf(Timer_EndRallyBoost)) ? SelfRallyTakenDamageModifier : 1.f );
	}
	else
	{
		return super.GetRallyBoostDamage( NewDamage );
	}
}

defaultproperties
{
   MonsterArchPath="ZED_ARCH.ZED_Clot_AlphaKing_Archetype"
   MinSpawnSquadSizeType=EST_Medium
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Alpha:MeleeHelper_0'
      BaseDamage=6.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=172.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Alpha:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:MeleeHelper_0'
   DifficultySettings=Class'kfgamecontent.KFDifficulty_ClotAlphaKing'
   LocalizationKey="KFPawn_ZedClot_AlphaKing"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=125)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:SpecialMoveHandler_0'
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
      SpecialMoveClasses(10)=Class'kfgamecontent.KFSM_GorgeVictim'
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Emerge'
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'kfgamecontent.KFSM_AlphaRally'
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
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Health=300
   ControllerClass=Class'kfgamecontent.KFAIController_ZedClot_AlphaKing'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedClot_AlphaKing"
   ObjectArchetype=KFPawn_ZedClot_Alpha'kfgamecontent.Default__KFPawn_ZedClot_Alpha'
}
