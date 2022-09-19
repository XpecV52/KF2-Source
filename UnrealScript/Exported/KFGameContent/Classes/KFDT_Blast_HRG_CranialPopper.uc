//=============================================================================
// KFDT_Blast_HRG_CranialPopper
//=============================================================================
// Damage caused by the cranial popper alternate fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Blast_HRG_CranialPopper extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;


static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
    switch ( InHitZoneName )
    {
    case 'head':
        return false; //true to dismember
    }

    return false;
}

/**
* Allows the damage type to customize exactly which hit zones it can dismember while the zed is alive
*/
//static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
//{
//    switch ( InHitZoneName )
//    {
//    case 'head':
//        return true;
//    }
//
//    return false;
//}

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_CranialPopper'
   bCanGib=True
   GoreDamageGroup=DGT_Obliteration
   StunPower=250.000000
   StumblePower=0.000000
   GunHitPower=0.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Sharpshooter'
   bExtraMomentumZ=True
   KDamageImpulse=0.000000
   KDeathVel=300.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=1500.000000
   Name="Default__KFDT_Blast_HRG_CranialPopper"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
