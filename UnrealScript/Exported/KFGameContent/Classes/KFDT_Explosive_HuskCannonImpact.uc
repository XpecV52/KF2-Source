//=============================================================================
// KFDT_Explosive_HuskCannonImpact
//=============================================================================
// Explosive damage type for the Husk Cannon direct hit
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HuskCannonImpact extends KFDT_Ballistic_Shell
    abstract
    hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HuskCannon'
   ModifierPerkList(0)=Class'KFGame.KFPerk_Firebug'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Demolitionist'
   GibImpulseScale=0.150000
   KDamageImpulse=900.000000
   KDeathVel=500.000000
   KDeathUpKick=500.000000
   RadialDamageImpulse=1500.000000
   Name="Default__KFDT_Explosive_HuskCannonImpact"
   ObjectArchetype=KFDT_Ballistic_Shell'KFGame.Default__KFDT_Ballistic_Shell'
}
