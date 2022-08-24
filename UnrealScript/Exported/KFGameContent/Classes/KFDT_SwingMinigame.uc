//=============================================================================
// KFDT_SwingMinigame
//=============================================================================
// Damage caused by the Swing minigame in the Summer Sideshow.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
// Dan Weiss
//=============================================================================

class KFDT_SwingMinigame extends KFDamageType;

defaultproperties
{
   GoreDamageGroup=DGT_Explosive
   GibImpulseScale=0.150000
   OverrideImpactSound=AkEvent'WW_ENV_Summer_Sideshow.Play_SS_Swing_Flesh_Hit'
   bArmorStops=False
   KDamageImpulse=1000.000000
   KDeathUpKick=55.000000
   Name="Default__KFDT_SwingMinigame"
   ObjectArchetype=KFDamageType'KFGame.Default__KFDamageType'
}
