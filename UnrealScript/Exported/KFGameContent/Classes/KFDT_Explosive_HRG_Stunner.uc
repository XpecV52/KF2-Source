//=============================================================================
// KFDT_Explosive_HRG_Stunner
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HRG_Stunner extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_Stunner'
   bShouldSpawnPersistentBlood=True
   StunPower=160.000000
   StumblePower=40.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_HRG_Stunner"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
