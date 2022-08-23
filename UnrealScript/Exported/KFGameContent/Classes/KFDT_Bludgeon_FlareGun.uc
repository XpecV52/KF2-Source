//=============================================================================
// KFDT_Bludgeon_Colt1911
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_FlareGun extends KFDT_Bludgeon_RifleButt
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_FlareGun'
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Sharpshooter'
   Name="Default__KFDT_Bludgeon_FlareGun"
   ObjectArchetype=KFDT_Bludgeon_RifleButt'kfgamecontent.Default__KFDT_Bludgeon_RifleButt'
}
