//=============================================================================
// KFDT_DemoNuke_Toxic
//=============================================================================
// Demolitionist's Nuke skill radiaten DamageType
// @note: In KFGame.u because it's references by the Demo perk
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Chris "Schneidzekk" Schneider
//=============================================================================

class KFDT_Toxic_DemoNuke extends KFDT_Toxic
	hidedropdown;

defaultproperties
{
   DoT_Type=DOT_None
   KnockdownPower=55
   StumblePower=48
   LegStumblePower=48
   bNoInstigatorDamage=True
   Name="Default__KFDT_Toxic_DemoNuke"
   ObjectArchetype=KFDT_Toxic'KFGame.Default__KFDT_Toxic'
}
