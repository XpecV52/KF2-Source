//=============================================================================
// KFDT_Ballistic_ChiappaRhino
//=============================================================================
// Pistol damage type for the Chiappa Rhino pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_ChiappaRhino extends KFDT_Ballistic_Handgun
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
   WeaponDef=Class'KFGame.KFWeapDef_ChiappaRhino'
   KnockdownPower=15.000000
   StumblePower=20.000000
   GunHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=2000.000000
   KDeathVel=200.000000
   KDeathUpKick=-450.000000
   Name="Default__KFDT_Ballistic_ChiappaRhino"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
