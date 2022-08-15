//=============================================================================
// KFDT_Bludgeon_Crovel
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_RifleButt extends KFDT_Bludgeon
	abstract
	hidedropdown;

defaultproperties
{
   StumblePower=126
   ModifierPerkList(0)=Class'KFGame.KFPerk_Berserker'
   bExtraMomentumZ=True
   KDamageImpulse=700.000000
   KDeathUpKick=300.000000
   Name="Default__KFDT_Bludgeon_RifleButt"
   ObjectArchetype=KFDT_Bludgeon'KFGame.Default__KFDT_Bludgeon'
}
