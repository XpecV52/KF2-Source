//=============================================================================
// KFDT_Ballistic_M99
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_M99 extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

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
   WeaponDef=Class'KFGame.KFWeapDef_M99'
   StunPower=15.000000
   KnockdownPower=20.000000
   StumblePower=0.000000
   GunHitPower=80.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   KDamageImpulse=2250.000000
   KDeathVel=250.000000
   KDeathUpKick=-400.000000
   Name="Default__KFDT_Ballistic_M99"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
