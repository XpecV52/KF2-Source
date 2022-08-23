//=============================================================================
// KFPawn_ZedSiren
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedSiren extends KFPawn_Monster;

/** Neck light */
var protected PointLightComponent NeckLightComponent;
var protected const name NeckLightSocketName;
var protected const float ScreamLightFlickerRate;
var protected const float ScreamLightRadius;
var protected const float ScreamLightFalloffExponent;
var protected const float MinFlickerBrightness;
var protected const float MaxFlickerBrightness;

/** Initialize our light */
simulated function SetCharacterArch( KFCharacterInfoBase Info, optional bool bForce )
{
	super.SetCharacterArch( Info, bForce );

	if( WorldInfo.NetMode != NM_DedicatedServer && !NeckLightComponent.bAttached && WorldInfo.GetDetailMode() > DM_Low )
	{
		Mesh.AttachComponentToSocket( NeckLightComponent, NeckLightSocketName );
		NeckLightComponent.SetEnabled( true );
		KFLightPool(WorldInfo.MyLightPool).RegisterPointLight( NeckLightComponent, LPP_GameplayUsed );
	}
}

simulated function ANIMNOTIFY_SirenScream()
{
	local KFSM_Siren_Scream ScreamSM;

	ScreamSM = KFSM_Siren_Scream(SpecialMoves[SpecialMove]);
    if( ScreamSM != none )
    {
    	ScreamSM.ScreamBegan();
    	if( WorldInfo.NetMode != NM_Client )
    	{
	    	DisablebOnDeathAchivement();
	    }
    }
}

simulated function EnableScreamFlicker( bool bEnabled )
{
	if( WorldInfo.NetMode == NM_DedicatedServer || bPlayedDeath || NeckLightComponent == none || !NeckLightComponent.bAttached )
	{
		return;
	}

	if( bEnabled )
	{
		NeckLightComponent.AnimationType = LightAnim_Strobe;
		NeckLightComponent.AnimationFrequency = ScreamLightFlickerRate;
		NeckLightComponent.Radius = ScreamLightRadius;
		NeckLightComponent.FalloffExponent = ScreamLightFalloffExponent;
		NeckLightComponent.MinBrightness = MinFlickerBrightness;
		NeckLightComponent.MaxBrightness = MaxFlickerBrightness;
	}
	else
	{
		NeckLightComponent.AnimationType = default.NeckLightComponent.AnimationType;
		NeckLightComponent.AnimationFrequency = default.NeckLightComponent.AnimationFrequency;
		NeckLightComponent.Radius = default.NeckLightComponent.Radius;
		NeckLightComponent.FalloffExponent = default.NeckLightComponent.FalloffExponent;
		NeckLightComponent.MinBrightness = default.NeckLightComponent.MinBrightness;
		NeckLightComponent.MaxBrightness = default.NeckLightComponent.MaxBrightness;
	}

	NeckLightComponent.DetachFromAny();
	Mesh.AttachComponentToSocket( NeckLightComponent, NeckLightSocketName );
}

 /** Clean up function to terminate any effects on death */
 simulated function TerminateEffectsOnDeath()
 {
 	super.TerminateEffectsOnDeath();

 	if( NeckLightComponent != none && NeckLightComponent.bAttached )
 	{
		NeckLightComponent.DetachFromAny();
		NeckLightComponent = none;
	}
 }

/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 66;//KILL_Female
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 128;//SPOTZ_Siren
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 44;//TRAD_AdviceSiren
}

defaultproperties
{
   Begin Object Class=PointLightComponent Name=NeckLightComponent0
      Radius=35.000000
      Brightness=0.800000
      LightColor=(B=50,G=50,R=250,A=255)
      bEnabled=False
      CastShadows=False
      LightingChannels=(Outdoor=True)
      MaxBrightness=1.200000
      MinBrightness=0.750000
      AnimationType=1
      AnimationFrequency=5.000000
      Name="NeckLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   NeckLightComponent=NeckLightComponent0
   NeckLightSocketName="NeckLightSocket"
   ScreamLightFlickerRate=4.250000
   ScreamLightRadius=200.000000
   ScreamLightFalloffExponent=2.000000
   MinFlickerBrightness=0.400000
   MaxFlickerBrightness=2.000000
   MonsterArchPath="ZED_ARCH.ZED_Siren_Archetype"
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=13.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedSiren:MeleeHelper_0'
   DoshValue=25
   XPValues(0)=11.000000
   XPValues(1)=15.000000
   XPValues(2)=15.000000
   XPValues(3)=15.000000
   WeakSpotSocketNames(0)="Head_Attach"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun')
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle')
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun')
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun')
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.850000))
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.850000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   DamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_9mm')
   DamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rem1858')
   DamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_DBShotgun',DamageScale=(1.100000))
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Siren'
   OnDeathAchievementID=129
   PawnAnimInfo=KFPawnAnimInfo'ZED_Siren_ANIM.Siren_AnimGroup'
   LocalizationKey="KFPawn_ZedSiren"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=155)
   HitZones(1)=(DmgScale=1.100000,SkinID=2)
   HitZones(2)=(DmgScale=0.500000,SkinID=3)
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=(DmgScale=0.500000,SkinID=3)
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
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
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedSiren:Afflictions_0'
   IncapSettings(0)=(Vulnerability=(2.500000))
   IncapSettings(1)=(Cooldown=6.000000,Vulnerability=(0.900000))
   IncapSettings(2)=(Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=0.200000,Vulnerability=(0.900000))
   IncapSettings(4)=(Cooldown=1.000000,Vulnerability=(1.000000))
   IncapSettings(5)=(Duration=1.500000,Cooldown=5.000000,Vulnerability=(0.500000,2.000000,0.500000,0.500000,2.000000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.150000))
   IncapSettings(7)=(Duration=3.000000,Cooldown=5.500000,Vulnerability=(1.000000,1.000000,2.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=1.000000,Vulnerability=(1.000000))
   IncapSettings(9)=(Duration=4.200000,Cooldown=1.500000,Vulnerability=(2.000000))
   IncapSettings(10)=(Duration=4.000000,Cooldown=6.500000,Vulnerability=(3.000000))
   PhysRagdollImpulseScale=0.500000
   KnockdownImpulseScale=0.500000
   SprintSpeed=200.000000
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
      SpecialMoveClasses(15)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'kfgamecontent.KFSM_Siren_Scream'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedSiren:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedSiren:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.750000
   Mass=50.000000
   GroundSpeed=200.000000
   Health=230
   ControllerClass=Class'kfgamecontent.KFAIController_ZedSiren'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
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
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
   Name="Default__KFPawn_ZedSiren"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
