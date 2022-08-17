//=============================================================================
// KFPawn_ZedGorefast
//=============================================================================
// Gorefast
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedGorefast extends KFPawn_Monster;

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 38;//TRAD_AdviceGorefast
}

DefaultProperties
{
	// ---------------------------------------------
	// Stats
	XPValues(0)=11
	XPValues(1)=14
	XPValues(2)=14
	XPValues(3)=14

	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Gorefast_ARCH.ZED_Gorefast_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Gorefast_Anim.Gorefast_AnimGroup'

	//DebugRange_Melee_Material=Material'ENG_EditorResources_MAT.Debug_Radius_M'
	RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)

	// ---------------------------------------------
	// Gameplay

	Begin Object Name=MeleeHelper_0
		BaseDamage=10.f
		MaxHitRange=192.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_Gorefast'
	End Object

	Health=200.f
	DoshValue=12
	Mass=65.f

	// Penetration
    PenetrationResistance=1.5

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HitZones[8]=(ZoneName=rforearm, BoneName=RightForearm, Limb=BP_RightArm, GoreHealth=20, DmgScale=0.5, SkinID=2)

	// ---------------------------------------------
	// Movement Physics
	GroundSpeed=240.f
	SprintSpeed=450.f
	MaxFallSpeed=6000.f
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0048.000000 // Mesh is pulled back by 20 UU
	End Object

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedGorefast'
	ReachedEnemyThresholdScale=1.f
	//ReachedGoalThresholdOverride=0
	DamageRecoveryTimeHeavy=0.2f
	DamageRecoveryTimeMedium=1.0f

	KnockdownImpulseScale=1.0f

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
	End Object

	InstantIncaps(IAF_Stun)=(Head=43,Torso=45,Leg=60,Arm=60,LowHealthBonus=10,Cooldown=3.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=75,Leg=56,Arm=75,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=43,Torso=46,Arm=49,LowHealthBonus=10,Cooldown=2.0)
	InstantIncaps(IAF_LegStumble)=(Leg=46,LowHealthBonus=10,Cooldown=2.0)
	InstantIncaps(IAF_GunHit)=(Head=106,Torso=106,Leg=106,Arm=106,LowHealthBonus=10,Cooldown=1.5)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=27,Leg=25,Arm=25,LowHealthBonus=10,Cooldown=0.3)
	StackingIncaps(SAF_Poison)=(Threshhold=2.0,Duration=2.0,Cooldown=12.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=2.0,Duration=2.0,Cooldown=12.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=2.0,Duration=2.5,Cooldown=6.0,DissipationRate=1.00)

	ParryResistance=2

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Gorefast';
`endif

    // ---------------------------------------------
	// Spawning
    MinSpawnSquadSizeType=EST_Medium
}
