//=============================================================================
// KFPawn_ZedClot_AlphaKing
//=============================================================================
// Alpha clot King
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedClot_AlphaKing extends KFPawn_ZedClot_Alpha;

const HeadBit = 0x1;
const FrontBit = 0x2;

/** Self-rally damage modifiers */
var protected float SelfRallyDealtDamageModifier;
var protected float SelfRallyTakenDamageModifier;

/** If TRUE, this rally was applied to ourselves */
var protected bool bWasSelfRally;

//List of hit zones that can apply damage to armor before the body
var array<name> ArmorHitzoneNames;

//List of zones of armor (similar to hit zones)
struct ArmorZoneInfo
{
	var() name ArmorZoneName;   //Name of the armor zone
	var() name SocketName;		//Name of the socket explosion FX play from
	var() int ArmorHealth;      //Amount of health the armor absorbs before it blows off
	var() int ArmorHealthMax;
	var() ParticleSystem ExplosionTemplate;
	var() AkEvent ExplosionSFXTemplate;
	var() Texture2D ZoneIcon;
};
var array<ArmorZoneInfo> ArmorZones;
var float ArmorScale;

//Byte array of armor percentages, replicated to clients
var repnotify byte RepArmorPct[2];

//Bit field for the status of the armor zones.  1 = attached
var repnotify byte ArmorZoneStatus;
var byte PreviousArmorZoneStatus;

//Hit FX overrides for hitting armor
var const int OverrideArmorFXIndex;

// Sound when Clot King becomes enraged.
var const AkEvent EnragedSoundEvent;

replication
{
	if (Role == ROLE_Authority)
		ArmorZoneStatus, RepArmorPct;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'ArmorZoneStatus')
	{
		UpdateArmorPieces();
	}
	else if (VarName == 'RepArmorPct')
	{
		UpdateArmorPieces();
	}
	else
	{
		super.ReplicatedEvent(VarName);
	}
}

/** Called immediately after gameplay begins */
simulated event PostBeginPlay()
{
	local class<KFDifficulty_ClotAlphaKing> MyDifficultySettings;
	local KFGameReplicationInfo KFGRI;

	super.PostBeginPlay();

	MyDifficultySettings = class<KFDifficulty_ClotAlphaKing>( DifficultySettings );
	if( MyDifficultySettings != none )
	{
		// Set our (Network: ALL) difficulty-based settings
		KFGRI = KFGameReplicationInfo( WorldInfo.GRI );
		if( KFGRI != none )
		{
			SelfRallyDealtDamageModifier = MyDifficultySettings.default.RallyTriggerSettings[KFGRI.GameDifficulty].SelfDealtDamageModifier;
			SelfRallyTakenDamageModifier = MyDifficultySettings.default.RallyTriggerSettings[KFGRI.GameDifficulty].SelfTakenDamageModifier;
		}
	}

	InitArmor();
}

event PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFAIController_ZedClot_AlphaKing AlphaController;

	super.PossessedBy( C, bVehicleTransition );

	// Initialize our rally settings
	AlphaController = KFAIController_ZedClot_AlphaKing( MyKFAIC );
	if( AlphaController != none )
	{
		AlphaController.InitRallySettings();
	}
}


/** Applies the rally buff and spawns a rally effect */
simulated function bool Rally(
							KFPawn 			RallyInstigator,
							ParticleSystem 	RallyEffect,
							name 			EffectBoneName,
							vector			EffectOffset,
							ParticleSystem	AltRallyEffect,
							name 			AltEffectBoneNames[2],
							vector 			AltEffectOffset,
							optional bool	bSkipEffects=false
						)
{
	if( RallyInstigator == self )
	{
		bWasSelfRally = true;
	}
	else
	{
		bWasSelfRally = false;
	}

    return super.Rally(RallyInstigator, RallyEffect, EffectBoneName, EffectOffset, AltRallyEffect, AltEffectBoneNames, AltEffectOffset, bSkipEffects);
}

