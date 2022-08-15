//=============================================================================
// KFPawn_ZedHansFriendlyTest
//=============================================================================
// Hans Boss Pawn Class that will target zeds not players - for testing
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedHansFriendlyTest extends KFPawn_ZedHans;

/** Can this pawn be grabbed by Zed performing grab special move (clots & Hans's energy drain) */
function bool CanBeGrabbed(KFPawn GrabbingPawn, optional bool bIgnoreFalling)
{
    return false;
}

defaultproperties
{
   ShieldImpactEffects=KFSkinTypeEffects_HansShield'KFGameContent.Default__KFPawn_ZedHansFriendlyTest:ShieldEffects'
   BattlePhases(0)=(bCanFrenzy=True,bCanTossNerveGas=False,bCanTossGrenade=True)
   BattlePhases(1)=(bCanTossNerveGas=False,bCanTossGrenade=False)
   BattlePhases(2)=(bCanBarrageNerveGas=False,bCanTossGrenade=False)
   BattlePhases(3)=(bCanBarrageNerveGas=False,bCanBarrageGrenades=False)
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Hans_ARCH.ZED_Hans_Benchmark_Archetype'
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHans:MeleeHelper_0'
      BaseDamage=75.000000
      MyDamageType=Class'KFGameContent.KFDT_Slashing_Hans'
      MomentumTransfer=40000.000000
      MaxHitRange=275.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHans:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHansFriendlyTest:MeleeHelper_0'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHans:Afflictions_0'
      InstantAffl(0)=(head=65,Torso=150,Leg=150,Special=65,LowHealthBonus=10,Cooldown=40.000000)
      InstantAffl(1)=(head=79,Torso=130,Arm=130,Special=53,LowHealthBonus=10,Cooldown=6.000000)
      InstantAffl(2)=(head=79,Torso=130,Arm=130,Special=53,LowHealthBonus=10,Cooldown=8.000000)
      InstantAffl(3)=(Leg=130,LowHealthBonus=10,Cooldown=8.000000)
      InstantAffl(4)=(head=29,Torso=35,Leg=35,Arm=35,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(5)=(head=29,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=10.000000)
      StackingAffl(0)=(Threshhold=6.000000,Duration=3.000000,Cooldown=30.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=15.000000,Duration=1.200000,Cooldown=15.000000)
      StackingAffl(2)=(Threshhold=5000.000000,Cooldown=5.000000)
      StackingAffl(3)=(Threshhold=40.000000,Duration=3.000000,Cooldown=10.000000)
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHans:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHansFriendlyTest:Afflictions_0'
   DefaultInventory(0)=Class'KFGameContent.KFWeap_AssaultRifle_DualMKb42_HansFriendlyTest'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHans:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGameContent.KFSM_Hans_Grab'
      SpecialMoveClasses(4)=Class'KFGameContent.KFSM_GrappleAttack_Hans'
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
      SpecialMoveClasses(22)=Class'KFGameContent.KFSM_Hans_WeaponSwitch'
      SpecialMoveClasses(23)=Class'KFGameContent.KFSM_Hans_ThrowGrenade'
      SpecialMoveClasses(24)=Class'KFGameContent.KFSM_Hans_GrenadeHalfBarrage'
      SpecialMoveClasses(25)=Class'KFGameContent.KFSM_Hans_GrenadeBarrage'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHans:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHansFriendlyTest:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHans:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHans:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHansFriendlyTest:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHans:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Health=99999
   ControllerClass=Class'KFGameContent.KFAIController_HansFriendlyTest'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:KFPawnSkeletalMeshComponent'
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
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHans:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGameContent.Default__KFPawn_ZedHans:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGameContent.Default__KFPawn_ZedHans:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGameContent.Default__KFPawn_ZedHans:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGameContent.Default__KFPawn_ZedHans:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGameContent.Default__KFPawn_ZedHans:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGameContent.Default__KFPawn_ZedHans:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedHansFriendlyTest"
   ObjectArchetype=KFPawn_ZedHans'KFGameContent.Default__KFPawn_ZedHans'
}
