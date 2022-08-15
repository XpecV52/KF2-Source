//=============================================================================
// KFDT_Ballistic_RPG7Impact
//=============================================================================
// Rocket impact damage type for the RPG-7 rocket launcher
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================

class KFDT_Ballistic_RPG7Impact extends KFDT_Ballistic
	abstract
	hidedropdown;
































































































	















#linenumber 15;

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
		case 'lthigh':
		case 'rthigh':
		case 'chest':
		case 'heart':
	 		return true;
	}
	return false;
}

defaultproperties
{
   AARWeaponID=18
   KnockdownPower=55
   StumblePower=48
   LegStumblePower=48
   GunHitPower=129
   EffectGroup=FXG_UnexplodedGrenade
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=3000.000000
   KDeathVel=500.000000
   KDeathUpKick=1000.000000
   Name="Default__KFDT_Ballistic_RPG7Impact"
   ObjectArchetype=KFDT_Ballistic'KFGame.Default__KFDT_Ballistic'
}
