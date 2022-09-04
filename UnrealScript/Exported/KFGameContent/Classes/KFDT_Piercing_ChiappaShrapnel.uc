//=============================================================================
// KFDT_Piercing_ChiappaShrapnel
//=============================================================================
// Shrapnel damage type for the Chiappa Rhino pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Piercing_ChiappaShrapnel extends KFDT_Piercing
    abstract
    hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_ChiappaRhino'
   GunHitPower=300.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=2000.000000
   KDeathVel=500.000000
   KDeathUpKick=-500.000000
   Name="Default__KFDT_Piercing_ChiappaShrapnel"
   ObjectArchetype=KFDT_Piercing'KFGame.Default__KFDT_Piercing'
}
