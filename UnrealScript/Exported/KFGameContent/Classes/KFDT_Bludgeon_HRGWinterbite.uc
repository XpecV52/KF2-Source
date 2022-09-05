//=============================================================================
// KFDT_Bludgeon_HRGWinterbite
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFDT_Bludgeon_HRGWinterbite extends KFDT_Bludgeon_RifleButt
	abstract
	hidedropdown;

defaultproperties
{
   WeaponDef=Class'KFGame.KFWeapDef_HRGWinterbite'
   ModifierPerkList(0)=Class'KFGame.KFPerk_Gunslinger'
   ModifierPerkList(1)=Class'KFGame.KFPerk_Sharpshooter'
   Name="Default__KFDT_Bludgeon_HRGWinterbite"
   ObjectArchetype=KFDT_Bludgeon_RifleButt'kfgamecontent.Default__KFDT_Bludgeon_RifleButt'
}
