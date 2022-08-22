//=============================================================================
// KFPawn_ZedClot_Alpha
//=============================================================================
// Alpha clot
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedClot_Alpha extends KFPawn_ZedClot;

/** TRUE when difficulty has dictated that this is a special Alpha type */
var repnotify protected bool bIsSpecialAlpha;

/** Self-rally damage modifiers */
var protected float SelfRallyDealtDamageModifier;
var protected float SelfRallyTakenDamageModifier;

/** If TRUE, this rally was applied to ourselves */
var bool bWasSelfRally;

replication
{
	if( bNetInitial )
		bIsSpecialAlpha;
}

simulated event ReplicatedEvent( name VarName )
{
	if( VarName == nameOf(bIsSpecialAlpha) )
	{
		UpdateBodyMIC();
		return;
	}

	super.ReplicatedEvent( VarName );
}

/** Called immediately after gameplay begins */
simulated event PostBeginPlay()
{
	local class<KFDifficulty_ClotAlpha> MyDifficultySettings;
	local KFGameReplicationInfo KFGRI;

	super.PostBeginPlay();

	if( bIsSpecialAlpha )
	{
		MyDifficultySettings = class<KFDifficulty_ClotAlpha>( DifficultySettings );
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
	}
}

event PossessedBy( Controller C, bool bVehicleTransition )
{
	local KFAIController_ZedClot_Alpha AlphaController;

	super.PossessedBy( C, bVehicleTransition );

	// Initialize our rally settings
	AlphaController = KFAIController_ZedClot_Alpha( MyKFAIC );
	if( AlphaController != none )
	{
		AlphaController.InitRallySettings();
		if( AlphaController.IsSpecialAlpha() )
		{
			bIsSpecialAlpha = true;
			if( WorldInfo.NetMode != NM_DedicatedServer )
			{
				UpdateBodyMIC();
			}
		}
	}
}

/** If true, assign custom player controlled skin when available */
simulated event bool UsePlayerControlledZedSkin()
{
	return bIsSpecialAlpha || super.UsePlayerControlledZedSkin();
}

/** Change body MIC if we're a special alpha */
simulated protected function UpdateBodyMIC()
{
	if( GetCharacterMonsterInfo() != none )
	{
		CharacterMICs[0].SetParent( GetCharacterMonsterInfo().PlayerControlledSkins[0] );
	}
}

/** Applies the rally buff and spawns a rally effect */
simulated function Rally(
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
	super.Rally( RallyInstigator, RallyEffect, EffectBoneName, EffectOffset, AltRallyEffect, AltEffectBoneNames, AltEffectOffset, bSkipEffects );

	if( RallyInstigator == self )
	{
		bWasSelfRally = true;
	}
	else
	{
		bWasSelfRally = false;
	}
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
	DifficultySettings=class'KFDifficulty_ClotAlpha'

	// ---------------------------------------------
	// Gameplay
	GrabAttackFrequency=0.33f

	// ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Rally)=class'KFSM_AlphaRally'
	End Object

	// ---------------------------------------------
	// Incap Settings
	// for reference: Vulnerability=(default, head, legs, arms, special)
	IncapSettings(AF_Stun)=		(Vulnerability=(2.0, 2.0, 1.0, 1.0, 1.0), Cooldown=3.0,  Duration=3.0)
	IncapSettings(AF_Knockdown)=(Vulnerability=(1.f),                     Cooldown=1.0)
	IncapSettings(AF_Stumble)=	(Vulnerability=(1.3f),                    Cooldown=0.2)
	IncapSettings(AF_GunHit)=	(Vulnerability=(2.5),                     Cooldown=0.2)
	IncapSettings(AF_MeleeHit)= (Vulnerability=(2.0),                     Cooldown=0.0)
	IncapSettings(AF_Poison)=	(Vulnerability=(3),	                      Cooldown=6.0,  Duration=3.0)
	IncapSettings(AF_Microwave)=(Vulnerability=(0.0),	                  Cooldown=10.0, Duration=2.0)
	IncapSettings(AF_FirePanic)=(Vulnerability=(1.5),                     Cooldown=7.0,  Duration=5)
	IncapSettings(AF_EMP)=		(Vulnerability=(2.5),                     Cooldown=5.0,  Duration=5.0)
	IncapSettings(AF_Freeze)=	(Vulnerability=(2.5),                     Cooldown=1.5,  Duration=2.0)
	IncapSettings(AF_Snare)=	(Vulnerability=(10.0, 10.0, 10.0, 10.0),  Cooldown=5.5,  Duration=4.0)
	
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
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.25)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(1.0))) //0.88

	// ---------------------------------------------
	// Special Case
	DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing_Knife',              DamageScale=(1.0)) //0.95

	// ---------------------------------------------
	// Movement Physics
	GroundSpeed=210.f
	SprintSpeed=500.f

	RotationRate=(Pitch=50000,Yaw=45000,Roll=50000)

	// ---------------------------------------------
	// AI / Navigation
	ControllerClass=class'KFAIController_ZedClot_Alpha'
	DamageRecoveryTimeHeavy=0.75f
	DamageRecoveryTimeMedium=1.0f
	
	KnockdownImpulseScale=1.0f

`if(`notdefined(ShippingPC))
	DebugRadarTexture=Texture2D'UI_ZEDRadar_TEX.MapIcon_Clot';
`endif
}
