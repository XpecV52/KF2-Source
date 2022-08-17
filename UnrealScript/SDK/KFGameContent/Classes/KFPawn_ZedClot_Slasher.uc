//=============================================================================
// KFPawn_ZedClot_Slasher
//=============================================================================
// Slasher clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedClot_Slasher extends KFPawn_ZedClot;

/** Returns (hardcoded) trader advice dialog ID */
static function int GetTraderAdviceID()
{
	return 37;//TRAD_AdviceClotS
}

DefaultProperties
{
	// ---------------------------------------------
	// Stats
	XPValues(0)=8
	XPValues(1)=11
	XPValues(2)=11
	XPValues(3)=11

	// ---------------------------------------------
	// Content
    CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_Slasher_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.SlasherClot_AnimGroup'

	// ---------------------------------------------
	// Gameplay
	GrabAttackFrequency=0.38f

	// ---------------------------------------------
	// Movement Physics
	GroundSpeed=300.f
	SprintSpeed=500.f
	
	RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedClot_Slasher'
	//bPreferDarkness=true
	DamageRecoveryTimeHeavy=0.3f
	DamageRecoveryTimeMedium=1.0f
	
	KnockdownImpulseScale=1.0f

	// ---------------------------------------------
	// Within KFPawn
	InstantIncaps(IAF_Stun)=(Head=43,Torso=45,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=3.0)
	InstantIncaps(IAF_Knockdown)=(Head=40,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=8.0)
	InstantIncaps(IAF_Stumble)=(Head=43,Torso=43,Arm=43,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_LegStumble)=(Leg=26,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_GunHit)=(Head=98,Torso=98,Leg=98,Arm=98,LowHealthBonus=10,Cooldown=0.0)
	InstantIncaps(IAF_MeleeHit)=(Head=20,Torso=20,Leg=20,Arm=20,LowHealthBonus=10,Cooldown=0.0)
	StackingIncaps(SAF_Poison)=(Threshhold=1.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=1.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=0.9,Duration=5,Cooldown=7.0,DissipationRate=0.07)

	ParryResistance=0
	
`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Slasher';
`endif
}
