//=============================================================================
// KFDT_Microwave_Blast
//=============================================================================
// Damage caused by the microwave gun alternate fire
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Microwave_Blast extends KFDT_Microwave
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_MicrowaveGun'
   bCanGib=True
   EffectGroup=FXG_MicrowaveBlast
   GoreDamageGroup=DGT_Obliteration
   KnockdownPower=200.000000
   MicrowavePower=100.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   bExtraMomentumZ=True
   KDamageImpulse=0.000000
   KDeathVel=300.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=5000.000000
   Name="Default__KFDT_Microwave_Blast"
   ObjectArchetype=KFDT_Microwave'kfgamecontent.Default__KFDT_Microwave'
}
