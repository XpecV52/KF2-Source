//=============================================================================
// KFPawn_ZedFleshpound
//=============================================================================
// Fleshpound pawn class
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedFleshpound extends KFPawn_Monster;

/** Sounds */
var AkComponent RageAkComponent;
var AkEvent RageLoopSound;
var AkEvent RageStopSound;
var bool bPlayingRageSound;

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

/** Footstep camera shake */
var protected const float FootstepCameraShakePitchAmplitude;
var protected const float FootstepCameraShakeRollAmplitude;

/*********************************************************************************************
* Initialization
********************************************************************************************* */

/** TEMP [See when this was added in sourcecontrol] */
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer && Mesh != None )
	{
		UpdateGameplayMICParams();
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

/** Overridden to cause slight camera shakes when walking. */
simulated event PlayFootStepSound(int FootDown)
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( IsHumanControlled() && IsLocallyControlled() )
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = 0;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = 0;
		}
		else
		{
			FootstepCameraShake.RotOscillation.Pitch.Amplitude = FootstepCameraShakePitchAmplitude;
			FootstepCameraShake.RotOscillation.Roll.Amplitude = FootstepCameraShakeRollAmplitude;
			FootstepCameraShakeInnerRadius = default.FootstepCameraShakeInnerRadius;
			FootstepCameraShakeOuterRadius = default.FootstepCameraShakeOuterRadius;
			if( !bIsSprinting || VSizeSQ(Velocity) < 10000.f )
			{
				FootstepCameraShake.RotOscillation.Pitch.Amplitude *= 0.75f;
				FootstepCameraShake.RotOscillation.Roll.Amplitude *= 0.75f;
			}
		}
	}

	super.PlayFootStepSound( FootDown );
}

/*********************************************************************************************
* Rage Related
********************************************************************************************* */

/** Called on server when pawn should have been crippled (e.g. Headless) */
function CauseHeadTrauma( float BleedOutTime=5.f )
{
	super.CauseHeadTrauma( BleedOutTime );

	// End rage when decapped
	SetEnraged( false );
}

/** Returns TRUE if this zed can block attacks */
function bool CanBlock()
{
	return !IsEnraged() && super.CanBlock();
}

/** Turns off FX and sounds */
simulated function TerminateEffectsOnDeath()
{
	StopRageSound();
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
	if( !bCanRage || (Role == ROLE_Authority && bNewEnraged == bIsEnraged) )
	{
		return;
	}

	if ( Role == ROLE_Authority )
	{
		bIsEnraged = bNewEnraged;

		// End blocking on rage
		if( IsDoingSpecialMove(SM_Block) )
		{
			EndSpecialMove();
		}

		// Sprint right away if we're AI
		if( !IsHumanControlled() )
		{
			SetSprinting( bNewEnraged );
		}
	}

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		/** Set the proper glow material */
		UpdateGameplayMICParams();
	}
}

/** Handle GlowColor MIC Param */
simulated function UpdateGameplayMICParams()
{
    super.UpdateGameplayMICParams();

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		UpdateBattlePhaseLights();

        if( !IsAliveAndWell() )
        {
            SetGlowColors(DeadGlowColor);
        }
        else
        {
    		if ( bIsEnraged )
    		{
                SetGlowColors(EnragedGlowColor);
    		}
    		else
    		{
                SetGlowColors(DefaultGlowColor);
    		}
		}
	}
}

simulated function SetGlowColors(LinearColor GlowColor)
{
    local MaterialInstanceConstant MIC;
    local int Idx;

    MIC = CharacterMICs[0];

    //Update base mesh
    if (MIC != none)
    {
        MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor);
    }

    //Update any PAC MICs (See King/Mini Fleshpound)
    for (Idx = 0; Idx < 3; ++Idx)
    {
        if (ThirdPersonAttachments[Idx] != none)
        {
            MIC = MaterialInstanceConstant(ThirdPersonAttachments[Idx].GetMaterial(0));
            if (MIC != none)
            {
                MIC.SetVectorParameterValue('Vector_GlowColor', GlowColor);
            }
        }
    }
}

