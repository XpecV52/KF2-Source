//=============================================================================
// KFPawn_ZedFleshpound
//=============================================================================
// Fleshpound
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedFleshpound extends KFPawn_Monster;

/** Enraged mode status */
var repnotify bool bIsEnraged;

/** Footstep shakes activated in footstep sound animnotify (move up to KFPawn/KFPawn_Monster if deciding to use for others) */
var protected const float FootstepCameraShakeInnerRadius;
var protected const float FootstepCameraShakeOuterRadius;
var CameraShake	 FootstepCameraShake;

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
		SetEnraged( false );
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

/** Overridden to cause slight camera shakes when walking. */
simulated event PlayFootStepSound(int FootDown)
{
	Super.PlayFootStepSound(FootDown);

	/** The FP has footstep notifies in one or more of his Idle anim sequences, where he kind of shuffles his foot as he shifts his weight.
		The IsDoingLatentMove() check below makes the only happening while the FP is actively moving (latent) to avoid the shake while idle for now. */
	if( MyKFAIC != none && MyKFAIC.IsDoingLatentMove() )
	{
		class'Camera'.static.PlayWorldCameraShake(FootstepCameraShake, self, Location, FootstepCameraShakeInnerRadius, FootstepCameraShakeOuterRadius, 1.3f, true);
	}
}

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
	if ( Role == ROLE_Authority )
	{
		bIsEnraged = bNewEnraged;
		/** Sprinting depends soley on whether I'm enraged */
		SetSprinting( bNewEnraged );
	}

	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
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
        UpdateBattlePhaseLights();
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

