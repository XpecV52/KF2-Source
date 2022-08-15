//=============================================================================
// KFPawn_ZedClot_Alpha
//=============================================================================
// Alpha clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedClot_Alpha extends KFPawn_ZedClot;

/** Returns (hardcoded) trader advice dialog ID */
static function int GetTraderAdviceID()
{
	return 35;//TRAD_AdviceClotA
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
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_Alpha_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.AlphaClot_AnimGroup'

	// ---------------------------------------------
	// Gameplay
	GrabAttackFrequency=0.33f

	Begin Object Name=Afflictions_0
		InstantAffl(IAF_Stun)=(Head=43,Torso=43,Leg=43,Arm=43,LowHealthBonus=10,Cooldown=3.0)
		InstantAffl(IAF_Knockdown)=(Head=40,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=8.0)
		InstantAffl(IAF_Stumble)=(Head=43,Torso=43,Arm=43,LowHealthBonus=10,Cooldown=0.5)
		InstantAffl(IAF_LegStumble)=(Leg=43,LowHealthBonus=10,Cooldown=0.5)
		InstantAffl(IAF_GunHit)=(Head=98,Torso=98,Leg=98,Arm=98,LowHealthBonus=10,Cooldown=0.0)
		InstantAffl(IAF_MeleeHit)=(Head=20,Torso=20,Leg=20,Arm=20,LowHealthBonus=10,Cooldown=0.0)
		StackingAffl(SAF_Poison)=(Threshhold=1.0,Duration=2.0,Cooldown=10.0,DissipationRate=1.00)
		StackingAffl(SAF_Microwave)=(Threshhold=1.0,Duration=2.0,Cooldown=10.0,DissipationRate=1.00)
		StackingAffl(SAF_FirePanic)=(Threshhold=0.9,Duration=5,Cooldown=7.0,DissipationRate=0.07)
	End Object	
	
	ParryResistance=0

	// ---------------------------------------------
	// Movement Physics
	GroundSpeed=210.f
	SprintSpeed=500.f
	
	RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedClot_Alpha'
	DamageRecoveryTimeHeavy=0.3f
	DamageRecoveryTimeMedium=1.0f
	
	KnockdownImpulseScale=1.0f

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Clot';
`endif
}
