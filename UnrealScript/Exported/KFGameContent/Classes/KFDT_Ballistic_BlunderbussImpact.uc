//=============================================================================
// KFDT_Ballistic_BlunderbussImpact
//=============================================================================
// Killing Floor 2
// Copyright (C) 2020 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive
//=============================================================================

class KFDT_Ballistic_BlunderbussImpact extends KFDT_Ballistic_Shell
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Blunderbuss'
   KnockdownPower=200.000000
   StumblePower=400.000000
   GunHitPower=300.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDamageImpulse=2000.000000
   KDeathVel=1500.000000
   KDeathUpKick=750.000000
   Name="Default__KFDT_Ballistic_BlunderbussImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
