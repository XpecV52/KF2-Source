//=============================================================================
// KFPawn_ZedGorefast
//=============================================================================
// Gorefast
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedGorefast extends KFPawn_Monster;

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 38;//TRAD_AdviceGorefast
}

defaultproperties
{
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Gorefast_ARCH.ZED_Gorefast_Archetype'
   ParryResistance=2
   MinSpawnSquadSizeType=EST_Medium
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=10.000000
      MyDamageType=Class'KFGameContent.KFDT_Slashing_Gorefast'
      MaxHitRange=192.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedGorefast:MeleeHelper_0'
   DoshValue=12
   XPValues(0)=11.000000
   XPValues(1)=14.000000
   XPValues(2)=14.000000
   XPValues(3)=14.000000
   PawnAnimInfo=KFPawnAnimInfo'ZED_Gorefast_Anim.Gorefast_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
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
   PenetrationResistance=1.500000
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      InstantAffl(0)=(head=50,Torso=75,Leg=56,Arm=75,LowHealthBonus=10,Cooldown=9.000000)
      InstantAffl(1)=(head=43,Torso=46,Leg=46,Arm=46,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(2)=(head=43,Torso=46,Arm=49,LowHealthBonus=10)
      InstantAffl(3)=(Leg=46,LowHealthBonus=10)
      InstantAffl(4)=(head=20,Torso=27,Leg=25,Arm=25,LowHealthBonus=10,Cooldown=0.300000)
      InstantAffl(5)=(head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.500000)
      StackingAffl(0)=(Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=2.000000,Duration=2.500000,Cooldown=6.000000)
      StackingAffl(2)=(Threshhold=2.000000,Duration=2.000000,Cooldown=12.500000)
      StackingAffl(3)=(Threshhold=2.000000,Duration=2.000000,Cooldown=12.500000)
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedGorefast:Afflictions_0'
   KnockdownImpulseScale=1.000000
   SprintSpeed=450.000000
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
      SpecialMoveClasses(14)=Class'KFGameContent.KFSM_Evade_Fear'
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedGorefast:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedGorefast:WeaponAmbientEchoHandler_0'
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
   GroundSpeed=240.000000
   MaxFallSpeed=6000.000000
   Health=200
   ControllerClass=Class'KFGameContent.KFAIController_ZedGorefast'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
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
      CollisionRadius=48.000000
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
   Name="Default__KFPawn_ZedGorefast"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
