//=============================================================================
// KFDT_Freeze_HRGWinterbiteImpact
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Freeze_HRGWinterbiteImpact extends KFDT_Freeze
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGWinterbite'
   StumblePower=50.000000
   GunHitPower=100.000000
   FreezePower=10.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   KDamageImpulse=1000.000000
   KDeathVel=350.000000
   KDeathUpKick=700.000000
   Name="Default__KFDT_Freeze_HRGWinterbiteImpact"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
