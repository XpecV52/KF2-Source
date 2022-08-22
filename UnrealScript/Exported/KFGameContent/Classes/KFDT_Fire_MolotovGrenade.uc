//=============================================================================
// KFDT_Fire_MolotovGrenade
//=============================================================================
// Damage type class for molotov grenade
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Jeff Robinson
//=============================================================================

class KFDT_Fire_MolotovGrenade extends KFDT_Fire
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
   bIgnoreSelfInflictedScale=False
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.500000
   StumblePower=100.000000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_MolotovGrenade"
   ObjectArchetype=KFDT_Fire'KFGame.Default__KFDT_Fire'
}
