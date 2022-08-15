//=============================================================================
// KFPawn_ZedFleshpound
//=============================================================================
// Fleshpound
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedFleshpound extends KFPawn_Monster;

/** Sounds */
var AkEvent RageStartSound;
var AkEvent RageStopSound;

/** Enraged mode status */
var repnotify bool bIsEnraged;

/** Material parameters for rage light glow */
var LinearColor DefaultGlowColor;
var LinearColor EnragedGlowColor;
var() LinearColor DeadGlowColor;

var class<KFDamageType> RageBumpDamageType;

// Rage lights :)
var name BattlePhaseLightFrontSocketName;
var transient PointLightComponent BattlePhaseLightTemplateYellow;
var transient PointLightComponent BattlePhaseLightTemplateRed;
var transient PointLightComponent BattlePhaseLightFront;

replication
{
	// Replicated to ALL
	if( bNetDirty )
		bIsEnraged;
}

/*********************************************************************************************
* Initialization
********************************************************************************************* */

/** TEMP [See when this was added in sourcecontrol] */
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		SetGameplayMICParams();
	}
}

/**
 * Check on various replicated data and act accordingly.
 */
simulated event ReplicatedEvent(name VarName)
{
	switch( VarName )
	{
	case nameof(bIsEnraged):
		SetEnraged(bIsEnraged);
		break;
	}

	Super.ReplicatedEvent(VarName);
}

/*********************************************************************************************
* Notifications
********************************************************************************************* */

/** Interrupt certain moves when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	local KFAIController_ZedFleshpound FpAIC;

	Super.OnStackingAfflictionChanged(Id);

	if( bEmpDisrupted && MyKFAIC != none && IsAliveAndWell() )
	{
		if( IsDoingSpecialMove(SM_Taunt) )
		{
			EndSpecialMove( SM_Taunt );
		}

		FpAIC = KFAIController_ZedFleshpound(MyKFAIC);
		if ( FpAIC != None && FpAIC.RagePlugin != none )
		{
			FpAIC.RagePlugin.EndRage();
		}
	}
}

/*********************************************************************************************
* Movement
********************************************************************************************* */

/** No FP steering initially */
simulated function StartSteering() {}

/** Don't start sprinting if not enraged */
function SetSprinting( bool bNewSprintStatus )
{
	// Don't start sprinting if not enraged
	if( bNewSprintStatus && !IsEnraged() && (MyKFAIC == none || !MyKFAIC.bHasDebugCommand) )
	{
		return;
	}

	Super.SetSprinting( bNewSprintStatus );
}

/*********************************************************************************************
* Rage Related
********************************************************************************************* */

/** Turns hunt and heal backpack vent smoke off on termination */
simulated function TerminateEffectsOnDeath()
{
    UpdateBattlePhaseLights();
    super.TerminateEffectsOnDeath();
}

/** Updates dynamic lights based on rage status */
simulated function UpdateBattlePhaseLights()
{
    local PointLightComponent LightTemplate;

    if( BattlePhaseLightFront != none )
    {
        BattlePhaseLightFront.DetachFromAny();
        BattlePhaseLightFront = none;
    }

    if( IsAliveAndWell() )
    {
        if( bIsEnraged )
        {
            LightTemplate = BattlePhaseLightTemplateRed;
        }
        else
        {
            LightTemplate = BattlePhaseLightTemplateYellow;
        }

        if( LightTemplate != none )
        {
    	    BattlePhaseLightFront = new(self) Class'PointLightComponent' (LightTemplate);
    	}

        if( BattlePhaseLightFront != none )
        {
            Mesh.AttachComponentToSocket(BattlePhaseLightFront, BattlePhaseLightFrontSocketName);
            BattlePhaseLightFront.SetEnabled( true );
        }
    }
}

/** Called by PawnAnimInfo when determining whether an attack with bSpecializedMode TRUE can be performed. This makes the
	FleshPound use attacks from his PawnAnimInfo that are configured as "specialized" only if he's enraged. */
function bool ShouldPlaySpecialMeleeAnims()
{
	return IsEnraged();
}

/** Return current rage status */
simulated event bool IsEnraged()
{
	return bIsEnraged;
}

