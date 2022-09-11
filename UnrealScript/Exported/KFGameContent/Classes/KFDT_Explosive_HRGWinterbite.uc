//=============================================================================
// KFDT_Explosive_HRGWinterbite
//=============================================================================
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Explosive_HRGWinterbite extends KFDT_Freeze
	abstract;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGWinterbite'
   bNoInstigatorDamage=True
   bShouldSpawnPersistentBlood=True
   StumblePower=25.000000
   FreezePower=20.000000
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   GibImpulseScale=0.150000
   KDeathVel=300.000000
   KDeathUpKick=700.000000
   Name="Default__KFDT_Explosive_HRGWinterbite"
   ObjectArchetype=KFDT_Freeze'KFGame.Default__KFDT_Freeze'
}
