//=============================================================================
// KFPawn_ZedClot_Slasher_Versus
//=============================================================================
// Slash Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedClot_Slasher_Versus extends KFPawn_ZedClot_Slasher;

/** Custom third person camera offsets */
var() float	MegaJumpZ;

/** Mega Jump Forward Scale */
var() float	MegaJumpForwardScale;

/** Returns the sprint jump velocity, used in modifying jump mechanics while sprinting */
simulated function vector GetSprintJumpVelocity( vector ViewDirection )
{
	return ViewDirection * MegaJumpZ * GetDirectionalJumpScale();
}

simulated function float GetJumpZ()
{
	return MegaJumpZ;
}

simulated function float GetDirectionalJumpScale()
{
	return MegaJumpForwardScale;
}

defaultproperties
{
   MegaJumpZ=1250.000000
   MegaJumpForwardScale=0.250000
   bVersusZed=True
   bHasExtraSprintJumpVelocity=True
   ThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=50.000000,Z=0.000000),OffsetMid=(X=-145.000000,Y=50.000000,Z=-30.000000),OffsetLow=(X=-220.000000,Y=50.000000,Z=0.000000))
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Slasher:MeleeHelper_0'
      BaseDamage=15.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      PlayerDoorDamageMultiplier=5.000000
      MeleeImpactCamScale=0.200000
      MaxHitRange=172.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Slasher:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Slasher_Versus:MeleeHelper_0'
   DoshValue=20
   XPValues(0)=32.000000
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.800000))
   DamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   DamageTypeModifiers(17)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.400000))
   DamageTypeModifiers(18)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   DamageTypeModifiers(19)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.500000))
   DamageTypeModifiers(20)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.500000))
   DamageTypeModifiers(21)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(22)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.350000))
   DamageTypeModifiers(23)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.350000))
   DamageTypeModifiers(24)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.400000))
   DamageTypeModifiers(25)=(DamageType=Class'KFGame.KFDT_Toxic')
   DamageTypeModifiers(26)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AR15')
   DamageTypeModifiers(27)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_MB500')
   DamageTypeModifiers(28)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rem1858',DamageScale=(0.750000))
   DamageTypeModifiers(29)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Colt1911',DamageScale=(0.650000))
   DamageTypeModifiers(30)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_9mm',DamageScale=(1.600000))
   DamageTypeModifiers(31)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Pistol_Medic',DamageScale=(1.500000))
   DamageTypeModifiers(32)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Winchester',DamageScale=(0.700000))
   DamageTypeModifiers(33)=(DamageType=Class'kfgamecontent.KFDT_Fire_CaulkBurn',DamageScale=(0.900000))
   DamageTypeModifiers(34)=(DamageType=Class'kfgamecontent.KFDT_ExplosiveSubmunition_HX25',DamageScale=(0.600000))
   DamageTypeModifiers(35)=(DamageType=Class'kfgamecontent.KFDT_Slashing_EvisceratorProj',DamageScale=(0.300000))
   DamageTypeModifiers(36)=(DamageType=Class'kfgamecontent.KFDT_Slashing_Eviscerator',DamageScale=(0.300000))
   MoveListGamepadScheme(0)=SM_None
   MoveListGamepadScheme(1)=SM_None
   MoveListGamepadScheme(2)=SM_PlayerZedMove_LMB
   MoveListGamepadScheme(3)=SM_PlayerZedMove_V
   MoveListGamepadScheme(4)=SM_None
   MoveListGamepadScheme(5)=SM_None
   MoveListGamepadScheme(6)=SM_PlayerZedMove_RMB
   SpecialMoveCooldowns(0)=(CoolDownTime=0.250000,SMHandle=SM_PlayerZedMove_LMB,SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Melee',NameLocalizationKey="Light")
   SpecialMoveCooldowns(1)=(CoolDownTime=1.000000,SMHandle=SM_PlayerZedMove_RMB,SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-HeavyMelee',NameLocalizationKey="Heavy")
   SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,bShowOnHud=False)
   SpecialMoveCooldowns(3)=(CoolDownTime=0.200000,SMHandle=SM_PlayerZedMove_V,SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Evade',NameLocalizationKey="Evade")
   SpecialMoveCooldowns(4)=(CoolDownTime=1.000000,SMHandle=SM_Jump,SpecialMoveIcon=Texture2D'ZED_Slasher_UI.ZED-VS_Icons_Slasher-Jump',bShowOnHud=False)
   JumpBumpDamageType=Class'kfgamecontent.KFDT_Bludgeon_ZedJump'
   LocalizationKey="KFPawn_ZedClot_Slasher"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=85,DmgScale=1.001000)
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
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Slasher_Versus:Afflictions_0'
   IncapSettings(0)=(Duration=3.000000,Vulnerability=(1.000000))
   IncapSettings(1)=(Duration=3.000000,Vulnerability=(0.500000))
   IncapSettings(2)=(Cooldown=0.500000,Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=0.750000,Vulnerability=(1.000000))
   IncapSettings(4)=(Cooldown=3.000000,Vulnerability=(0.500000))
   IncapSettings(5)=(Duration=2.000000,Vulnerability=(0.500000,0.500000,0.100000,0.100000,0.100000))
   IncapSettings(6)=(Duration=2.000000)
   IncapSettings(7)=()
   IncapSettings(8)=(Cooldown=3.000000,Vulnerability=(0.500000))
   IncapSettings(9)=(Vulnerability=(1.000000))
   IncapSettings(10)=()
   SprintSpeed=650.000000
   SprintStrafeSpeed=450.000000
   TeammateCollisionRadiusPercent=0.300000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=Class'KFGame.KFSM_Emerge'
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_PlayerSlasher_Melee'
      SpecialMoveClasses(24)=Class'kfgamecontent.KFSM_PlayerSlasher_Melee2'
      SpecialMoveClasses(25)=Class'kfgamecontent.KFSM_PlayerSlasher_Roll'
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(30)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher_Versus:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Slasher_Versus:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   GroundSpeed=500.000000
   Health=150
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:KFPawnSkeletalMeshComponent'
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
      bUseAsOccluder=False
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
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Slasher:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedClot_Slasher_Versus"
   ObjectArchetype=KFPawn_ZedClot_Slasher'kfgamecontent.Default__KFPawn_ZedClot_Slasher'
}
