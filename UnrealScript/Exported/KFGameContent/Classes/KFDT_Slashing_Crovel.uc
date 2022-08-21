//=============================================================================
// KFDT_Bludgeon_Crovel
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Slashing_Crovel extends KFDT_Slashing
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Crovel'
   StumblePower=50.000000
   MeleeHitPower=50.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   KDamageImpulse=1250.000000
   KDeathVel=250.000000
   KDeathUpKick=500.000000
   Name="Default__KFDT_Slashing_Crovel"
   ObjectArchetype=KFDT_Slashing'KFGame.Default__KFDT_Slashing'
}
