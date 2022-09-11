//=============================================================================
// KFDT_Mine_Reconstructor_BileExplosionDoT
//=============================================================================
// Damage caused by burning from being hit by a Mine_Reconstructor bile ball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
// fferrando@saber3d
//=============================================================================

class KFDT_Mine_Reconstructor_BileExplosionDoT extends KFDamageType
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Mine_Reconstructor'
   bHasToSpawnMicrowaveFire=False
   DoT_Type=DOT_Toxic
   EffectGroup=FXG_Toxic
   DoT_Duration=4.000000
   DoT_Interval=0.500000
   DoT_DamageScale=0.100000
   PoisonPower=60.000000
   MicrowavePower=15.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_FieldMedic'
   Name="Default__KFDT_Mine_Reconstructor_BileExplosionDoT"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
