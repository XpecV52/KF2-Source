//=============================================================================
// KFDT_Ballistic_HRG_Stunner
//=============================================================================
// Damage type class for the HRG Stunner
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_HRG_Stunner extends KFDT_Ballistic_Submachinegun
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
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Stunner'
   KnockdownPower=25.000000
   StumblePower=35.000000
   GunHitPower=25.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   GibImpulseScale=1.000000
   BloodSpread=0.400000
   BloodScale=0.600000
   KDamageImpulse=1500.000000
   KDeathVel=600.000000
   KDeathUpKick=-1000.000000
   Name="Default__KFDT_Ballistic_HRG_Stunner"
   ObjectArchetype=KFDT_Ballistic_Submachinegun'kfgamecontent.Default__KFDT_Ballistic_Submachinegun'
}
