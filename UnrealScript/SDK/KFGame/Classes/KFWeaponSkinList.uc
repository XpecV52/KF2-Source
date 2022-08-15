//=============================================================================
// KFWeaponSkinList
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFWeaponSkinList extends Object
	abstract
    native;

struct native WeaponSkin
{
	/** Steam item Id */
	var int 	Id;

	/** Material DLO Paths */
	var array<string> 	MIC_1P;
	var string 			MIC_3P;
	var string  		MIC_Pickup;

	/** Basic Info about associated weapon */
	var class<KFWeaponDefinition> WeaponDef;
};

enum EWeaponSkinType
{
	WST_FirstPerson,
	WST_ThirdPerson,
	WST_Pickup,
};

var const array<WeaponSkin> Skins;

/** Returns material given a weapon skin item Id */
static native function array<MaterialInterface> GetWeaponSkin(int ItemId, EWeaponSkinType Type);

/** Inventory UI, read / write skin equip */
static native function SaveWeaponSkin(class<KFWeaponDefinition> WeaponDef, int ID);
static native function bool IsSkinEquip(class<KFWeaponDefinition> WeaponDef, int ID);

defaultproperties
{
//Anodized Hazard AR15
	Skins.Add((Id=3001, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))
 	Skins.Add((Id=3002, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3003, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.anodizedhazard_ar15.AnodizedHazard_AR15_3P_Pickup_MIC"))

//Airlock 9mm
	Skins.Add((Id=3004, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))
 	Skins.Add((Id=3005, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))
	Skins.Add((Id=3006, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.airlock_9mm.Airlock_9MM_3P_Pickup_MIC"))

//Aeronaut Bullpup
	Skins.Add((Id=3007, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3008, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3009, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.aeronaut_bullpup.Aeronaut_Bullpup_3P_Pickup_MIC"))

//Woodland AA12
	Skins.Add((Id=3010, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))
 	Skins.Add((Id=3011, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3012, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_aa12.Woodland_AA12_3P_Pickup_MIC"))

//Woodland Boomstick
	Skins.Add((Id=3013, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))
 	Skins.Add((Id=3014, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3015, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_doublebarrel.Woodland_DoubleBarrel_3P_Pickup_MIC"))

//Woodland L85A2
	Skins.Add((Id=3016, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))
 	Skins.Add((Id=3017, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))
	Skins.Add((Id=3018, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_bullpup.Woodland_Bullpup_3P_Pickup_MIC"))

//Woodland Scar
	Skins.Add((Id=3019, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3020, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3021, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.woodland_scar.Woodland_SCAR_3P_Pickup_MIC"))

//Arachnid Nailgun
	Skins.Add((Id=3022, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3023, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3024, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.arachnid_nailgun.Arachnid_NailGun_3P_Pickup_MIC"))

//Bloated 9mm
	Skins.Add((Id=3025, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3026, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3027, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.bloated_9mm.Bloated_9mm_3P_Pickup_MIC"))

//Monster Killer M4
	Skins.Add((Id=3028, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3029, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3030, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.monsterkiller_m4.MonsterKiller_M4_3P_Pickup_MIC"))

//Grave Digger Crovel
	Skins.Add((Id=3031, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=3032, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))
	Skins.Add((Id=3033, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.gravedigger_crovel.GraveDigger_Crovel_3P_Pickup_MIC"))

//Clot Commando Scar
	Skins.Add((Id=3036, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3035, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3034, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.clotcommando_scar.ClotCommando_SCAR_3P_Pickup_MIC"))

//Shark Teeth Double Barrel
	Skins.Add((Id=3039, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3038, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3037, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.sharkteeth_doublebarrel.SharkTeeth_DoubleBarrel_3P_Pickup_MIC"))

//Tiger RPG7
	Skins.Add((Id=3042, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3041, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3040, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_rpg7.Tiger_RPG7_3P_Pickup_MIC"))

//Tiger M79
	Skins.Add((Id=3046, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3045, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3044, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_m79.Tiger_M79_3P_Pickup_MIC"))

//Tiger HX25
	Skins.Add((Id=3049, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3048, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3047, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_hx25.Tiger_HX25_3P_Pickup_MIC"))

//Tiger AK12
	Skins.Add((Id=3052, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3051, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3050, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.tiger_ak12.Tiger_AK12_3P_Pickup_MIC"))

//Skull Cracker Pulverizer
	Skins.Add((Id=3055, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3054, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3053, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.skullcracker_pulverizer.SkullCracker_Pulverizer_3P_Pickup_MIC"))

//Fleshpounder AA12
	Skins.Add((Id=3058, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3057, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3056, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC"))

//Horzine Elite Blue SCAR
	Skins.Add((Id=3064, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3063, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3062, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))

//Horzine Elite Red SCAR
	Skins.Add((Id=3061, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3060, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3059, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))

//CyberBone Katana
	Skins.Add((Id=3070, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3069, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3068, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_katana.CyberBone_Katana_3P_Pickup_MIC"))

//CyberBone AA12
	Skins.Add((Id=3076, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3075, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3074, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_aa12.CyberBone_AA12_3P_Pickup_MIC"))

//CyberBone AK12
	Skins.Add((Id=3073, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3072, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3071, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ak12.CyberBone_AK12_3P_Pickup_MIC"))

//CyberBone AR15
	Skins.Add((Id=3079, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3078, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3077, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_ar15.CyberBone_AR15_3P_Pickup_MIC"))

//CyberBone Support Knife
	Skins.Add((Id=3344, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3343, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3342, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.cyberbone_supportknife.CyberBone_SupportKnife_3P_Pickup_MIC"))

//Stories of War AA12
	Skins.Add((Id=3094, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3093, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3092, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_aa12.StoriesOfWar_AA12_3P_Pickup_MIC"))

//Stories of War AK12
	Skins.Add((Id=3112, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3111, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3110, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ak12.StoriesOfWar_AK12_3P_Pickup_MIC"))

//Stories of War Dragons Breath
	Skins.Add((Id=3088, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3087, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3086, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_dragonsbreath.StoriesOfWar_DragonsBreath_3P_Pickup_MIC"))

//Stories of War M4
	Skins.Add((Id=3082, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3081, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))
	Skins.Add((Id=3080, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m4.StoriesOfWar_M4_3P_Pickup_MIC"))

//Stories of War M79
	Skins.Add((Id=3091, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3090, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3089, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_m79.StoriesOfWar_M79_3P_Pickup_MIC"))

//Stories of War RPG7
	Skins.Add((Id=3097, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3096, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))
	Skins.Add((Id=3095, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_rpg7.StoriesOfWar_RPG7_3P_Pickup_MIC"))

//Stories of War SCAR
	Skins.Add((Id=3085, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3084, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3083, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_scar.StoriesOfWar_SCAR_3P_Pickup_MIC"))

//Dragonfire Caulk N Burn
	Skins.Add((Id=3100, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3099, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3098, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_caulknburn.Dragonfire_CaulkNBurn_3P_Pickup_MIC"))

//Dragonfire Dragons Breath
	Skins.Add((Id=3106, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3105, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3104, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_dragonsbreath.Dragonfire_DragonsBreath_3P_Pickup_MIC"))

//Dragonfire Firebug Knife
	Skins.Add((Id=3109, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3108, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3107, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_firebugknife.Dragonfire_FirebugKnife_3P_Pickup_MIC"))

//Dragonfire Flamethrower
	Skins.Add((Id=3103, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3102, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3101, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.dragonfire_flamethrower.Dragonfire_Flamethrower_3P_Pickup_MIC"))

//The Peacemaker M79
	Skins.Add((Id=3324, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3323, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3322, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.thepeacemaker_m79.ThePeacemaker_M79_3P_Pickup_MIC"))

//Rusted Death MB500
	Skins.Add((Id=3067, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3066, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3065, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.rusteddeath_mb500.RustedDeath_MB500_3P_Pickup_MIC"))

//Stories of War AR15
	Skins.Add((Id=3347, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3346, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3345, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.storiesofwar_ar15.StoriesOfWar_AR15_3P_Pickup_MIC"))

//Conatainment AR15
	Skins.Add((Id=3269, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3268, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3267, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.containment_ar15.Containment_AR15_3P_Pickup_MIC"))

//Putrid Bile M79
	Skins.Add((Id=3272, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3271, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))
	Skins.Add((Id=3270, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.putridbile_m79.PutridBile_M79_3P_Pickup_MIC"))

//Heat Dragons Breath
	Skins.Add((Id=3296, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3295, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))
	Skins.Add((Id=3294, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_dragonsbreath.Heat_DragonsBreath_3P_Pickup_MIC"))

//Heat Double Barrel
	Skins.Add((Id=3299, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3298, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))
	Skins.Add((Id=3297, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.heat_doublebarrel.Heat_DoubleBarrel_3P_Pickup_MIC"))

//Precious AR15
	Skins.Add((Id=3289, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_ar15.Precious_AR15_3P_Pickup_MIC"))

//Precious Caulk N Burn
	Skins.Add((Id=3290, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_caulknburn.Precious_CaulkNBurn_3P_Pickup_MIC"))

//Precious Crovel
	Skins.Add((Id=3291, Weapondef=class'KFWeapDef_Crovel', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_crovel.Precious_Crovel_3P_Pickup_MIC"))

//Precious HX25
	Skins.Add((Id=3292, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_hx25.Precious_HX25_3P_Pickup_MIC"))

//Precious MB500
	Skins.Add((Id=3293, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_mb500.Precious_MB500_3P_Pickup_MIC"))

//Precious Medic Pistol
	Skins.Add((Id=3335, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_3P_Pickup_MIC"))

//Precious Remington 1858
	Skins.Add((Id=3303, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_remington1858.Precious_Remington_1858_3P_Pickup_MIC"))

//Blood Camo Remington 1858
	Skins.Add((Id=3306, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3305, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3304, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.bloodcamo_remington1858.BloodCamo_Remington1858_3P_Pickup_MIC"))

//Constitution Remington 1858
	Skins.Add((Id=3309, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3308, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))
	Skins.Add((Id=3307, Weapondef=class'KFWeapDef_Remington1858', MIC_1P=("WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.constitution_remington1858.Constitution_Remington1858_3P_Pickup_MIC"))

//Dosh MB500
	Skins.Add((Id=3312, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3311, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3310, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_mb500.Dosh_MB500_3P_Pickup_MIC"))

//Dosh L85A2
	Skins.Add((Id=3315, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3314, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3313, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.dosh_l85a2.Dosh_L85A2_3P_Pickup_MIC"))

//Snakeskin SW500
	Skins.Add((Id=3318, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))
	Skins.Add((Id=3317, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))
	Skins.Add((Id=3316, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskin_sw_500.Snakeskin_SW_3P_Pickup_MIC"))

//Snakeskin AA12
	Skins.Add((Id=3321, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3320, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3319, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.snakeskingreen_aa12.SnakeskinGreen_AA12_3P_Pickup_MIC"))

//Circuit HX25
	Skins.Add((Id=3327, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3326, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3325, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuit_hx25.Circuit_HX25_3P_Pickup_MIC"))

//Circuit Glow HX25
	Skins.Add((Id=3330, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3329, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3328, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.circuitglow_hx25.CircuitGlow_HX25_3P_Pickup_MIC"))

//Glow Text Katana
	Skins.Add((Id=3333, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3332, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))
	Skins.Add((Id=3331, Weapondef=class'KFWeapDef_Katana', MIC_1P=("WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.glowtext_katana.GlowText_Katana_3P_Pickup_MIC"))

//Carbon Fiber Medic Pistol
	Skins.Add((Id=3338, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3337, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))
	Skins.Add((Id=3336, Weapondef=class'KFWeapDef_MedicPistol', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_3P_Pickup_MIC"))

//Carbon Fiber Medic SMG
	Skins.Add((Id=3341, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_Mint_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3340, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_FieldTested_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))
	Skins.Add((Id=3339, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet02_MAT.carbonfiber_medicpistol.CarbonFiber_MedicPistol_1P_BattleScarred_MIC", "WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet02_MAT.carbonfiber_medicsmg.CarbonFiber_MedicSMG_3P_Pickup_MIC"))


}
