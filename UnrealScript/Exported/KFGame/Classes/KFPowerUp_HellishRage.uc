//=============================================================================
// KFPowerUp_HellishRage
//=============================================================================
// Base class for the hellish rage power up
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFPowerUp_HellishRage extends KFPowerUp;

/** Health removed from the player when the power up is activated */
var int HealthCost;

/** Damage cost applied when the power up is activated */
var class<KFDamageType> PowerUpCostDamageType;

/** Damage modifier for all damage done by the owner of this power up */
var float DamageModifier;

/** Speed modifier for run speed by the owner of this power up */
var float SpeedModifier;

/** Speed modifier for sprint speed by the owner of this power up */
var float SprintSpeedModifier;

function ActivatePowerUp()
{
	super.ActivatePowerUp();
	if(Role == Role_Authority && bPowerUpActive)
	{
		ApplyPowerUpCost();
	}
}

function ReactivatePowerUp()
{
	super.ReactivatePowerUp();
	if(Role == Role_Authority && bPowerUpActive)
	{
		ApplyPowerUpCost();
	}
}

function ApplyPowerUpCost()
{
	OwnerPawn.TakeDamage(HealthCost, OwnerPC, vect(0,0,0), vect(0,0,0), PowerUpCostDamageType);
}

function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local float TempDamage;
	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		TempDamage += InDamage * DamageModifier;
	}

	InDamage = Round( TempDamage );
}

simulated function ModifySpeed( out float Speed )
{
	Speed += Speed * SpeedModifier;
}

simulated function ModifySprintSpeed( out float Speed )
{
	Speed += Speed * SprintSpeedModifier;
}

function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{
	if( Victim != none && Victim != OwnerPawn )
	{
		Victim.ApplyDamageOverTime(SecondaryDamage, InstigatedBy, default.SecondaryDamageType);
	}
}

defaultproperties
{
   HealthCost=20
   PowerUpCostDamageType=Class'KFGame.KFDT_HellishRageCost'
   DamageModifier=0.500000
   SpeedModifier=0.250000
   SprintSpeedModifier=0.250000
   PowerUpName="Hellish Rage"
   PowerUpDuration=20.000000
   CanBeHealedWhilePowerUpIsActive=False
   SecondaryDamageType=Class'KFGame.KFDT_Fire_HellishRage'
   SecondaryDamage=50
   ScreenMaterialName="Effect_PowerUp_HellishRage"
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_PowerUp_HellishRage'
   PowerUpEffect=ParticleSystem'FX_Gameplay_EMIT.FX_Char_PowerUp_HellishRage'
   AudioLoopFirstPerson=AkEvent'WW_ENV_HellmarkStation.Play_HellishRage_1P'
   AudioLoopThirdPerson=AkEvent'WW_ENV_HellmarkStation.Play_HellishRage_3P'
   AudioLoopThirdPersonStop=AkEvent'WW_ENV_HellmarkStation.Stop_HellishRage_3P'
   AudioLoopFirstPersonStop=AkEvent'WW_ENV_HellmarkStation.Stop_HellishRage_1P'
   Name="Default__KFPowerUp_HellishRage"
   ObjectArchetype=KFPowerUp'KFGame.Default__KFPowerUp'
}
