//=============================================================================
// KFDT_DemoNuke_Toxic_Lingering
//=============================================================================
// Demolitionist's Nuke skill radiation DamageType
// @note: In KFGame.u because it's references by the Demo perk
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Chris "Schneidzekk" Schneider
//=============================================================================

class KFDT_DemoNuke_Toxic_Lingering extends KFDT_Toxic_DemoNuke
	hidedropdown;

/** Nuke will always apply poison */
static function bool AlwaysPoisons()
{
	return true;
}

defaultproperties
{
   DoT_Type=DOT_Toxic
   DoT_DamageScale=1.000000
   Name="Default__KFDT_DemoNuke_Toxic_Lingering"
   ObjectArchetype=KFDT_Toxic_DemoNuke'KFGame.Default__KFDT_Toxic_DemoNuke'
}
