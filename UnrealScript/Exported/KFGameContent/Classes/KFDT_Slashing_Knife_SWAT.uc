//=============================================================================
// KFDT_Slashing_Knife_SWAT
//=============================================================================
// Slashing damagetype for SWAT knife
//=============================================================================
// Killing Floor 2
// Copyright (C) 2016 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================

class KFDT_Slashing_Knife_SWAT extends KFDT_Slashing_Knife
	abstract
	hidedropdown;

defaultproperties
{
   ModifierPerkList(0)=Class'KFGame.KFPerk_SWAT'
   Name="Default__KFDT_Slashing_Knife_SWAT"
   ObjectArchetype=KFDT_Slashing_Knife'kfgamecontent.Default__KFDT_Slashing_Knife'
}