DefaultProperties
{
	bLargeZed=true

	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
	End Object

	// ---------------------------------------------
	// Stats
	XPValues(0)=35
	XPValues(1)=47
	XPValues(2)=63
	XPValues(3)=72

	bIsFleshpoundClass=true

	//bBlocksNavigation=true
	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Fleshpound_ARCH.ZED_Fleshpound_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Fleshpound_ANIM.Fleshpound_AnimGroup'

	EnragedGlowColor=(R=1,G=0)
	//DebugRange_Melee_Material=Material'ENG_EditorResources_MAT.Debug_Radius_M'
	DefaultGlowColor=(R=1,G=0.35f)
	DeadGlowColor=(R=0.0f,G=0.0f)

	// ---------------------------------------------
	// Gameplay
	bCanMeleeAttack=true
	ZedBumpDamageScale=0.f
	RageBumpDamageType=class'KFGameContent.KFDT_HeavyZedBump'

	Begin Object Name=MeleeHelper_0
		BaseDamage=55.f
		MaxHitRange=250.f
		MomentumTransfer=100000.f // for kick
		MyDamageType=class'KFGame.KFDT_Bludgeon'
	End Object

	Health=1500
	Mass=200.f

	// Penetration
    PenetrationResistance=5.0

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HeadlessBleedOutTime=7.f
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=650, DmgScale=1.1, SkinID=1)
	HitZones[3]       =(ZoneName=heart,	   BoneName=Spine2,		  Limb=BP_Special,  GoreHealth=150, DmgScale=1.1, SkinID=2)
	HitZones[5]		  =(ZoneName=lforearm, BoneName=LeftForearm,  Limb=BP_LeftArm,  GoreHealth=20,  DmgScale=0.5, SkinID=3)
	HitZones[8]		  =(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=20,  DmgScale=0.5, SkinID=3)

	DoshValue=200

	VulnerableDamageTypes.Add((DamageType=class'KFDT_Explosive', DamageScale=1.5))
	VulnerableDamageTypes.Add((DamageType=class'KFDT_Piercing', DamageScale=1.5))
	VulnerableDamageTypes.Add((DamageType=class'KFDT_Microwave', DamageScale=1.0))
	ResistantDamageTypes.Add((DamageType=class'KFDamageType')) // All others

	// ---------------------------------------------
	// Movement Physics
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0055.000000
	End Object

	GroundSpeed=260.f
	SprintSpeed=725.f     //600
	ReachedEnemyThresholdScale=1.f
	//ReachedGoalThresholdOverride=127.5f
	//bCollideAsEncroacher=true
	PhysRagdollImpulseScale=1.5f
	KnockdownImpulseScale=2.0f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedFleshpound'
	BumpDamageType=class'KFDT_NPCBump_Large'
	BumpFrequency=0.1
	DamageRecoveryTimeHeavy=0.35f
	DamageRecoveryTimeMedium=0.09f

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
	End Object
	RotationRate=(Pitch=50000,Yaw=40000,Roll=50000)

  	Begin Object Name=Afflictions_0
		InstantAffl(IAF_Stun)=(Head=60,Torso=65,Leg=50,Arm=65,Special=53,LowHealthBonus=10,Cooldown=12.0)
		InstantAffl(IAF_Knockdown)=(Head=65,Torso=140,Leg=140,Arm=140,Special=65,LowHealthBonus=10,Cooldown=25.0)
		InstantAffl(IAF_Stumble)=(Head=60,Torso=65,Arm=65,Special=53,LowHealthBonus=10,Cooldown=10.0)
		InstantAffl(IAF_LegStumble)=(Leg=60,LowHealthBonus=10,Cooldown=9.0)
		InstantAffl(IAF_GunHit)=(Head=150,Torso=150,Leg=150,Arm=150,LowHealthBonus=10,Cooldown=20)
		InstantAffl(IAF_MeleeHit)=(Head=25,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=0.7)
		StackingAffl(SAF_Poison)=(Threshhold=5.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
		StackingAffl(SAF_Microwave)=(Threshhold=10.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
		StackingAffl(SAF_FirePanic)=(Threshhold=13.0,Duration=1.5,Cooldown=8.0,DissipationRate=1.0)
		StackingAffl(SAF_EMPPanic)=(Threshhold=2.0,Duration=3.0,Cooldown=10.0,DissipationRate=0.5)
		StackingAffl(SAF_EMPDisrupt)=(Threshhold=1.5,Duration=2.0,Cooldown=10.0,DissipationRate=0.5)
		FireFullyCharredDuration=5
	End Object

	ParryResistance=4

    // ---------------------------------------------
    // effects
	Begin Object Class=CameraShake Name=FootstepCameraShake0
		bSingleInstance=true
		OscillationDuration=0.3f
		RotOscillation={(Pitch=(Amplitude=120.f,Frequency=60.f),
		Roll=(Amplitude=60.f,Frequency=40.f))}
	End Object
	FootstepCameraShake=FootstepCameraShake0
	FootstepCameraShakeInnerRadius=200
	FootstepCameraShakeOuterRadius=800
//	bMarkExtraEndpoints=true

    // ---------------------------------------------
    // enraged lights
    Begin Object Class=PointLightComponent Name=PointLightComponent1
        Brightness=1.f
        Radius=128.f
        FalloffExponent=4.f
        LightColor=(R=250,G=200,B=25,A=255)//(R=231,G=215,B=161,A=255)
        CastShadows=false
        LightingChannels=(Indoor=true,Outdoor=true,bInitialized=TRUE)
    End Object
    BattlePhaseLightTemplateYellow=PointLightComponent1

    Begin Object Class=PointLightComponent Name=PointLightComponent2
        Brightness=1.f
        Radius=128.f
        FalloffExponent=4.f
        LightColor=(R=255,G=64,B=64,A=255)//(R=231,G=144,B=0,A=255)
        CastShadows=false
        LightingChannels=(Indoor=true,Outdoor=true,bInitialized=TRUE)
    End Object
    BattlePhaseLightTemplateRed=PointLightComponent2

    BattlePhaseLightFrontSocketName=Light

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Fleshpound';
`endif

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Large
}