/** Stops the rage sound with an akevent */
simulated function StopRageSound()
{
	if(bPlayingRageSound && RageAkComponent.IsPlaying(RageLoopSound) )
	{
		RageAkComponent.PlayEvent( RageStopSound, true, true );
		bPlayingRageSound = false;
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

/**
 * Used to adjust strength of all incoming afflictions (similar to AdjustDamage)
 * based on current situation / state.
 */
simulated function AdjustAffliction(out float AfflictionPower)
{
	if ( bIsEnraged )
	{
		AfflictionPower *= 0.25f;
	}
}

/** Track the fleshpound's speed and play the appropriate cues */
simulated event Tick( float DeltaTime )
{
	super.Tick( DeltaTime );

	if( WorldInfo.NetMode != NM_DedicatedServer && IsAliveAndWell() )
	{
		if( bIsSprinting && IsEnraged() && Physics == PHYS_Walking && Mesh.RootMotionMode == RMM_Ignore && VSizeSQ(Velocity) > 40000.f )
		{
			if( !RageAkComponent.IsPlaying(RageLoopSound) )
			{
				RageAkComponent.PlayEvent( RageLoopSound, true, true );
				bPlayingRageSound = true;
			}
		}
		else
		{
			StopRageSound();
		}
	}
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
   Begin Object Class=AkComponent Name=RageAkComponent0
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="RageAkComponent0"
      ObjectArchetype=AkComponent'AkAudio.Default__AkComponent'
   End Object
   RageAkComponent=RageAkComponent0
   RageLoopSound=AkEvent'ww_zed_fleshpound_2.Play_FleshPound_Rage_Start'
   RageStopSound=AkEvent'ww_zed_fleshpound_2.Play_FleshPound_Rage_Stop'
   DefaultGlowColor=(R=1.000000,G=0.350000,B=0.000000,A=1.000000)
   EnragedGlowColor=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   DeadGlowColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   RageBumpDamageType=Class'kfgamecontent.KFDT_HeavyZedBump'
   BattlePhaseLightFrontSocketName="Light"
   FootstepCameraShakePitchAmplitude=120.000000
   FootstepCameraShakeRollAmplitude=60.000000
   bLargeZed=True
   bCanRage=True
   bIsFleshpoundClass=True
   MonsterArchPath="ZED_ARCH.ZED_Fleshpound_Archetype"
   HeadlessBleedOutTime=7.000000
   ParryResistance=4
   MinSpawnSquadSizeType=EST_Large
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'KFGame.Default__KFPawn_Monster:MeleeHelper_0'
      BaseDamage=55.000000
      MyDamageType=Class'kfgamecontent.KFDT_Bludgeon_Fleshpound'
      MomentumTransfer=55000.000000
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
   WeakSpotSocketNames(1)="WeakPointSocket1"
   DamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   DamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   DamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.750000))
   DamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.750000))
   DamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.750000))
   DamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.500000))
   DamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.600000))
   DamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.300000))
   DamageTypeModifiers(8)=(DamageType=Class'kfgamecontent.KFDT_Microwave')
   DamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(1.500000))
   DamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.750000))
   DamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.250000))
   ZedBumpDamageScale=0.000000
   DifficultySettings=Class'kfgamecontent.KFDifficulty_Fleshpound'
   BumpFrequency=0.100000
   BumpDamageType=Class'KFGame.KFDT_NPCBump_Large'
   FootstepCameraShakeInnerRadius=200.000000
   FootstepCameraShakeOuterRadius=900.000000
   FootstepCameraShake=CameraShake'kfgamecontent.Default__KFPawn_ZedFleshpound:FootstepCameraShake0'
   Begin Object Class=AkComponent Name=SprintAkComponent0 Archetype=AkComponent'KFGame.Default__KFPawn_Monster:SprintAkComponent0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      OcclusionUpdateInterval=0.200000
      Name="SprintAkComponent0"
      ObjectArchetype=AkComponent'KFGame.Default__KFPawn_Monster:SprintAkComponent0'
   End Object
   SprintAkComponent=SprintAkComponent0
   OnDeathAchievementID=131
   PawnAnimInfo=KFPawnAnimInfo'ZED_Fleshpound_ANIM.Fleshpound_AnimGroup'
   LocalizationKey="KFPawn_ZedFleshpound"
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
   HitZones(3)=(BoneName="Spine1",DmgScale=1.100000,SkinID=2)
   HitZones(4)=()
   HitZones(5)=(GoreHealth=20,DmgScale=0.200000,SkinID=3)
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=(GoreHealth=20,DmgScale=0.200000,SkinID=3)
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
      AfflictionClasses(11)=()
      FireFullyCharredDuration=5.000000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'KFGame.Default__KFPawn_Monster:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedFleshpound:Afflictions_0'
   IncapSettings(0)=(Duration=2.200000,Cooldown=10.000000,Vulnerability=(0.950000))
   IncapSettings(1)=(Duration=3.500000,Cooldown=10.000000,Vulnerability=(0.700000))
   IncapSettings(2)=(Cooldown=1.200000,Vulnerability=(1.000000))
   IncapSettings(3)=(Cooldown=1.700000,Vulnerability=(0.000000,0.000000,0.000000,0.000000,0.500000))
   IncapSettings(4)=(Cooldown=5.000000,Vulnerability=(0.200000,0.250000,0.250000,0.000000,0.400000))
   IncapSettings(5)=(Duration=1.550000,Cooldown=10.000000,Vulnerability=(0.500000,0.550000,0.500000,0.000000,0.550000))
   IncapSettings(6)=(Cooldown=20.500000,Vulnerability=(0.150000))
   IncapSettings(7)=(Cooldown=8.500000,Vulnerability=(1.000000,1.000000,3.000000,1.000000,1.000000))
   IncapSettings(8)=(Cooldown=10.000000,Vulnerability=(0.250000,0.250000,0.500000,0.250000,0.400000))
   IncapSettings(9)=(Duration=1.000000,Cooldown=10.500000,Vulnerability=(0.950000))
   IncapSettings(10)=(Duration=2.500000,Cooldown=17.000000,Vulnerability=(0.900000))
   IncapSettings(11)=(Vulnerability=(0.750000))
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
      SpecialMoveClasses(16)=None
      SpecialMoveClasses(17)=Class'KFGame.KFSM_Block'
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=None
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
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
      ObjectArchetype=KFSpecialMoveHandler'KFGame.Default__KFPawn_Monster:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:SpecialMoveHandler_0'
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
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedFleshpound:WeaponAmbientEchoHandler_0'
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
   DamageRecoveryTimeHeavy=0.850000
   DamageRecoveryTimeMedium=0.850000
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
   Components(8)=SprintAkComponent0
   Components(9)=RageAkComponent0
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=50000,Yaw=40000,Roll=50000)
   Name="Default__KFPawn_ZedFleshpound"
   ObjectArchetype=KFPawn_Monster'KFGame.Default__KFPawn_Monster'
}
