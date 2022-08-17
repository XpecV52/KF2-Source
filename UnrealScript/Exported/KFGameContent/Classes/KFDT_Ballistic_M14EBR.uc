//=============================================================================
// KFDT_Ballistic_M14EBR
//=============================================================================
// Ballistic damage with light impact energy, but stronger hit reactions
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Ballistic_M14EBR extends KFDT_Ballistic_Rifle
	abstract
	hidedropdown;

defaultproperties
{
   StunPower=20
   GunHitPower=30
   MeleeHitPower=25
   ModifierPerkList(0)=None
   KDamageImpulse=600.000000
   Name="Default__KFDT_Ballistic_M14EBR"
   ObjectArchetype=KFDT_Ballistic_Rifle'kfgamecontent.Default__KFDT_Ballistic_Rifle'
}