/** Enrage this FleshPound! */
simulated function SetEnraged( bool bNewEnraged )
{
	if( Role == ROLE_Authority && bNewEnraged == bIsEnraged )
	{
		return;
	}

	if ( Role == ROLE_Authority )
	{
		bIsEnraged = bNewEnraged;
		/** Sprinting depends soley on whether I'm enraged */
		SetSprinting( bNewEnraged );
	}

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( bNewEnraged )
		{
			PostAkEvent( RageStartSound, true, true );
		}
		else
		{
			PostAkEvent( RageStopSound, true, true );
		}

		/** Set the proper glow material */
		SetGameplayMICParams();
	}
}

/** Handle GlowColor MIC Param */
simulated function SetGameplayMICParams()
{
	local MaterialInstanceConstant MIC;

    super.SetGameplayMICParams();

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		UpdateBattlePhaseLights();

        MIC = bIsGoreMesh ? GoreMIC : BodyMIC;

        if( !IsAliveAndWell() )
        {
            MIC.SetVectorParameterValue('Vector_GlowColor', DeadGlowColor);
        }
        else
        {
    		if ( bIsEnraged )
    		{
    			MIC.SetVectorParameterValue('Vector_GlowColor', EnragedGlowColor);
    		}
    		else
    		{
    			MIC.SetVectorParameterValue('Vector_GlowColor', DefaultGlowColor);
    		}
		}
	}
}

/* PlayDying() is called on server/standalone game when killed
and also on net client when pawn gets bTearOff set to true (and bPlayedDeath is false)
*/
simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	Super.PlayDying(DamageType, HitLoc);

	// Turn off lights on death
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		SetEnraged( false );
	}
}

function class<KFDamageType> GetBumpAttackDamageType()
{
	return RageBumpDamageType;
}

/*********************************************************************************************
* Debugging
**********************************************************************************************/

/** Render some Fleshpound specific debug text over his head */
simulated function GetOverheadDebugText( KFHUDBase HUD, out array<string> OverheadTexts, out array<Color> OverheadColors )
{
	local string DebugText;
	local float RedScalar,  Scalar;
	local color ModifyTextColor;

    if( HUD.ShouldDisplayDebug('All') || HUD.ShouldDisplayDebug('AISpecial') )
    {
    	if( !bIsEnraged )
    	{
    		Scalar = 1.f;// - FClamp( float(AccumulatedDOT) / float(default.HealthMax * RageThresholdPercentage), 0.f, 1.f );
    		RedScalar = FClamp( (1.f - Scalar) / 0.5f, 0.f, 1.f );
    		//GreenScalar = FClamp( (Scalar / 0.5f), 0.f, 1.f );

    		ModifyTextColor.R = FloatToByte( RedScalar );
    		ModifyTextColor.B = 0;
    		ModifyTextColor.G = FloatToByte( Scalar );
    		ModifyTextColor.A = 255;
    		//DebugText = DebugText$"AccumulatedDOT: "$AccumulatedDOT$" Sprinting: "$bIsSprinting;
    	}
    	else
    	{
    		ModifyTextColor.R = 255;
    		ModifyTextColor.G = 0;
    		ModifyTextColor.B = 0;
    		ModifyTextColor.A = 255;
    		DebugText = "ENRAGED!!!";
    		if( IsDoingSpecialMove() )
    		{
    			DebugText = DebugText$" SPECIALMOVE: "$SpecialMove$"\n";
    		}
    		if( MyKFAIC.GetActiveCommand() != none )
    		{
    			DebugText = DebugText$" COMMAND "$MyKFAIC.GetActiveCommand()$"\nSTATE: "$MyKFAIC.GetActiveCommand().GetStateName();
    		}
    	}
	}

	Super.GetOverheadDebugText( HUD, OverheadTexts, OverheadColors );
	OverheadTexts[OverheadTexts.Length] = DebugText;
	OverheadColors[OverheadTexts.Length - 1] = ModifyTextColor;
}

/*********************************************************************************************
* Dialog
**********************************************************************************************/

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 130;//SPOTZ_Fleshpound
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 43;//TRAD_AdviceFleshpound
}

