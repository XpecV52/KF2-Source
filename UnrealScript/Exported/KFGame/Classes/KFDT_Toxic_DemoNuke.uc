//=============================================================================
// KFDT_DemoNuke_Toxic
//=============================================================================
// Demolitionist's Nuke skill radiation DamageType
// @note: In KFGame.u because it's references by the Demo perk
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Chris "Schneidzekk" Schneider
//=============================================================================

class KFDT_Toxic_DemoNuke extends KFDT_Toxic
	hidedropdown;

/** Nuke will always apply poison */
static function bool AlwaysPoisons()
{
	return true;
}

defaultproperties
{
   bNoInstigatorDamage=True
   bShouldSpawnPersistentBlood=True
   DoT_Type=DOT_None
   DoT_Duration=5.000000
   DoT_Interval=0.300000
   PoisonPower=1000.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Demolitionist'
   KDeathVel=300.000000
   KDeathUpKick=1000.000000
   RadialDamageImpulse=3000.000000
   Name="Default__KFDT_Toxic_DemoNuke"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
