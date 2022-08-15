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
function bool CanBeGrabbed(KFPawn GrabbingPawn, optional bool bIgnoreFalling)
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

/** AnimNotify which launches the fireball projectile */
function ANIMNOTIFY_BurnTargets()
{
	// Stub to get rid of log spam
}

defaultproperties
{
   ExplosionTemplate=KFGameExplosion'KFGameContent.Default__KFPawn_ZedHuskFriendlyTest:ExploTemplate0'
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHusk:MeleeHelper_0'
      BaseDamage=15.000000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHusk:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'KFGameContent.Default__KFPawn_ZedHuskFriendlyTest:MeleeHelper_0'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHusk:Afflictions_0'
      InstantAffl(0)=(head=50,Torso=80,Leg=80,Arm=80,Special=50,LowHealthBonus=10,Cooldown=10.000000)
      InstantAffl(1)=(head=44,Torso=80,Leg=80,Arm=80,LowHealthBonus=10,Cooldown=3.000000)
      InstantAffl(2)=(head=44,Torso=50,Arm=50,Special=43,LowHealthBonus=10)
      InstantAffl(3)=(Leg=44,LowHealthBonus=10)
      InstantAffl(4)=(head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.350000)
      InstantAffl(5)=(head=110,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=0.500000)
      StackingAffl(0)=(Threshhold=1.500000,Cooldown=5.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=12.000000,Duration=2.000000,Cooldown=5.000000)
      StackingAffl(2)=(Threshhold=3.000000,Duration=4.000000,Cooldown=8.500000)
      StackingAffl(3)=(Threshhold=3.000000,Duration=4.000000,Cooldown=8.500000)
      StackingAffl(4)=(Threshhold=0.000000,Cooldown=5.000000)
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHusk:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'KFGameContent.Default__KFPawn_ZedHuskFriendlyTest:Afflictions_0'
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
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
      SpecialMoveClasses(16)=Class'KFGameContent.KFSM_Husk_FireBallAttack'
      SpecialMoveClasses(17)=Class'KFGameContent.KFSM_Husk_FlameThrowerAttack'
      SpecialMoveClasses(18)=Class'KFGameContent.KFSM_Husk_Suicide'
      SpecialMoveClasses(19)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(20)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'KFGameContent.Default__KFPawn_ZedHuskFriendlyTest:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_1'
      BoneName="Spine1"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_0'
      BoneName="RW_Weapon"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHusk:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'KFGameContent.Default__KFPawn_ZedHuskFriendlyTest:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:FootstepAkSoundComponent'
      BoneName="Root"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:DialogAkSoundComponent'
      BoneName="head"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'KFGameContent.Default__KFPawn_ZedHusk:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   Health=5000
   ControllerClass=Class'KFGameContent.KFAIController_HuskFriendlyTest'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:KFPawnSkeletalMeshComponent'
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
      ObjectArchetype=KFSkeletalMeshComponent'KFGameContent.Default__KFPawn_ZedHusk:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGameContent.Default__KFPawn_ZedHusk:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGameContent.Default__KFPawn_ZedHusk:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGameContent.Default__KFPawn_ZedHusk:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGameContent.Default__KFPawn_ZedHusk:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGameContent.Default__KFPawn_ZedHusk:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGameContent.Default__KFPawn_ZedHusk:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedHuskFriendlyTest"
   ObjectArchetype=KFPawn_ZedHusk'KFGameContent.Default__KFPawn_ZedHusk'
}
