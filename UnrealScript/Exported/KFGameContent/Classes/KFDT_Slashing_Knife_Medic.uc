//=============================================================================
// KFDT_Slashing_Knife_Medic
//=============================================================================
// Class Description
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Christian "schneidzekk" Schneider 1/8/2015
//=============================================================================

class KFDT_Slashing_Knife_Medic extends KFDT_Slashing_Knife
	abstract
	hidedropdown;

/** Whether this damage type can apply damage over time */
static function bool CanApplyDamageOverTime( out int InDamage, out class<KFDamageType> KFDT, optional Controller InstigatedBy ) 
{
	return class'KFDT_Ballistic_Assault_Medic'.static.CheckMedicToxic( InDamage, KFDT, InstigatedBy );
}

defaultproperties
{
   GunHitPower=44.000000
   Name="Default__KFDT_Slashing_Knife_Medic"
   ObjectArchetype=KFDT_Slashing_Knife'kfgamecontent.Default__KFDT_Slashing_Knife'
}
