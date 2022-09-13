//=============================================================================
// KFDT_Toxic_ParasiteSeedExplosion
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Toxic_ParasiteSeedExplosion extends KFDT_Toxic_MedicGrenade
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ParasiteImplanter'
   DoT_Duration=6.500000
   DoT_Interval=0.500000
   KnockdownPower=30.000000
   StumblePower=200.000000
   GunHitPower=100.000000
   PoisonPower=80.000000
   ModifierPerkList(1)=Class'KFGame.KFPerk_Sharpshooter'
   Name="Default__KFDT_Toxic_ParasiteSeedExplosion"
   ObjectArchetype=KFDT_Toxic_MedicGrenade'KFGame.Default__KFDT_Toxic_MedicGrenade'
}
