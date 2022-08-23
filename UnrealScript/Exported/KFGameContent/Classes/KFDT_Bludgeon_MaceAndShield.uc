//=============================================================================
// KFDT_Bludgeon_MaceAndShield
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_MaceAndShield extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MaceAndShield'
   EffectGroup=FXG_MetalMace
   KnockdownPower=50.000000
   StumblePower=300.000000
   MeleeHitPower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=4000.000000
   KDeathVel=575.000000
   KDeathUpKick=700.000000
   Name="Default__KFDT_Bludgeon_MaceAndShield"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
