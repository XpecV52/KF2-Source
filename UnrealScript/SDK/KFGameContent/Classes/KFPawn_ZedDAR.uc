//=============================================================================
// KFPawn_ZedDAR
//=============================================================================
// Base pawn for evil DAR robots.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedDAR extends KFPawn_Monster
	abstract;

var protected KFAIController_ZedDAR MyDARController;

var class<KFProjectile> RangedProjectileClass;

var const name FiringSocketLName;
var const name FiringSocketRName;
var name FiringSocketName;

function PossessedBy(Controller C, bool bVehicleTransition)
{
	Super.PossessedBy(C, bVehicleTransition);

	MyDARController = KFAIController_ZedDAR(C);
}

simulated function StartRangedAttack()
{
	local KFSM_RangedAttack RangedSM;

	if(MyDARController != none)
	{
		RangedSM = KFSM_RangedAttack(SpecialMoves[SpecialMove]);
		MyDARController.FireRangedAttack(RangedProjectileClass, RangedSM.GetFireOffset());
	}
}

function OnStackingAfflictionChanged(byte Id)
{
	Super.OnStackingAfflictionChanged(Id);

	if (MyKFAIC == none || !IsAliveAndWell())
	{
		return;
	}

	if (bEMPDisrupted)
	{
		if (IsDoingSpecialMove(SM_StandAndShootAttack))
		{
			EndSpecialMove();
		}
	}
}

function PlayHit(float Damage, Controller InstigatedBy, vector HitLocation, class<DamageType> damageType, vector Momentum, TraceHitInfo HitInfo)
{
	if (Damage == 0)
	{
		HitInfo.BoneName = 'KBArmor';

		//Passing 1 damage to minimize need to rewrite for a single pawn
		super.PlayHit(1, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
	else
	{
		super.PlayHit(Damage, InstigatedBy, HitLocation, damageType, Momentum, HitInfo);
	}
}

function int GetHitZoneIndex(name BoneName)
{
	if (BoneName == 'KBArmor')
	{
		//Known arbitrary, hacking some things in place
		return OverrideArmorFXIndex;
	}

	return super.GetHitZoneIndex(BoneName);
}

simulated function KFSkinTypeEffects GetHitZoneSkinTypeEffects(int HitZoneIdx)
{
	if (HitZoneIdx == OverrideArmorFXIndex)
	{
		return CharacterArch.ImpactSkins[3];
	}
	return super.GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function CauseHeadTrauma(float BleedOutTime = 5.f)
{
	// DAR doesn't bleed out from losing its head.
}

function ZedExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	super.ZedExplodeArmor(ArmorZoneIdx, ArmorZoneName);
	if (MyDARController != none)
	{
		MyDARController.OnArmorLoss(ArmorZoneName);
	}
}

function SetSprinting(bool bNewSprintStatus)
{
	if (bNewSprintStatus)
	{
		if(CanDoSpecialMove(SM_SprintStart))
		{
			DoSpecialMove(SM_SprintStart, true,, SpecialMoves[SM_SprintStart].PackFlagsBase(self));
		}
	}
	else
	{
		super.SetSprinting(bNewSprintStatus);
	}
}

simulated function NotifySpecialMoveEnded(KFSpecialMove FinishedMove, ESpecialMove SMHandle)
{
	super.NotifySpecialMoveEnded(FinishedMove, SMHandle);

	if (SMHandle == SM_SprintStart)
	{
		// Finish sprinting setup
		super.SetSprinting(true);
	}
}

defaultproperties
{
	MinSpawnSquadSizeType=EST_Medium

	bEnableAimOffset=true

	Health=775//462 //562
	DoshValue=17
	Mass=85.f //65

	// ---------------------------------------------
	// Stats
	XPValues(0)=15
	XPValues(1)=20
	XPValues(2)=27
	XPValues(3)=31

	// ---------------------------------------------
	// Movement / Physics
	GroundSpeed=170.0f
	SprintSpeed=600.0f //450 //550

	RotationRate=(Pitch=50000,Yaw=66000,Roll=50000)

	Begin Object Name=MeleeHelper_0
		BaseDamage=10.f
		MaxHitRange=180.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	ArmorInfoClass=class'KFZedArmorInfo_EvilDAR'
	ArmorZoneStatus=3
	PreviousArmorZoneStatus=3
	OverrideArmorFXIndex=200
	RepArmorPct[0]=255
	RepArmorPct[1]=255

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_SprintStart)=class'KFGame.KFSM_StartSprintAnim'
	End Object

	// for reference: Vulnerability=(default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(0.5, 2.0, 0.5, 0.5, 2.0), Cooldown=5.0,  Duration=1.5)
	IncapSettings(AF_Knockdown)=(Vulnerability=(1.0),                     Cooldown=1.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(1.0),                     Cooldown=1.0)   //0.4
	IncapSettings(AF_GunHit)=	(Vulnerability=(0.9),                     Cooldown=0.2)
	IncapSettings(AF_MeleeHit)=	(Vulnerability=(1.0),                     Cooldown=0.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(0.5),                     Cooldown=6.0,  Duration=5.0)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0,  Duration=5.0)
	IncapSettings(AF_Poison)=	(Vulnerability=(0.05),	                  Cooldown=20.5, Duration=5.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(3),                       Cooldown=6.5,  Duration=4.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(0.9),                     Cooldown=1.0,  Duration=4.2)
	IncapSettings(AF_Snare)=	(Vulnerability=(1.0, 1.0, 2.0, 1.0, 1.0), Cooldown=5.5,  Duration=3.0)
    IncapSettings(AF_Bleed)=    (Vulnerability=(0.01))


    ParryResistance=1

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(1.05))) //0.75
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(1.05)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(1.0)))  //0.7
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(1.0)))  //0.75
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(1.25)))  //0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(1.25)))  //0.85
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(1.5))) //0.5 //0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(3.25))) //0.85 //2.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 				    DamageScale=(1.0))) //0.6
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.85))) //0.5
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.05))) //0.25

	// Custom Hit Zones (HeadHealth, SkinTypes, etc...)
    HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=350, DmgScale=1.001, SkinID=1)  // KF1=200     //154
    HitZones[3]       =(ZoneName=heart,	   BoneName=Spine1,		  Limb=BP_Special,  GoreHealth=150, DmgScale=3.5, SkinID=2) //1.4

	StartSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Start'
	SprintLoopingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_LP'
	StopSprintingSound=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Thruster_Stop'
}
