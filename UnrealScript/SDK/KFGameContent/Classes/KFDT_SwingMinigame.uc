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
	//RadialDamageImpulse=2000//3000
	GibImpulseScale=0.15
	KDeathUpKick=55//200
    //KDeathVel=300
    KDamageImpulse=1000//1000

    bArmorStops=false
    GoreDamageGroup=DGT_Explosive

    OverrideImpactSound=AkEvent'WW_ENV_Summer_Sideshow.Play_SS_Swing_Flesh_Hit'

}