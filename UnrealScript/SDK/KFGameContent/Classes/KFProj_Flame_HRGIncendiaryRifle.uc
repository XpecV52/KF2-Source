//=============================================================================
// KFProj_Flame_HRGIncendiaryRifle
//=============================================================================
// Projectile class for the residual flames from the rifle's grenade.
// It behaves like the molotov residual flames.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFProj_Flame_HRGIncendiaryRifle extends KFProj_MolotovSplash;

defaultproperties
{
	// Let the flames FX to last only for 5 secs
	MaxTimeFlarotov=5
	
    Begin Object Name=ExploTemplate0
		Damage=4
		MomentumTransferScale=1
        MyDamageType=class'KFDT_Fire_Ground_HRGIncendiaryRifle'
    End Object
}
	