defaultproperties
{
   DefaultGlowColor=(R=1.000000,G=0.350000,B=0.000000,A=1.000000)
   EnragedGlowColor=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   DeadGlowColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   RageBumpDamageType=Class'kfgamecontent.KFDT_HeavyZedBump'
   BattlePhaseLightFrontSocketName="Light"
   bLargeZed=True
   bIsFleshpoundClass=True
   CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Fleshpound_ARCH.ZED_Fleshpound_Archetype'
   HeadlessBleedOutTime=7.000000
   ParryResistance=4
   MinSpawnSquadSizeType=EST_Large
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=55.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Fleshpound'
      MomentumTransfer=100000.000000
      MaxHitRange=250.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedFleshpound:MeleeHelper_0'
   DoshValue=200
   XPValues(0)=35.000000
   XPValues(1)=47.000000
   XPValues(2)=63.000000
   XPValues(3)=72.000000
   VulnerableDamageTypes(0)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=1.500000)
   VulnerableDamageTypes(1)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=1.500000)
   VulnerableDamageTypes(2)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=1.000000)
   ResistantDamageTypes(0)=(DamageType=Class'KFGame.KFDamageType')
   ZedBumpDamageScale=0.000000
   BumpFrequency=0.100000
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   FootstepCameraShakeInnerRadius=200.000000
   FootstepCameraShakeOuterRadius=800.000000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepCameraShake0'
   PawnAnimInfo=KFPawnAnimInfo'ZED_Fleshpound_ANIM.Fleshpound_AnimGroup'
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'KFGame.Default__KFPawn_Monster:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=650)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=(DmgScale=1.100000,SkinID=2)
   HitZones(4)=()
   HitZones(5)=(GoreHealth=20,DmgScale=0.500000,SkinID=3)
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=(GoreHealth=20,DmgScale=0.500000,SkinID=3)
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   PenetrationResistance=5.000000
   Begin Object Class=KFPawnAfflictions Name=Afflictions_0 Archetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
      InstantAffl(0)=(head=65,Torso=140,Leg=140,Arm=140,Special=65,LowHealthBonus=10,Cooldown=25.000000)
      InstantAffl(1)=(head=60,Torso=65,Leg=50,Arm=65,Special=53,LowHealthBonus=10,Cooldown=12.000000)
      InstantAffl(2)=(head=60,Torso=65,Arm=65,Special=53,LowHealthBonus=10,Cooldown=10.000000)
      InstantAffl(3)=(Leg=60,LowHealthBonus=10,Cooldown=9.000000)
      InstantAffl(4)=(head=25,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=1.200000)
      InstantAffl(5)=(head=150,Torso=150,Leg=150,Arm=150,LowHealthBonus=10,Cooldown=20.000000)
      StackingAffl(0)=(Threshhold=2.000000,Duration=3.000000,Cooldown=10.000000,DissipationRate=0.500000)
      StackingAffl(1)=(Threshhold=13.000000,Duration=1.500000,Cooldown=8.000000)
      StackingAffl(2)=(Threshhold=5.000000,Duration=1.500000,Cooldown=20.000000)
      StackingAffl(3)=(Threshhold=10.000000,Duration=1.500000,Cooldown=20.000000)
      StackingAffl(4)=(Threshhold=1.500000,Duration=2.000000,Cooldown=10.000000,DissipationRate=0.500000)
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFPawnAfflictions'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFPawnAfflictions'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
   PhysRagdollImpulseScale=1.500000
   KnockdownImpulseScale=2.000000
   SprintSpeed=725.000000
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
      SpecialMoveClasses(14)=None
      SpecialMoveClasses(15)=None
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=Class'KFGame.KFSM_GrappleVictim'
      SpecialMoveClasses(21)=Class'KFGame.KFSM_HansGrappleVictim'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.250000
   DamageRecoveryTimeMedium=0.090000
   Mass=200.000000
   GroundSpeed=260.000000
   Health=1500
   ControllerClass=Class'KFGame.KFAIController_ZedFleshpound'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
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
      ObjectArchetype=KFSkeletalMeshComponent'KFGame.Default__KFPawn_Monster:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPawn_Monster:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=55.000000
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
   RotationRate=(Pitch=50000,Yaw=40000,Roll=50000)
   Name="Default__KFPawn_ZedFleshpound"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