/** Applies the rally damage boost if applicable */
simulated function int GetRallyBoostDamage( int NewDamage )
{
	if( bWasSelfRally && SelfRallyDealtDamageModifier > 0.f )
	{
		return NewDamage * ( IsTimerActive(nameOf(Timer_EndRallyBoost)) ? SelfRallyDealtDamageModifier : 1.f );
	}
	else
	{
		return super.GetRallyBoostDamage( NewDamage );
	}
}

/** Applies the rally damage reduction if applicable */
simulated function int GetRallyBoostResistance( int NewDamage )
{
	if( bWasSelfRally && SelfRallyTakenDamageModifier > 0.f )
	{
		return NewDamage * ( IsTimerActive(nameOf(Timer_EndRallyBoost)) ? SelfRallyTakenDamageModifier : 1.f );
	}
	else
	{
		return super.GetRallyBoostDamage( NewDamage );
	}
}

function AdjustDamage(out int InDamage, out vector Momentum, Controller InstigatedBy, vector HitLocation, class<DamageType> DamageType, TraceHitInfo HitInfo, Actor DamageCauser)
{
	super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);

	//If the damage doesn't have a bone hit source, it's likely AoE.  Split over all remaining armor evenly.
	if (HitInfo.BoneName != '')
	{
		AdjustBoneDamage(InDamage, HitInfo.BoneName, DamageCauser.Location);
	}
	else
	{
		AdjustNonBoneDamage(InDamage);
	}

	`log(self @ GetFuncName() @ " After armor adjustment Damage=" $ InDamage @ "Momentum=" $ Momentum @ "Zone=" $ HitInfo.BoneName @ "DamageType=" $ DamageType, bLogTakeDamage);
}

function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource)
{
	local int HitZoneIdx, ArmorZoneIdx;
	local name IntendedArmorZoneName;
	local int ArmorDamage;

	//Make sure this hit zone is valid
	HitZoneIdx = HitZones.Find('ZoneName', BoneName);
	if (HitZoneIdx >= 0)
	{
		//Lookup valid armor zone if it exists in our armor list
		ArmorZoneIdx = INDEX_NONE;
		if (ArmorHitzoneNames.Find(HitZones[HitZoneIdx].ZoneName) != INDEX_NONE)
		{
			IntendedArmorZoneName = '';
			switch (HitZones[HitZoneIdx].ZoneName)
			{
			case 'head':
				IntendedArmorZoneName = 'head';
				break;
			default:
				IntendedArmorZoneName = (DamagerSource - Location) dot Vector(Rotation) >= 0 ? 'front' : '';
				break;
			}
			ArmorZoneIdx = ArmorZones.Find('ArmorZoneName', IntendedArmorZoneName);
		}

		//Now that we have an armor zone, do adjustments
		if (ArmorZoneIdx != INDEX_NONE && ArmorZones[ArmorZoneIdx].ArmorHealth > 0)
		{
			ArmorDamage = Clamp(InDamage, 0, ArmorZones[ArmorZoneIdx].ArmorHealth);
			InDamage -= ArmorDamage;
			ArmorZones[ArmorZoneIdx].ArmorHealth -= ArmorDamage;
			RepArmorPct[ArmorZoneIdx] = FloatToByte(float(ArmorZones[ArmorZoneIdx].ArmorHealth) / float(ArmorZones[ArmorZoneIdx].ArmorHealthMax));

			if (ArmorZones[ArmorZoneIdx].ArmorHealth <= 0)
			{
				ExplodeArmor(ArmorZoneIdx, IntendedArmorZoneName);
			}
		}
	}
}

function AdjustNonBoneDamage(out int InDamage)
{
	local int ValidArmorZones;
	local int ArmorReduction, ArmorRemainder, ArmorDamage;
	local int Idx;

	//Find amount of valid hit zones to split damage
	ValidArmorZones = 0;
	for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
	{
		if (ArmorZones[Idx].ArmorHealth > 0)
		{
			ValidArmorZones++;
		}
	}

	//Have some damageable zones around
	if (ValidArmorZones > 0)
	{
		//Store the initial split.  Any modulo remainder will go in a holding value until later
		//		We'll just lazily pull any remainder from surviving armor zones
		ArmorReduction = InDamage / ValidArmorZones;
		ArmorRemainder = InDamage % ValidArmorZones;

		//First pass to do split damage
		for (Idx = 0; Idx < ArmorZones.Length; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				//Find final damage value to this zone and add some into the remainder if needed
				ArmorDamage = Clamp(ArmorReduction, 0, ArmorZones[Idx].ArmorHealth);
				if (ArmorDamage < ArmorReduction)
				{
					ArmorRemainder += ArmorReduction - ArmorDamage;
				}

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
				}
			}
		}

		//Second pass to clear out remaining damage.  If anything remains after this step, it'll go out via the InDamage variable
		for (Idx = 0; Idx < ArmorZones.Length && ArmorRemainder > 0; ++Idx)
		{
			if (ArmorZones[Idx].ArmorHealth > 0)
			{
				ArmorDamage = Clamp(ArmorRemainder, 0, ArmorZones[Idx].ArmorHealth);

				//Update, do FX, etc.
				InDamage -= ArmorDamage;
				ArmorRemainder -= ArmorDamage;
				ArmorZones[Idx].ArmorHealth -= ArmorDamage;
				RepArmorPct[Idx] = FloatToByte(float(ArmorZones[Idx].ArmorHealth) / float(ArmorZones[Idx].ArmorHealthMax));

				if (ArmorZones[Idx].ArmorHealth <= 0)
				{
					ExplodeArmor(Idx, ArmorZones[Idx].ArmorZoneName);
				}
			}
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
		return CharacterArch.ImpactSkins[2];
	}
	return super.GetHitZoneSkinTypeEffects(HitZoneIdx);
}

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	local byte StatusField;

	switch (ArmorZoneName)
	{
	case 'head':
		StatusField = FrontBit;
		break;
	case 'front':
		StatusField = HeadBit;
		break;
	}

	ArmorZoneStatus = ArmorZoneStatus & StatusField;
	UpdateArmorPieces();
	KFAIController_ZedClot_AlphaKing(Controller).StartArmorLoss();
}

simulated function UpdateArmorPieces()
{
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local KFCharacterInfo_Monster MonsterArch;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterArch = GetCharacterMonsterInfo();
		switch (ArmorZoneStatus ^ PreviousArmorZoneStatus)
		{
		case HeadBit:
			Mesh.DetachComponent(StaticAttachList[0]);
			DetachComponent(StaticAttachList[0]);
			StaticAttachList.Remove(0, 1);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[0].SocketName, SocketLocation, SocketRotation);

			if(MonsterArch.ExtraVFX.length > 0)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0], SocketLocation, SocketRotation);
			}

			PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			break;
		case FrontBit:
			DetachComponent(ThirdPersonAttachments[0]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);

			if(MonsterArch.ExtraVFX.length > 1)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1], SocketLocation, SocketRotation);
			}

			PlaySoundBase(default.ArmorZones[1].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[0] = none;
			break;
		default:
			//Nothing changed
			break;
		}
	}

	PreviousArmorZoneStatus = ArmorZoneStatus;
}

function InitArmor()
{
	local KFGameInfo KFGI;
	local float HealthMod;
	local float HeadHealthMod;
	local int i;

	KFGI = KFGameInfo(WorldInfo.Game);
	if (KFGI != None)
	{
		HealthMod = 1.f;
		HeadHealthMod = 1.f;
		KFGI.DifficultyInfo.GetAIHealthModifier(self, KFGI.GameDifficulty, KFGI.GetLivingPlayerCount(), HealthMod, HeadHealthMod);

		for (i = 0; i < ArmorZones.Length; ++i)
		{
			ArmorZones[i].ArmorHealth *= HealthMod;
			ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
			RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
		}
	}
}

function SetShieldScale(float InScale)
{
	local int i;

	ArmorScale = InScale;
	for (i = 0; i < ArmorZones.Length; ++i)
	{
		ArmorZones[i].ArmorHealth *= InScale;
		ArmorZones[i].ArmorHealthMax = ArmorZones[i].ArmorHealth;
		RepArmorPct[i] = FloatToByte(float(ArmorZones[i].ArmorHealth) / float(ArmorZones[i].ArmorHealthMax));
	}
}

simulated function SetEnraged(bool bNewEnraged)
{
	if (Role == ROLE_Authority)
	{
		PlaySoundBase(EnragedSoundEvent);
		bIsEnraged = bNewEnraged;
		if (MyKFAIC.bCanSprint)
		{
			SetSprinting(true);
		}
	}
}

defaultproperties
{
	ArmorZoneStatus=3
	PreviousArmorZoneStatus=3

	LocalizationKey=KFPawn_ZedClot_AlphaKing
	MonsterArchPath="ZED_ARCH.ZED_Clot_AlphaKing_Archetype"
	ControllerClass=class'KFAIController_ZedClot_AlphaKing'
	DifficultySettings=class'KFDifficulty_ClotAlphaKing'

	Health=300 //100

	OverrideArmorFXIndex=200

	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=125, DmgScale=1.1, SkinID=1)

	// Spawning
    MinSpawnSquadSizeType=EST_Medium

    // Movement Physics
	GroundSpeed=180.f //210.f
	SprintSpeed=450.f //500.f

	//Gameplay
	Begin Object Name=MeleeHelper_0
		BaseDamage=8.f //6.f
		MaxHitRange=172.f
		MomentumTransfer=25000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object

	// Incap Settings
	// for reference: Vulnerability=(default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(2.0, 2.0, 1.0, 1.0, 1.0), Cooldown=3.0,  Duration=3.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(1.f),                     Cooldown=1.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(1.3f),                    Cooldown=0.2)
	IncapSettings(AF_GunHit)=	(Vulnerability=(2.5),                     Cooldown=0.2)
	IncapSettings(AF_MeleeHit)= (Vulnerability=(2.0),                     Cooldown=0.0)
	IncapSettings(AF_Poison)=	(Vulnerability=(3),	                      Cooldown=6.0,  Duration=3.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(0.5),	                  Cooldown=10.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(1.5),                     Cooldown=7.0,  Duration=5)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0,  Duration=5.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(2.5),                     Cooldown=1.5,  Duration=4.0)
	IncapSettings(AF_Snare)=	(Vulnerability=(10.0, 10.0, 10.0, 10.0),  Cooldown=5.5,  Duration=4.0)
    IncapSettings(AF_Bleed)=    (Vulnerability=(2.0))

	ParryResistance=0

	// ---------------------------------------------
	// Resistance & Vulnerability
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(1.5)))  //3.0
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(1.01)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(1.0)))  //0.76
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing', 	                DamageScale=(0.85))) //0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(0.9))) //0.75
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(3.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.25)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(1.0))) //0.88
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bleeding', 	                DamageScale=(1.0)))


	EnragedSoundEvent=AkEvent'WW_ZED_Clot_Alpha.Play_Alpha_Clot_Special_Enrage'

	// Mapping between armor piece and hit zones to block pawn damage hitting active armor and apply that damage to the armor
    ArmorHitzoneNames.Add(head)
    ArmorHitzoneNames.Add(chest)
    ArmorHitzoneNames.Add(heart)
    ArmorHitzoneNames.Add(stomach)
    ArmorHitzoneNames.Add(abdomen)

    //Armor info
    ArmorZones.Add((ArmorZoneName=head,SocketName=FX_Armor_Head,ArmorHealth=450,ArmorHealthMax=450,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo')) //ArmorHealth=20, ArmorHealthMax=20
    ArmorZones.Add((ArmorZoneName=front,SocketName=FX_Armor_Chest,ArmorHealth=500,ArmorHealthMax=500,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo')) //ArmorHealth=40, ArmorHealthMax=40
	ArmorScale=1.f
	RepArmorPct[0]=255
	RepArmorPct[1]=255
}
