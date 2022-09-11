//=============================================================================
// KFDT_Fire_Ground_MolotovGrenade
//=============================================================================
// Damage type class for molotov grenade ground fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFDT_Fire_Ground_MolotovGrenade extends KFDT_Fire_Ground
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_Firebug'
   bIgnoreSelfInflictedScale=False
   DoT_Duration=3.000000
   DoT_Interval=0.500000
   StumblePower=100.000000
   BurnPower=10.000000
   Name="Default__KFDT_Fire_Ground_MolotovGrenade"
   ObjectArchetype=KFDT_Fire_Ground'KFGame.Default__KFDT_Fire_Ground'
}
