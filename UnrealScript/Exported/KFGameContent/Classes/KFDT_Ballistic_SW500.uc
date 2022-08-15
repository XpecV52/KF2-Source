//=============================================================================
// KFDT_Ballistic_SW500
//=============================================================================
// SW500 revolver damage type
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Ballistic_SW500 extends KFDT_Ballistic_Handgun
	abstract
	hidedropdown;






































	















#linenumber 15;

/** Allows the damage type to customize exactly which hit zones it can dismember */
static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
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
   WeaponDef=Class'KFGame.KFWeapDef_SW500'
   KnockdownPower=50
   StumblePower=60
   LegStumblePower=60
   GunHitPower=35
   GoreDamageGroup=DGT_Shotgun
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=4500.000000
   KDeathVel=350.000000
   KDeathUpKick=-700.000000
   Name="Default__KFDT_Ballistic_SW500"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
