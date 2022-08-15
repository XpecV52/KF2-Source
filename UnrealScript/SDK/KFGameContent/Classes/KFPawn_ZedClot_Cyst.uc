//=============================================================================
// KFPawn_ZedClot_Cyst
//=============================================================================
// KF Pawn for Clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPawn_ZedClot_Cyst extends KFPawn_ZedClot;

/** Returns (hardcoded) trader advice dialog ID */
static function int GetTraderAdviceID()
{
	return 36;//TRAD_AdviceClotU
}

defaultproperties
{
	// ---------------------------------------------
	// Stats
	XPValues(0)=8
	XPValues(1)=11
	XPValues(2)=11
	XPValues(3)=11

	Begin Object Name=KFPawnSkeletalMeshComponent
		bPerBoneMotionBlur=false
	End Object

	// ---------------------------------------------
	// Content
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_UnDev_Archetype'
	PawnAnimInfo=KFPawnAnimInfo'ZED_Clot_Anim.UndevClot_AnimGroup'

	CharacterMonsterArchDebug=KFCharacterInfo_Monster'ZED_AI_DEBUG_Clot_ARCH.ZED_Clot_Undev_Archetype_DEBUG'

	// ---------------------------------------------
	// Gameplay
	GrabAttackFrequency=0.8f
	KnockedDownBySonicWaveOdds=0.35f

	Begin Object Name=Afflictions_0
		InstantAffl(IAF_Stun)=(Head=43,Torso=43,Leg=43,Arm=43,LowHealthBonus=10,Cooldown=3.0)
		InstantAffl(IAF_Knockdown)=(Head=40,Torso=50,Leg=50,Arm=50,LowHealthBonus=10,Cooldown=8.0)
	    InstantAffl(IAF_Stumble)=(Head=43,Torso=43,Arm=43,LowHealthBonus=10,Cooldown=0.5)
		InstantAffl(IAF_LegStumble)=(Leg=26,LowHealthBonus=10,Cooldown=0.5)
		InstantAffl(IAF_GunHit)=(Head=98,Torso=98,Leg=98,Arm=98,LowHealthBonus=10,Cooldown=0.0)
		InstantAffl(IAF_MeleeHit)=(Head=20,Torso=20,Leg=20,Arm=20,LowHealthBonus=10,Cooldown=0.0)
		StackingAffl(SAF_Poison)=(Threshhold=1.0,Duration=4.5,Cooldown=8.0,DissipationRate=1.00)
		StackingAffl(SAF_Microwave)=(Threshhold=1.0,Duration=4.5,Cooldown=8.0,DissipationRate=1.00)
		StackingAffl(SAF_FirePanic)=(Threshhold=0.9,Duration=5,Cooldown=7.0,DissipationRate=0.07)
	End Object

    ParryResistance=0	

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedClot_Cyst'
	PeripheralVision=-0.5f //180
	DamageRecoveryTimeHeavy=0.3f
	DamageRecoveryTimeMedium=1.0f
	
	RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
	
	KnockdownImpulseScale=1.0f

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Underdeveloped';
`endif
}


