//=============================================================================
// KFDT_Ballistic_Frost_Shotgun_Axe
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_Frost_Shotgun_Axe extends KFDT_Ballistic_Shotgun
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
   WeaponDef=Class'KFGame.KFWeapDef_Rifle_FrostShotgunAxe'
   EffectGroup=FXG_Freeze
   StumblePower=20.000000
   GunHitPower=20.000000
   FreezePower=11.000000
   ModifierPerkList(1)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=2500.000000
   KDeathVel=650.000000
   KDeathUpKick=800.000000
   Name="Default__KFDT_Ballistic_Frost_Shotgun_Axe"
   ObjectArchetype=KFDT_Ballistic_Shotgun'kfgamecontent.Default__KFDT_Ballistic_Shotgun'
}
