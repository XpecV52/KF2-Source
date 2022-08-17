//=============================================================================
// KFGameInfo
//=============================================================================
// Base GameInfo for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedCrawler_Versus extends KFPawn_ZedCrawler;

var Controller OldController;

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFPlayerController KFPC;

	super.PlayDying( DamageType, HitLoc );

	if( OldController != none && DamageType == class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType )
	{
	    KFPC = KFPlayerController( OldController );
	    if( KFPC != none )
	    {
	        KFPC.SetCameraMode( 'ZedSuicide' );
	        KFPlayerCamera_Versus(KFPC.PlayerCamera).SwapToZedSuicideCam( Location );
	    }
	}
}

/*simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	local KFGoreManager GoreManager;
	local array<name> OutGibBoneList;
	local int NumGibs;

	if( !bPlayedDeath && DamageType != class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType )
	{
		class'KFSM_PlayerCrawler_Suicide'.static.TriggerExplosion( self, true );
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
			if( GoreManager != none )
			{
				NumGibs = Max( Rand(15), 8 );
				NumGibs *= GetCharacterMonsterInfo().ExplosionGibScale;
				GetClosestHitBones(NumGibs, Location, OutGibBoneList);

				GoreManager.CauseGibsAndApplyImpulse( self,
													Class'KFSM_PlayerCrawler_Suicide'.default.SuicideDamageType,
													Location,
													OutGibBoneList,
													none,
													Mesh.GetBoneLocation(Mesh.GetBoneName(0)) );
			}
		}
	}

	super.PlayDying( DamageType, HitLoc );
}*/

defaultproperties
{
   bVersusZed=True
   bHasExtraSprintJumpVelocity=True
   ThirdPersonViewOffset=(OffsetHigh=(X=-300.000000,Y=60.000000,Z=60.000000),OffsetMid=(X=-250.000000,Y=60.000000,Z=-30.000000),OffsetLow=(X=-220.000000,Y=60.000000,Z=25.000000))
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler:MeleeHelper_0'
      BaseDamage=10.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MeleeImpactCamScale=0.200000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedCrawler_Versus:MeleeHelper_0'
   DoshValue=40
   SpecialMoveCooldowns(0)=(CoolDownTime=0.650000,SMHandle=SM_PlayerZedAttack1,SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-LightLeap',NameLocalizationKey="Light",GBA_Name="GBA_Fire")
   SpecialMoveCooldowns(1)=(CoolDownTime=1.000000,SMHandle=SM_PlayerZedAttack2,SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-HeavyLeap',NameLocalizationKey="Heavy",GBA_Name="GBA_IronsightsToggle",ALT_GBA_NAME="GBA_IronsightsHold")
   SpecialMoveCooldowns(2)=(SMHandle=SM_Taunt,GBA_Name="GBA_Reload",bShowOnHud=False)
   SpecialMoveCooldowns(3)=()
   SpecialMoveCooldowns(4)=()
   SpecialMoveCooldowns(5)=()
   SpecialMoveCooldowns(6)=(SMHandle=SM_PlayerZedSpecial4,SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-Explode',NameLocalizationKey="Suicide",GBA_Name="GBA_Grenade")
   SpecialMoveCooldowns(7)=(CoolDownTime=0.850000,SMHandle=SM_Jump,SpecialMoveIcon=Texture2D'ZED_Crawler_UI.ZED-VS_Icons_Crawler-Jump',GBA_Name="GBA_Jump",bShowOnHud=False)
   JumpBumpDamageType=Class'kfgamecontent.KFDT_Bludgeon_ZedJump'
   LocalizationKey="KFPawn_ZedCrawler"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=75)
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
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedCrawler:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedCrawler:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedCrawler_Versus:Afflictions_0'
   InstantIncaps(1)=(head=68,Torso=90,Leg=90,Arm=90,Cooldown=5.000000)
   InstantIncaps(2)=(head=60,Torso=65,Arm=65,Cooldown=5.000000)
   InstantIncaps(3)=(Leg=60,Cooldown=5.000000)
   InstantIncaps(4)=()
   InstantIncaps(5)=()
   SprintSpeed=600.000000
   SprintStrafeSpeed=500.000000
   TeammateCollisionRadiusPercent=0.300000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler:SpecialMoveHandler_0'
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
      SpecialMoveClasses(10)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(11)=Class'kfgamecontent.KFSM_Emerge_Crawler'
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
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_PlayerCrawler_Melee'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_PlayerCrawler_Melee2'
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=Class'kfgamecontent.KFSM_PlayerCrawler_Suicide'
      SpecialMoveClasses(28)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(29)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedCrawler_Versus:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedCrawler_Versus:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedCrawler:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   GroundSpeed=300.000000
   JumpZ=900.000000
   Health=250
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:KFPawnSkeletalMeshComponent'
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
      Translation=(X=0.000000,Y=0.000000,Z=-48.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=4000.000000
      bAllowPerObjectShadows=True
      bAllowPerObjectShadowBatching=True
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedCrawler:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedCrawler:CollisionCylinder'
      CollisionHeight=47.000000
      CollisionRadius=47.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedCrawler:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedCrawler:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedCrawler_Versus"
   ObjectArchetype=KFPawn_ZedCrawler'kfgamecontent.Default__KFPawn_ZedCrawler'
}
