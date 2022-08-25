//=============================================================================
// KFProj_DragonsBreathSplash
//=============================================================================
// Projectile class for trench gun splash.  Handles a few overrides.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================

class KFProj_DragonsBreathSplash extends KFProj_FlareGunSplash;

defaultproperties
{
    Begin Object Name=ExploTemplate0
        MyDamageType=class'KFDT_Fire_DragonsBreathDoT'
    End Object

    AssociatedPerkClass=none
}