//=============================================================================
// KFDT_Bludgeon_PatriarchKick
//=============================================================================
// Mech leg kick bludgeon damage from Patriarch
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_PatriarchKick extends KFDT_Bludgeon_Patriarch
	abstract;
















































































































































































































































































































































































































































































































































										  















										  








































































#linenumber 12

static function int GetKillerDialogID()
{
	return 12;
}

defaultproperties
{
   OverrideImpactSound=AkEvent'WW_Skin_Impacts.Play_Player_Damage_Pat_Leg_2D'
   Name="Default__KFDT_Bludgeon_PatriarchKick"
   ObjectArchetype=KFDT_Bludgeon_Patriarch'kfgamecontent.Default__KFDT_Bludgeon_Patriarch'
}
