//=============================================================================
// KFDT_Freeze_FreezeThrower
//=============================================================================
// Freeze damage from freeze thrower
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Freeze_FreezeThrower extends KFDT_Freeze
	abstract;

/** Play damage type specific impact effects when taking damage */
static function PlayImpactHitEffects( KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator )
{
	local float ParamValue;

	// If we're dead and not already frozen (prevents re-shattering)
	if ( P.bPlayedDeath 
		&& P.CharacterMICs.Length > 0 
		&& P.CharacterMICs[0].GetScalarParameterValue('Scalar_Ice', ParamValue))
	{
		if (ParamValue == 0)
		{
			PlayShatter(P, false, (P.WorldInfo.TimeSeconds - P.TimeOfDeath) > 0.5f, HitDirection * default.KDeathVel);
			return;
		}
	}

	Super.PlayImpactHitEffects(P, HitLocation, HitDirection, HitZoneIndex, HitInstigator);
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FreezeThrower'
   DoT_Type=DOT_Fire
   MeleeHitPower=20.000000
   FreezePower=12.500000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   KDeathVel=300.000000
   Name="Default__KFDT_Freeze_FreezeThrower"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
