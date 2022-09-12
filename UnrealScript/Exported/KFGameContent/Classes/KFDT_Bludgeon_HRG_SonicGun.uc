//=============================================================================
// KFDT_Bludgeon_HRG_SonicGun
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================
class KFDT_Bludgeon_HRG_SonicGun extends KFDT_Bludgeon_RifleButt
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRG_SonicGun'
   ModifierPerkList(0)=Class'KFGame.KFPerk_Survivalist'
   Name="Default__KFDT_Bludgeon_HRG_SonicGun"
   ObjectArchetype=KFDT_Bludgeon_RifleButt'kfgamecontent.Default__KFDT_Bludgeon_RifleButt'
}
