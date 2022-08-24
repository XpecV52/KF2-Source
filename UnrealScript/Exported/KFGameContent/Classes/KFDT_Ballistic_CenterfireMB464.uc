//=============================================================================
// KFDT_Ballistic_CenterfireMB464
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Ballistic_CenterfireMB464 extends KFDT_Ballistic_Rifle
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
	 		return true;
	}

	return false;
}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_CenterfireMB464'
   StunPower=25.000000
   KnockdownPower=20.000000
   StumblePower=85.000000
   GunHitPower=80.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=2000.000000
   KDeathVel=250.000000
   KDeathUpKick=400.000000
   Name="Default__KFDT_Ballistic_CenterfireMB464"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}