//=============================================================================
// KFDT_Ballistic_HRGScorcherBrokenImpact
//=============================================================================
// Damage caused by heat and combustion
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// Roberto Moreno (Saber Interactive)
//=============================================================================
class KFDT_Ballistic_HRGScorcherBrokenImpact extends KFDT_Ballistic_Handgun
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGScorcher'
   EffectGroup=FXG_Flare
   StumblePower=200.000000
   GunHitPower=150.000000
   BurnPower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   CameraLensEffectTemplate=Class'KFGame.KFCameraLensEmit_Fire'
   KDamageImpulse=1000.000000
   KDeathVel=10.000000
   KDeathUpKick=120.000000
   Name="Default__KFDT_Ballistic_HRGScorcherBrokenImpact"
   ObjectArchetype=KFDT_Ballistic_Handgun'kfgamecontent.Default__KFDT_Ballistic_Handgun'
}
