//=============================================================================
// KFDT_Freeze_FreezeGrenade
//=============================================================================
// Freeze damage from freeze grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Freeze_FreezeGrenade extends KFDT_Freeze
	abstract
	hidedropdown;

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
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Sharpshooter'
   MeleeHitPower=100.000000
   FreezePower=100.000000
   KDeathVel=300.000000
   Name="Default__KFDT_Freeze_FreezeGrenade"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
