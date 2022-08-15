//=============================================================================
// KFPawn_ZedScrake
//=============================================================================
// Scrake
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedScrake extends KFPawn_Monster;

var protected AkComponent 	ChainsawIdleAkComponent;
var protected AkEvent		PlayChainsawIdleAkEvent;
var protected AkEvent		StopChainsawIdleAkEvent;

// Chainsaw Particle Fx
var name ExhaustSocketName;
var ParticleSystem ExhaustTemplate;
var ParticleSystemComponent ExhaustPSC;

/** Threshold of health below which the Scrake will start rage charging on normal */
var(RageCharge) float       RageHealthThresholdNormal;
/** Threshold of health below which the Scrake will start rage charging on hard */
var(RageCharge) float       RageHealthThresholdHard;
/** Threshold of health below which the Scrake will start rage charging on suicidal */
var(RageCharge) float       RageHealthThresholdSuicidal;
/** Threshold of health below which the Scrake will start rage charging on hell on earth */
var(RageCharge) float       RageHealthThresholdHellOnEarth;

// handle chainsaw idle here instead of through an anim-notify so that we can actually turn it off
simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	ChainsawIdleAkComponent.PlayEvent( PlayChainsawIdleAkEvent );
	CreateExhaustFx();
}

simulated function CreateExhaustFx()
{
	local vector Loc;
	local rotator Rot;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if ( ExhaustPSC == none && ExhaustTemplate != None )
		{
			if ( Mesh.GetSocketWorldLocationAndRotation(ExhaustSocketName, Loc, Rot) )
			{
				ExhaustPSC = new(self) class'ParticleSystemComponent';
				ExhaustPSC.SetTemplate( ExhaustTemplate );

				Mesh.AttachComponentToSocket(ExhaustPSC, ExhaustSocketName);
			}
		}
	}
}

simulated function PlayDying( class<DamageType> DamageType, vector HitLoc )
{
	CleanupChainsaw();
	super.PlayDying( DamageType, HitLoc );
}

simulated event Destroyed()
{
	CleanupChainsaw();
	super.Destroyed();
}

simulated function CleanupChainsaw()
{
	local MaterialInstanceConstant ChainsawBladeMIC;

	ChainsawBladeMIC = Mesh.CreateAndSetMaterialInstanceConstant(1);
	ChainsawBladeMIC.SetScalarParameterValue('Animation_Scalar', 0.f);

	ChainsawIdleAkComponent.PlayEvent( StopChainsawIdleAkEvent );

	// Murder chainsaw Fx
	if( ExhaustPSC != none )
	{
		ExhaustPSC.DeactivateSystem();
		DetachComponent(ExhaustPSC);
		WorldInfo.MyEmitterPool.OnParticleSystemFinished(ExhaustPSC);
		ExhaustPSC = None;
	}
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 129;//SPOTZ_Scrake
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 42;//TRAD_AdviceScrake
}

/*********************************************************************************************
* Movement
********************************************************************************************* */

function SetSprinting( bool bNewSprintStatus )
{
	if( bEmpDisrupted && bNewSprintStatus && (MyKFAIC == none || !MyKFAIC.bHasDebugCommand) )
	{
		return;
	}

	super.SetSprinting( bNewSprintStatus );
}

/*********************************************************************************************
* Notifications
********************************************************************************************* */

/** Interrupt certain moves when bEmpDisrupted is set */
function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if( bEMPDisrupted && bIsSprinting && MyKFAIC != none && IsAliveAndWell() )
	{
		SetSprinting( false );
	}
}

