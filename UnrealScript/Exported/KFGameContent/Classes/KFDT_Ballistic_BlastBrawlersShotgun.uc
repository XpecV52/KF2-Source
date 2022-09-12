//=============================================================================
// KFDT_Ballistic_BlastBrawlersShotgun
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_BlastBrawlersShotgun extends KFDT_Ballistic_Shotgun
	abstract
	hidedropdown;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_BlastBrawlers'
   StumblePower=12.000000
   GunHitPower=12.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   OverrideImpactEffect=ParticleSystem'WEP_HRG_BlastBrawlers_EMIT.FX_BlastBrawlers_Impact'
   KDamageImpulse=900.000000
   KDeathVel=350.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Ballistic_BlastBrawlersShotgun"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
