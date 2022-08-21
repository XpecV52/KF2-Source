//=============================================================================
// KFPawn_ZedFleshPound_Versus
//=============================================================================
// Fleshpound Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedFleshPound_Versus extends KFPawn_ZedFleshpound;

/** Ground speed to use when sprinting and enraged */
var const protected float RageSprintSpeed;

/** Rage bump damage variables */
var const protected int RageBumpDamage;
var const protected float RageBumpRadius;
var const protected float RageBumpMomentum;

function PossessedBy( Controller C, bool bVehicleTransition )
{
	Super.PossessedBy( C, bVehicleTransition );

	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		UpdateGameplayMICParams();
	}
}

/** Disallow sprinting if we've been struck by an EMP */
function SetSprinting(bool bNewSprintStatus)
{
	if( bEmpDisrupted )
	{
		bNewSprintStatus = false;
	}

	super(KFPawn_Monster).SetSprinting( bNewSprintStatus );
}

/** Enrage this FleshPound! */
simulated function SetEnraged( bool bNewEnraged )
{
	super.SetEnraged( bNewEnraged );

	if( bIsEnraged )
	{
		if( !IsTimerActive(nameOf(Timer_RageBump)) )
		{
			SetTimer( 0.25f, true, nameOf(Timer_RageBump) );
		}

		SprintSpeed = RageSprintSpeed;
	}
	else if( IsTimerActive(nameOf(Timer_RageBump)) )
	{
		ClearTimer( nameOf(Timer_RageBump) );

		SprintSpeed = default.SprintSpeed;
	}
}

/** Applies damage and impulse to nearby pawns and objects */
simulated protected function Timer_RageBump()
{
	HurtRadius( RageBumpDamage, RageBumpRadius, RageBumpDamageType, RageBumpMomentum, Location, self, Controller );
}

/** Ends rage mode 3 seconds after melee damage is done */
function NotifyMeleeDamageDealt()
{
	if( !IsTimerActive(nameOf(EndRage)) )
	{
		SetTimer( 3.f, false, nameOf(EndRage) );
	}
}

/** Ends rage mode */
function EndRage()
{
	SetEnraged( false );
}

defaultproperties
{
   RageSprintSpeed=700.000000
   RageBumpDamage=2
   RageBumpRadius=240.000000
   RageBumpMomentum=500.000000
   bVersusZed=True
   ThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=60.000000,Z=60.000000),OffsetMid=(X=-160.000000,Y=50.000000,Z=30.000000),OffsetLow=(X=-220.000000,Y=100.000000,Z=50.000000))
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpound:MeleeHelper_0'
      BaseDamage=30.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Fleshpound'
      MomentumTransfer=55000.000000
      PlayerDoorDamageMultiplier=5.000000
      MeleeImpactCamScale=0.450000
      MaxHitRange=250.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpound:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshPound_Versus:MeleeHelper_0'
   DoshValue=300
   XPValues(0)=105.000000
   DamageTypeModifiers(12)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.750000))
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Explosive_RPG7',DamageScale=(1.500000))
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(1.500000))
   DamageTypeModifiers(15)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   BlockingDamageModifier=0.700000
   MeleeBlockingDamageModifier=0.700000
   SpecialMoveCooldowns(0)=(CoolDownTime=0.750000,SMHandle=SM_PlayerZedAttack1,SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-LightAttack',NameLocalizationKey="Light",GBA_Name="GBA_Fire")
   SpecialMoveCooldowns(1)=(CoolDownTime=1.500000,SMHandle=SM_PlayerZedAttack2,SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-HeavyAttack',NameLocalizationKey="Heavy",GBA_Name="GBA_IronsightsToggle",ALT_GBA_NAME="GBA_IronsightsHold")
   SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,GBA_Name="GBA_Reload",bShowOnHud=False)
   SpecialMoveCooldowns(3)=(CoolDownTime=10.500000,SMHandle=SM_PlayerZedSpecial1,SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-Rage',NameLocalizationKey="Rage",GBA_Name="GBA_TertiaryFire")
   SpecialMoveCooldowns(4)=(CoolDownTime=0.500000,SMHandle=SM_PlayerZedSpecial2,SpecialMoveIcon=Texture2D'ZED_Shared_UI.ZED-VS_Icons_Generic-Block',NameLocalizationKey="Block",GBA_Name="GBA_SwitchFireMode")
   SpecialMoveCooldowns(5)=(CoolDownTime=1.250000,SMHandle=SM_Jump,SpecialMoveIcon=Texture2D'ZED_Fleshpound_UI.ZED-VS_Icons_Fleshpound-Jump',GBA_Name="GBA_Jump",bShowOnHud=False)
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedFleshPound_Versus:FootstepCameraShake0'
   LocalizationKey="KFPawn_ZedFleshpound"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
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
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshPound_Versus:Afflictions_0'
   IncapSettings(4)=(Cooldown=7.000000)
   IncapSettings(5)=(Duration=1.500000)
   IncapSettings(6)=(Duration=1.500000,Cooldown=20.000000,Vulnerability=(0.600000))
   IncapSettings(7)=()
   IncapSettings(8)=(Duration=0.500000)
   IncapSettings(9)=()
   SprintSpeed=550.000000
   SprintStrafeSpeed=450.000000
   TeammateCollisionRadiusPercent=0.300000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
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
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_PlayerFleshpound_Melee'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_PlayerFleshpound_Melee2'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_PlayerFleshpound_Rage'
      SpecialMoveClasses(24)=Class'kfgamecontent.KFSM_PlayerFleshpound_Block'
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(28)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshPound_Versus:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshPound_Versus:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   GroundSpeed=275.000000
   Health=1983
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:KFPawnSkeletalMeshComponent'
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
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedFleshpound:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedFleshPound_Versus"
   ObjectArchetype=KFPawn_ZedFleshpound'kfgamecontent.Default__KFPawn_ZedFleshpound'
}
