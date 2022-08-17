//=============================================================================
// KFPawn_ZedSiren
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedSiren extends KFPawn_Monster;

function ANIMNOTIFY_SirenScream()
{
	local KFSM_Siren_Scream ScreamSM;

	ScreamSM = KFSM_Siren_Scream(SpecialMoves[SpecialMove]);
    if( ScreamSM != none )
    {
    	ScreamSM.ScreamBegan();
    }
}

/** Returns (hardcoded) dialog event ID for when players kills this zed type */
function int GetKillerDialogID()
{
	return 66;//KILL_Female
}

/** Returns (hardcoded) dialog event ID for when players spots this zed type */
function int GetSpotterDialogID()
{
	return 128;//SPOTZ_Siren
}

/** Returns (hardcoded) dialog event ID for when trader gives advice to player who was killed by this zed type */
static function int GetTraderAdviceID()
{
	return 44;//TRAD_AdviceSiren
}

defaultproperties
{
	// ---------------------------------------------
	// Stats
	XPValues(0)=11
	XPValues(1)=15
	XPValues(2)=15
	XPValues(3)=15

	// ---------------------------------------------
	// Content
	PawnAnimInfo=KFPawnAnimInfo'ZED_Siren_ANIM.Siren_AnimGroup'
	CharacterMonsterArch=KFCharacterInfo_Monster'zed_siren_arch.ZED_Siren_Archetype'

	Begin Object Name=KFPawnSkeletalMeshComponent
		bPerBoneMotionBlur=false
	End Object

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_SonicAttack)=class'KFGameContent.KFSM_Siren_Scream'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
	End Object

	InstantIncaps(IAF_Stun)=(Head=62,Torso=120,Leg=120,Arm=120,Special=45,LowHealthBonus=10,Cooldown=3.0)
	InstantIncaps(IAF_Knockdown)=(Head=50,Torso=80,Leg=80,Arm=80,Special=50,LowHealthBonus=10,Cooldown=9.0)
	InstantIncaps(IAF_Stumble)=(Head=44,Torso= 50,Arm=50,LowHealthBonus=10,Cooldown=2.0)
	InstantIncaps(IAF_LegStumble)=(Leg=44,LowHealthBonus=10,Cooldown=2.0)
	InstantIncaps(IAF_GunHit)=(Head=105,Torso=105,Leg=105,Arm=105,LowHealthBonus=10,Cooldown=0.5)
	InstantIncaps(IAF_MeleeHit)=(Head=23,Torso=29,Leg=29,Arm=29,LowHealthBonus=10,Cooldown=0.35)
	StackingIncaps(SAF_Poison)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_Microwave)=(Threshhold=3.0,Duration=4.0,Cooldown=8.5,DissipationRate=1.00)
	StackingIncaps(SAF_FirePanic)=(Threshhold=12.0,Duration=2.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_EMPPanic)=(Threshhold=1.5,Duration=5.0,Cooldown=5.0,DissipationRate=0.5)
	StackingIncaps(SAF_EMPDisrupt)=(Threshhold=0.0,Duration=5.0,Cooldown=5.0,DissipationRate=1.0)
	StackingIncaps(SAF_Freeze)=(Threshhold=2.0,Duration=1.0,Cooldown=5.0,DissipationRate=0.33)

	ParryResistance=1

	// ---------------------------------------------
	// Gameplay
	Begin Object Name=MeleeHelper_0
		BaseDamage=13.f
		MaxHitRange=180.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	Health=230 // KF1=300
	DoshValue=25
	Mass=50.f

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
	HeadlessBleedOutTime=5.f
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=155, DmgScale=1.1, SkinID=1) // KF1=200
	HitZones[1]		  =(ZoneName=neck,	  BoneName=Neck,   Limb=BP_Head,  GoreHealth=20,  DmgScale=1.1, SkinID=2)
	HitZones[2]		  =(ZoneName=chest,   BoneName=Spine2, Limb=BP_Torso, GoreHealth=150, DmgScale=0.5, SkinID=3)
	HitZones[11]	  =(ZoneName=abdomen, BoneName=Hips,   Limb=BP_Torso, GoreHealth=150, DmgScale=0.5, SkinID=3)

	VulnerableDamageTypes.Add((DamageType=class'KFDT_Explosive'))

	// ---------------------------------------------
	// Movement / Physics
	GroundSpeed=200.0f
	SprintSpeed=200.0f
	PhysRagdollImpulseScale=0.5f
	KnockdownImpulseScale=0.5f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedSiren'
	DamageRecoveryTimeHeavy=0.2f
	DamageRecoveryTimeMedium=1.0f

	RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Siren';
`endif
}
