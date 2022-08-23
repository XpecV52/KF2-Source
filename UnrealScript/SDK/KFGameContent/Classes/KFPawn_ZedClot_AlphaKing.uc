//=============================================================================
// KFPawn_ZedClot_AlphaKing
//=============================================================================
// Alpha clot King
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedClot_AlphaKing extends KFPawn_ZedClot_Alpha;

/** Self-rally damage modifiers */
var protected float SelfRallyDealtDamageModifier;
var protected float SelfRallyTakenDamageModifier;

/** If TRUE, this rally was applied to ourselves */
var protected bool bWasSelfRally;

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

defaultproperties
{
	LocalizationKey=KFPawn_ZedClot_AlphaKing
	CharacterMonsterArch=KFCharacterInfo_Monster'ZED_Clot_ARCH.ZED_Clot_AlphaKing_Archetype'
	ControllerClass=class'KFAIController_ZedClot_AlphaKing'
	DifficultySettings=class'KFDifficulty_ClotAlphaKing'


	Health=300 //100

	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=125, DmgScale=1.1, SkinID=1)
}