defaultproperties
{
	bLargeZed=true

	Begin Object Name=KFPawnSkeletalMeshComponent
		// Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
		bUpdateKinematicBonesFromAnimation=true
	End Object

	// ---------------------------------------------
	// Stats
	XPValues(0)=34
	XPValues(1)=45
	XPValues(2)=60
	XPValues(3)=69

	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Scrake_ARCH.ZED_Scrake_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Scrake_ANIM.Scrake_AnimGroup'

	ExhaustTemplate=ParticleSystem'ZED_Scrake_EMIT.FX_Scrake_Smoke_Idle_01'
	ExhaustSocketName=FX_Exhaust

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
	End Object

	Begin Object Name=Afflictions_0
        InstantAffl(IAF_Stun)=(Head=53,Torso=110,Leg=110,Arm=110,LowHealthBonus=10,Cooldown=3.0)
        InstantAffl(IAF_Knockdown)=(Head=55,Torso=110,Leg=110,Arm=140,LowHealthBonus=10,Cooldown=17.0)
        InstantAffl(IAF_Stumble)=(Head=53,Torso=53,Arm=60,LowHealthBonus=10,Cooldown=8.0)
        InstantAffl(IAF_LegStumble)=(Leg=54,LowHealthBonus=10,Cooldown=3.0)
        InstantAffl(IAF_GunHit)=(Head=134,Torso=134,Leg=134,Arm=134,LowHealthBonus=10,Cooldown=3.0)
        InstantAffl(IAF_MeleeHit)=(Head=29,Torso=40,Leg=40,Arm=40,LowHealthBonus=10,Cooldown=4.0)
        StackingAffl(SAF_Poison)=(Threshhold=5.0,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
        StackingAffl(SAF_Microwave)=(Threshhold=7.5,Duration=1.5,Cooldown=20.0,DissipationRate=1.00)
        StackingAffl(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
        StackingAffl(SAF_EMPPanic)=(Threshhold=2.0,Duration=5.0,Cooldown=5.0,DissipationRate=0.5)
        StackingAffl(SAF_EMPDisrupt)=(Threshhold=0.0,Duration=5.0,Cooldown=5.0,DissipationRate=1.0)
        FireFullyCharredDuration=5
    End Object

    ParryResistance=4

	// ---------------------------------------------
	// Gameplay
	bCanGrabAttack=false
	ZedBumpDamageScale=0.1f

	Begin Object Name=MeleeHelper_0
		BaseDamage=30.f
		MaxHitRange=200.f
		MyDamageType=class'KFGameContent.KFDT_Slashing_Scrake'
	End Object

	Health=1100
	DoshValue=75
	Mass=130.f

	// Penetration
    PenetrationResistance=4.0

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HeadlessBleedOutTime=6.f
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=600, DmgScale=1.1, SkinID=1)
	HitZones[8]		  =(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=20,  DmgScale=0.5, SkinID=2)

    VulnerableDamageTypes.Add((DamageType=class'KFDT_Microwave'))
    VulnerableDamageTypes.Add((DamageType=class'KFDT_Ballistic_RPG7Impact', DamageScale=4.0))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Slashing'))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Explosive'))

	// ---------------------------------------------
	// Movement / Physics
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0055.000000
	End Object

	RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)

	GroundSpeed=170.f
	SprintSpeed=600.f
	ReachedEnemyThresholdScale=1.f
	PhysRagdollImpulseScale=1.f
	KnockdownImpulseScale=2.0f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedScrake'
	BumpDamageType=class'KFDT_NPCBump_Large'
	DamageRecoveryTimeHeavy=0.2f
	DamageRecoveryTimeMedium=0.09f


	RageHealthThresholdNormal=0.5
    RageHealthThresholdHard=0.75
    RageHealthThresholdSuicidal=0.75
    RageHealthThresholdHellOnEarth=0.90

	// Sound
	Begin Object Class=AkComponent name=ChainsawAkComponent0
		BoneName=Root
		bStopWhenOwnerDestroyed=true
		bForceOcclusionUpdateInterval=true
		OcclusionUpdateInterval=0.2f
	End Object
    ChainsawIdleAkComponent=ChainsawAkComponent0
    Components.Add(ChainsawAkComponent0)

    PlayChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake.ZED_Scrake_SFX_Chainsaw_Idle_LP'
    StopChainsawIdleAkEvent=AkEvent'WW_ZED_Scrake.ZED_Scrake_SFX_Chainsaw_Idle_LP_Stop'

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Scrake';
`endif

	// ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Large
}
