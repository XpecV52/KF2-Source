//=============================================================================
// KFPawn_ZedHuskFriendlyTest
//=============================================================================
// Husk Pawn Class that will target zeds not players - for testing
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedHuskFriendlyTest extends KFPawn_ZedHusk;

/** Can this pawn be grabbed by Zed performing grab special move (clots & Hans's energy drain) */
function bool CanBeGrabbed(KFPawn GrabbingPawn, optional bool bIgnoreFalling, optional bool bAllowSameTeamGrab)
{
    return false;
}

/** Make sure damage to myself is enough to kill me when it's my suicide attack */
function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	Super.AdjustDamage( InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser );

    // Don't let me damage myself
	if( MyKFAIC != none && !MyKFAIC.IsSuicidal() && InstigatedBy == MyKFAIC )
	{
	   InDamage = 0;
	}
}

defaultproperties
{
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHuskFriendlyTest:ExploTemplate0'
   Begin Object Class=PointLightComponent Name=ChestLightComponent0 Archetype=PointLightComponent'kfgamecontent.Default__KFPawn_ZedHusk:ChestLightComponent0'
      Radius=160.000000
      Brightness=0.500000
      LightColor=(B=40,G=155,R=250,A=255)
      bEnabled=False
      CastShadows=False
      bCastPerObjectShadows=False
      LightingChannels=(Outdoor=True)
      MaxBrightness=0.500000
      MinBrightness=0.400000
      AnimationType=1
      AnimationFrequency=2.000000
      Name="ChestLightComponent0"
      ObjectArchetype=PointLightComponent'kfgamecontent.Default__KFPawn_ZedHusk:ChestLightComponent0'
   End Object
   ChestLightComponent=ChestLightComponent0
   CharacterMonsterArch=KFCharacterInfo_Monster'zed_husk_arch.ZED_Husk_Archetype'
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk:MeleeHelper_0'
      BaseDamage=15.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHuskFriendlyTest:MeleeHelper_0'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   Begin Object Class=AkComponent Name=HeadshotAkComponent0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:HeadshotAkComponent0'
      Name="HeadshotAkComponent0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:HeadshotAkComponent0'
   End Object
   HeadShotAkComponent=HeadshotAkComponent0
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHusk:Afflictions_0'
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
      AfflictionClasses(11)=()
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHusk:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedHuskFriendlyTest:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
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
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_Husk_FireBallAttack'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_Husk_FlameThrowerAttack'
      SpecialMoveClasses(24)=Class'kfgamecontent.KFSM_Husk_Suicide'
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
      SpecialMoveClasses(35)=None
      SpecialMoveClasses(36)=None
      SpecialMoveClasses(37)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHuskFriendlyTest:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHuskFriendlyTest:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedHusk:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Health=5000
   ControllerClass=Class'kfgamecontent.KFAIController_HuskFriendlyTest'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:KFPawnSkeletalMeshComponent'
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedHusk:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedHusk:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedHusk:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedHusk:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedHusk:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedHusk:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   Components(8)=SprintAkComponent0
   Components(9)=HeadshotAkComponent0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedHuskFriendlyTest"
   ObjectArchetype=KFPawn_ZedHusk'kfgamecontent.Default__KFPawn_ZedHusk'
}
