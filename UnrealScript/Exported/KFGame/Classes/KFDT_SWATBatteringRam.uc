//=============================================================================
// KFDT_SWATBatteringRam
//=============================================================================
// Used for the SWAT level 25 ZED TIME - Battering Ram Perk skill
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_SWATBatteringRam extends KFDT_Bludgeon
	abstract;

defaultproperties
{
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   KDeathVel=1000.000000
   KDeathUpKick=4000.000000
   Name="Default__KFDT_SWATBatteringRam"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
