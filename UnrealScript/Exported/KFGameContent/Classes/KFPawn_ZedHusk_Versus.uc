//=============================================================================
// KFPawn_ZedHusk_Versus
//=============================================================================
// Husk Versus pawn
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedHusk_Versus extends KFPawn_ZedHusk;

/** Speed at which a fireball travels */
var float FireballSpeed;

/** Turns medium range flamethrower effect on */
simulated function ANIMNOTIFY_FlameThrowerOn()
{
    if( IsDoingSpecialMove(SM_PlayerZedAttack2) )
	{
		KFSM_Husk_FlameThrowerAttack(SpecialMoves[SpecialMove]).TurnOnFlamethrower();
	}
}

/** AnimNotify which launches the fireball projectile */
function ANIMNOTIFY_HuskFireballAttack()
{
	ShootFireball();
}

function ShootFireball()
{
	local vector		SocketLocation;
	local KFProjectile	MyFireball;
    local PlayerController PC;
    local rotator ShootRotation;
	local vector HitLocation, HitNormal;
    local vector TraceStart, TraceEnd;
    local Actor HitActor;

    if( Role == ROLE_Authority && IsHumanControlled() )
    {
	    PC = PlayerController(Controller);
	    if( PC == none )
	    {
	        return;
	    }

		SocketLocation = GetPawnViewLocation() + (PlayerFireOffset >> GetViewRotation());

	    TraceStart = PC.PlayerCamera.CameraCache.POV.Location;
	    TraceEnd = PC.PlayerCamera.CameraCache.POV.Location + vector(PC.PlayerCamera.CameraCache.POV.Rotation)*100000;

	    HitActor = Trace( HitLocation, HitNormal, TraceEnd, TraceStart, TRUE,,,TRACEFLAG_Bullet );

	    if( HitActor != none )
	    {
	        ShootRotation = Rotator( HitLocation - SocketLocation);
	    }
	    else
	    {
		   ShootRotation = Rotator( TraceEnd - SocketLocation);
		}

		if( Health > 0.f && IsDoingSpecialMove(SM_PlayerZedAttack1) )
		{
			// Shoot the fireball
			MyFireball = Spawn( FireballClass, self,, SocketLocation, ShootRotation );
			MyFireball.Instigator			= Self;
			MyFireball.InstigatorController	= Controller;
			MyFireball.Speed				= FireballSpeed;
			MyFireball.MaxSpeed				= FireballSpeed;
			MyFireball.Init( vector(ShootRotation) );
		}
	}
}

simulated function OnExploded( Controller SuicideController )
{
	local KFPlayerController KFPC;

    // Swap to suicide cam
    if( SuicideController != none )
    {
        KFPC = KFPlayerController( SuicideController );
        if( KFPC != none )
        {
	        KFPC.SetCameraMode( 'ZedSuicide' );
	        KFPlayerCamera_Versus(KFPC.PlayerCamera).SwapToZedSuicideCam( Location );
	    }
    }
}

defaultproperties
{
   FireballSpeed=3600.000000
   PlayerFireOffset=(X=15.000000,Y=32.000000,Z=-12.000000)
   ExplosionTemplate=KFGameExplosion'kfgamecontent.Default__KFPawn_ZedHusk_Versus:ExploTemplate0'
   bVersusZed=True
   ThirdPersonViewOffset=(OffsetHigh=(X=-175.000000,Y=75.000000,Z=40.000000),OffsetMid=(X=-160.000000,Y=60.000000,Z=0.000000),OffsetLow=(X=-220.000000,Y=75.000000,Z=50.000000))
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk:MeleeHelper_0'
      BaseDamage=30.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MeleeImpactCamScale=0.200000
      MaxHitRange=180.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedHusk_Versus:MeleeHelper_0'
   DoshValue=68
   SpecialMoveCooldowns(0)=(CoolDownTime=0.950000,SMHandle=SM_PlayerZedAttack1,SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Fireball',NameLocalizationKey="Shoot",GBA_Name="GBA_Fire")
   SpecialMoveCooldowns(1)=(CoolDownTime=2.000000,SMHandle=SM_PlayerZedAttack2,SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Flamethrower',NameLocalizationKey="Flame",GBA_Name="GBA_IronsightsToggle",ALT_GBA_NAME="GBA_IronsightsHold")
   SpecialMoveCooldowns(2)=(CoolDownTime=1.000000,SMHandle=SM_Taunt,GBA_Name="GBA_Reload",bShowOnHud=False)
   SpecialMoveCooldowns(3)=(CoolDownTime=0.100000,SMHandle=SM_PlayerZedSpecial1,SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Melee',NameLocalizationKey="Melee",GBA_Name="GBA_TertiaryFire")
   SpecialMoveCooldowns(4)=()
   SpecialMoveCooldowns(5)=()
   SpecialMoveCooldowns(6)=(SMHandle=SM_PlayerZedSpecial4,SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Explode',NameLocalizationKey="Suicide",GBA_Name="GBA_Grenade")
   SpecialMoveCooldowns(7)=(CoolDownTime=1.000000,SMHandle=SM_Jump,SpecialMoveIcon=Texture2D'ZED_Husk_UI.ZED-VS_Icons_Husk-Jump',GBA_Name="GBA_Jump",bShowOnHud=False)
   LocalizationKey="KFPawn_ZedHusk"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedHusk:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   bNeedsCrosshair=True
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedHusk:Afflictions_0'
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedHusk:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedHusk_Versus:Afflictions_0'
   InstantIncaps(1)=(head=68,Torso=90,Leg=90,Arm=90,Cooldown=5.000000)
   InstantIncaps(2)=(head=60,Torso=65,Arm=65,Special=50,Cooldown=5.000000)
   InstantIncaps(3)=(Leg=60,Cooldown=5.000000)
   InstantIncaps(4)=()
   InstantIncaps(5)=()
   StackingIncaps(0)=(Duration=2.000000)
   StackingIncaps(1)=()
   StackingIncaps(2)=()
   StackingIncaps(3)=()
   StackingIncaps(4)=(Duration=2.000000)
   StackingIncaps(5)=()
   SprintSpeed=500.000000
   SprintStrafeSpeed=250.000000
   TeammateCollisionRadiusPercent=0.300000
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
      SpecialMoveClasses(3)=None
      SpecialMoveClasses(4)=Class'KFGame.KFSM_GrappleAttack'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(10)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(11)=None
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'kfgamecontent.KFSM_Husk_FireBallAttack'
      SpecialMoveClasses(20)=Class'kfgamecontent.KFSM_Husk_FlameThrowerAttack'
      SpecialMoveClasses(21)=Class'kfgamecontent.KFSM_Husk_Suicide'
      SpecialMoveClasses(22)=Class'kfgamecontent.KFSM_PlayerHusk_FireBallAttack'
      SpecialMoveClasses(23)=Class'kfgamecontent.KFSM_PlayerHusk_FlameThrowerAttack'
      SpecialMoveClasses(24)=Class'kfgamecontent.KFSM_PlayerHusk_Melee'
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=Class'kfgamecontent.KFSM_PlayerHusk_Suicide'
      SpecialMoveClasses(28)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(29)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHusk:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedHusk_Versus:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedHusk_Versus:WeaponAmbientEchoHandler_0'
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
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedHusk_Versus"
   ObjectArchetype=KFPawn_ZedHusk'kfgamecontent.Default__KFPawn_ZedHusk'
}
