//=============================================================================
// KFDT_Explosive_FlashBangGrenade
//=============================================================================
// Explosive damage type for high explosive grenades
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Chris "schneidzekk" Schneider
//=============================================================================

class KFDT_Explosive_FlashBangGrenade extends KFDT_Explosive
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_Grenade_SWAT'
   bNoInstigatorDamage=True
   bShouldSpawnPersistentBlood=True
   StunPower=400.000000
   KnockdownPower=0.000000
   StumblePower=200.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   ScreenMaterialName="Effect_FlashBang"
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Explosive_FlashBangGrenade"
   ObjectArchetype=KFDT_Explosive'KFGame.Default__KFDT_Explosive'
}
