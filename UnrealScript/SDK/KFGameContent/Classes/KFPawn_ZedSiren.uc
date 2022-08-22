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
    	DisablebOnDeathAchivement();
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

	// for reference: Vulnerability=(default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 2.0, 0.5, 0.5, 2.0), Cooldown=5.0,  Duration=1.5)
	IncapSettings(AF_Knockdown)=(Vulnerability=(1.0),                     Cooldown=1.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(1.0),                     Cooldown=1.0)   //0.4
	IncapSettings(AF_GunHit)=	(Vulnerability=(0.9),                     Cooldown=0.2)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(0.9),                     Cooldown=6.0,  Duration=5.0)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0,  Duration=5.0)
	IncapSettings(AF_Poison)=	(Vulnerability=(0.15),	                  Cooldown=20.5, Duration=5.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(3),                       Cooldown=6.5,  Duration=4.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(2.0),                     Cooldown=1.5,  Duration=2.2)
	IncapSettings(AF_Snare)=	(Vulnerability=(1.0, 1.0, 2.0, 1.0, 1.0), Cooldown=5.5,  Duration=3.0)

	Begin Object Name=Afflictions_0
		AfflictionClasses(AF_EMP)=class'KFAffliction_EMPDisrupt'
	End Object

	ParryResistance=1

    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(1.0))) //0.75
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(1.0)))  //0.7
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(1.0)))  //0.75
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(1.0)))  //0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(1.0)))  //0.85
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.5))) //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.85))) //0.85
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 				    DamageScale=(0.85))) //0.6
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.5))) //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.25))) //0.25		


	//Special Case damage resistance
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_9mm',              DamageScale=(1.0))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rem1858',          DamageScale=(1.0))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_DBShotgun',        DamageScale=(1.1))

KFDT_Ballistic_DBShotgun

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

	WeakSpotSocketNames.Empty;	// Ignore the head
	WeakSpotSocketNames.Add(Head_Attach); // Neck

	// ---------------------------------------------
	// Movement / Physics
	GroundSpeed=200.0f
	SprintSpeed=200.0f
	PhysRagdollImpulseScale=0.5f
	KnockdownImpulseScale=0.5f

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedSiren'
	DamageRecoveryTimeHeavy=0.75f
	DamageRecoveryTimeMedium=1.0f

	RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Siren';
`endif
	
	OnDeathAchievementID=KFACHID_DeadSilence
}
