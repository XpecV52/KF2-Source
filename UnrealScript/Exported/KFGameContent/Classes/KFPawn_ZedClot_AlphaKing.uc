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

	if (bLogTakeDamage) LogInternal(self @ GetFuncName() @ " After armor adjustment Damage=" $ InDamage @ "Momentum=" $ Momentum @ "Zone=" $ HitInfo.BoneName @ "DamageType=" $ DamageType);
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
   ArmorHitzoneNames(0)="head"
   ArmorHitzoneNames(1)="chest"
   ArmorHitzoneNames(2)="heart"
   ArmorHitzoneNames(3)="stomach"
   ArmorHitzoneNames(4)="abdomen"
   ArmorZones(0)=(ArmorZoneName="head",SocketName="FX_Armor_Head",ArmorHealth=450,ArmorHealthMax=450,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo')
   ArmorZones(1)=(ArmorZoneName="Front",SocketName="FX_Armor_Chest",ArmorHealth=500,ArmorHealthMax=500,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo')
   ArmorScale=1.000000
   RepArmorPct(0)=255
   RepArmorPct(1)=255
   ArmorZoneStatus=3
   PreviousArmorZoneStatus=3
   OverrideArmorFXIndex=200
   EnragedSoundEvent=AkEvent'WW_ZED_Clot_Alpha.Play_Alpha_Clot_Special_Enrage'
   MonsterArchPath="ZED_ARCH.ZED_Clot_AlphaKing_Archetype"
   MinSpawnSquadSizeType=EST_Medium
   Begin Object Class=KFMeleeHelperAI Name=MeleeHelper_0 Archetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Alpha:MeleeHelper_0'
      BaseDamage=8.000000
      MyDamageType=Class'kfgamecontent.KFDT_Slashing_ZedWeak'
      MomentumTransfer=25000.000000
      MaxHitRange=172.000000
      Name="MeleeHelper_0"
      ObjectArchetype=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_Alpha:MeleeHelper_0'
   End Object
   MeleeAttackHelper=KFMeleeHelperAI'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:MeleeHelper_0'
   DamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(1.500000))
   DamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle')
   DamageTypeModifiers(17)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun')
   DamageTypeModifiers(18)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(1.010000))
   DamageTypeModifiers(19)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   DamageTypeModifiers(20)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.850000))
   DamageTypeModifiers(21)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.900000))
   DamageTypeModifiers(22)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(3.000000))
   DamageTypeModifiers(23)=(DamageType=Class'kfgamecontent.KFDT_Microwave',DamageScale=(0.250000))
   DamageTypeModifiers(24)=(DamageType=Class'KFGame.KFDT_Explosive')
   DamageTypeModifiers(25)=(DamageType=Class'KFGame.KFDT_Piercing')
   DamageTypeModifiers(26)=(DamageType=Class'KFGame.KFDT_Toxic')
   DamageTypeModifiers(27)=(DamageType=Class'KFGame.KFDT_Bleeding')
   DifficultySettings=Class'kfgamecontent.KFDifficulty_ClotAlphaKing'
   LocalizationKey="KFPawn_ZedClot_AlphaKing"
   Begin Object Class=SkeletalMeshComponent Name=ThirdPersonHead0 Archetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:ThirdPersonHead0'
      ReplacementPrimitive=None
      bAcceptsDynamicDecals=True
      Name="ThirdPersonHead0"
      ObjectArchetype=SkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:ThirdPersonHead0'
   End Object
   ThirdPersonHeadMeshComponent=ThirdPersonHead0
   HitZones(0)=(GoreHealth=125)
   HitZones(1)=()
   HitZones(2)=()
   HitZones(3)=()
   HitZones(4)=()
   HitZones(5)=()
   HitZones(6)=()
   HitZones(7)=()
   HitZones(8)=()
   HitZones(9)=()
   HitZones(10)=()
   HitZones(11)=()
   HitZones(12)=()
   HitZones(13)=()
   HitZones(14)=()
   HitZones(15)=()
   HitZones(16)=()
   HitZones(17)=()
   Begin Object Class=KFAfflictionManager Name=Afflictions_0 Archetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Afflictions_0'
      FireFullyCharredDuration=2.500000
      FireCharPercentThreshhold=0.250000
      Name="Afflictions_0"
      ObjectArchetype=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Afflictions_0'
   End Object
   AfflictionHandler=KFAfflictionManager'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:Afflictions_0'
   SprintSpeed=450.000000
   Begin Object Class=KFSkeletalMeshComponent Name=FirstPersonArms Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FirstPersonArms'
      bIgnoreControllersWhenNotRendered=True
      bOverrideAttachmentOwnerVisibility=True
      bAllowBooleanPreshadows=False
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bAllowPerObjectShadows=True
      Name="FirstPersonArms"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FirstPersonArms'
   End Object
   ArmsMesh=FirstPersonArms
   Begin Object Class=KFSpecialMoveHandler Name=SpecialMoveHandler_0 Archetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:SpecialMoveHandler_0'
      SpecialMoveClasses(0)=None
      SpecialMoveClasses(1)=Class'KFGame.KFSM_MeleeAttack'
      SpecialMoveClasses(2)=Class'KFGame.KFSM_DoorMeleeAttack'
      SpecialMoveClasses(3)=Class'KFGame.KFSM_GrappleCombined'
      SpecialMoveClasses(4)=Class'KFGame.KFSM_Stumble'
      SpecialMoveClasses(5)=Class'KFGame.KFSM_RecoverFromRagdoll'
      SpecialMoveClasses(6)=Class'KFGame.KFSM_RagdollKnockdown'
      SpecialMoveClasses(7)=Class'KFGame.KFSM_DeathAnim'
      SpecialMoveClasses(8)=Class'KFGame.KFSM_Stunned'
      SpecialMoveClasses(9)=Class'KFGame.KFSM_Frozen'
      SpecialMoveClasses(10)=Class'kfgamecontent.KFSM_GorgeVictim'
      SpecialMoveClasses(11)=Class'KFGame.KFSM_Emerge'
      SpecialMoveClasses(12)=None
      SpecialMoveClasses(13)=Class'KFGame.KFSM_Zed_Taunt'
      SpecialMoveClasses(14)=Class'KFGame.KFSM_Zed_WalkingTaunt'
      SpecialMoveClasses(15)=Class'KFGame.KFSM_Evade'
      SpecialMoveClasses(16)=Class'kfgamecontent.KFSM_Evade_Fear'
      SpecialMoveClasses(17)=None
      SpecialMoveClasses(18)=None
      SpecialMoveClasses(19)=Class'kfgamecontent.KFSM_AlphaRally'
      SpecialMoveClasses(20)=None
      SpecialMoveClasses(21)=None
      SpecialMoveClasses(22)=None
      SpecialMoveClasses(23)=None
      SpecialMoveClasses(24)=None
      SpecialMoveClasses(25)=None
      SpecialMoveClasses(26)=None
      SpecialMoveClasses(27)=None
      SpecialMoveClasses(28)=None
      SpecialMoveClasses(29)=None
      SpecialMoveClasses(30)=None
      SpecialMoveClasses(31)=None
      SpecialMoveClasses(32)=None
      SpecialMoveClasses(33)=None
      SpecialMoveClasses(34)=None
      SpecialMoveClasses(35)=Class'KFGame.KFSM_Zed_Boss_Theatrics'
      Name="SpecialMoveHandler_0"
      ObjectArchetype=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:SpecialMoveHandler_0'
   End Object
   SpecialMoveHandler=KFSpecialMoveHandler'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:SpecialMoveHandler_0'
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_1 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_1'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="AmbientAkSoundComponent_1"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_1'
   End Object
   AmbientAkComponent=AmbientAkSoundComponent_1
   Begin Object Class=AkComponent Name=AmbientAkSoundComponent_0 Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_0'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="AmbientAkSoundComponent_0"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:AmbientAkSoundComponent_0'
   End Object
   WeaponAkComponent=AmbientAkSoundComponent_0
   Begin Object Class=KFWeaponAmbientEchoHandler Name=WeaponAmbientEchoHandler_0 Archetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:WeaponAmbientEchoHandler_0'
      Name="WeaponAmbientEchoHandler_0"
      ObjectArchetype=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_Alpha:WeaponAmbientEchoHandler_0'
   End Object
   WeaponAmbientEchoHandler=KFWeaponAmbientEchoHandler'kfgamecontent.Default__KFPawn_ZedClot_AlphaKing:WeaponAmbientEchoHandler_0'
   Begin Object Class=AkComponent Name=FootstepAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FootstepAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      bForceOcclusionUpdateInterval=True
      Name="FootstepAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:FootstepAkSoundComponent'
   End Object
   FootstepAkComponent=FootstepAkSoundComponent
   Begin Object Class=AkComponent Name=DialogAkSoundComponent Archetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:DialogAkSoundComponent'
      BoneName="Dummy"
      bStopWhenOwnerDestroyed=True
      Name="DialogAkSoundComponent"
      ObjectArchetype=AkComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:DialogAkSoundComponent'
   End Object
   DialogAkComponent=DialogAkSoundComponent
   GroundSpeed=180.000000
   Health=300
   ControllerClass=Class'kfgamecontent.KFAIController_ZedClot_AlphaKing'
   Begin Object Class=KFSkeletalMeshComponent Name=KFPawnSkeletalMeshComponent Archetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:KFPawnSkeletalMeshComponent'
      WireframeColor=(B=0,G=255,R=255,A=255)
      MinDistFactorForKinematicUpdate=0.200000
      bSkipAllUpdateWhenPhysicsAsleep=True
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bUpdateKinematicBonesFromAnimation=False
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Pawn
      RBDominanceGroup=20
      bOwnerNoSee=True
      bAcceptsDynamicDecals=True
      bUseOnePassLightingOnTranslucency=True
      CollideActors=True
      BlockZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,Pawn=True,Vehicle=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-86.000000)
      ScriptRigidBodyCollisionThreshold=200.000000
      PerObjectShadowCullDistance=2500.000000
      bAllowPerObjectShadows=True
      TickGroup=TG_DuringAsyncWork
      Name="KFPawnSkeletalMeshComponent"
      ObjectArchetype=KFSkeletalMeshComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:KFPawnSkeletalMeshComponent'
   End Object
   Mesh=KFPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:CollisionCylinder'
      CollisionHeight=86.000000
      CollisionRadius=36.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Sprite'
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Pawns"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'kfgamecontent.Default__KFPawn_ZedClot_Alpha:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=KFPawnSkeletalMeshComponent
   Components(4)=AmbientAkSoundComponent_0
   Components(5)=AmbientAkSoundComponent_1
   Components(6)=FootstepAkSoundComponent
   Components(7)=DialogAkSoundComponent
   CollisionComponent=CollisionCylinder
   Name="Default__KFPawn_ZedClot_AlphaKing"
   ObjectArchetype=KFPawn_ZedClot_Alpha'kfgamecontent.Default__KFPawn_ZedClot_Alpha'
}
