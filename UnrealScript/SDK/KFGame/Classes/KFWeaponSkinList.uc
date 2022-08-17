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
	Skins.Add((Id=3064, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_Mint_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3063, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_FieldTested_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3062, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineeliteblue_scar.HorzineEliteBlue_SCAR_3P_Pickup_MIC"))

//Horzine Elite Red SCAR
	Skins.Add((Id=3061, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_Mint_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3060, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_FieldTested_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3059, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet01_MAT.horzineelitered_scar.HorzineEliteRed_SCAR_3P_Pickup_MIC"))

//Horzine Elite White SCAR
	Skins.Add((Id=3613, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3612, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3611, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_scar.HorzineEliteWhite_SCAR_3P_Pickup_MIC"))

//Horzine Elite Green SCAR
	Skins.Add((Id=3616, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3615, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3614, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_scar.HorzineEliteGreen_SCAR_3P_Pickup_MIC"))

//Horzine Elite Blue L85A2
	Skins.Add((Id=3619, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3618, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3617, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineeliteblue_l85a2.HorzineEliteBlue_L85A2_3P_Pickup_MIC"))

//Horzine Elite Red L85A2
	Skins.Add((Id=3622, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3621, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3620, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitered_l85a2.HorzineEliteRed_L85A2_3P_Pickup_MIC"))

//Horzine Elite White L85A2
	Skins.Add((Id=3625, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3624, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3623, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitewhite_l85a2.HorzineEliteWhite_L85A2_3P_Pickup_MIC"))

//Horzine Elite Green L85A2
	Skins.Add((Id=3628, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_Mint_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3627, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_FieldTested_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3626, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_1P_BattleScarred_MIC", "WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzineelitegreen_l85a2.HorzineEliteGreen_L85A2_3P_Pickup_MIC"))

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

//Precious 9mm
	Skins.Add((Id=3422, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_9mm.Precious_9MM_3P_Pickup_MIC"))

//Precious Double Barrel
	Skins.Add((Id=3423, Weapondef=class'KFWeapDef_DoubleBarrel', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_doublebarrel.Precious_DoubleBarrel_3P_Pickup_MIC"))

//Precious M4
	Skins.Add((Id=3424, Weapondef=class'KFWeapDef_M4', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m4shotgun.Precious_M4Shotgun_3P_Pickup_MIC"))

//Precious AA12
	Skins.Add((Id=3425, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_aa12.Precious_AA12_3P_Pickup_MIC"))

//Precious Support Knife
	Skins.Add((Id=3426, Weapondef=class'KFWeapDef_Knife_Support', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_supportknife.Precious_SupportKnife_3P_Pickup_MIC"))

//Precious L85A2
	Skins.Add((Id=3427, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_l85a2.Precious_L85A2_3P_Pickup_MIC"))

//Precious SCAR
	Skins.Add((Id=3428, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_scar.Precious_SCAR_3P_Pickup_MIC"))

//Precious Nail Gun
	Skins.Add((Id=3429, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_nailgun.Precious_NailGun_3P_Pickup_MIC"))

//Precious Pulverizer
	Skins.Add((Id=3430, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_pulverizer.Precious_Pulverizer_3P_Pickup_MIC"))

//Precious Sawblade
	Skins.Add((Id=3431, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_sawblade.Precious_SawBlade_3P_Pickup_MIC"))

//Precious M79
	Skins.Add((Id=3432, Weapondef=class'KFWeapDef_M79', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m79.Precious_M79_3P_Pickup_MIC"))

//Precious RPG7
	Skins.Add((Id=3433, Weapondef=class'KFWeapDef_RPG7', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_rpg7.Precious_RPG7_3P_Pickup_MIC"))

//Precious Flamethrower
	Skins.Add((Id=3434, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_flamethrower.Precious_Flamethrower_3P_Pickup_MIC"))

//Precious Microwave Gun
	Skins.Add((Id=3435, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_microwavegun.Precious_MicrowaveGun_3P_Pickup_MIC"))

//Precious Dragons Breath
	Skins.Add((Id=3436, Weapondef=class'KFWeapDef_DragonsBreath', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_dragonsbreath.Precious_DragonsBreath_3P_Pickup_MIC"))

//Precious Desert Eagle
	Skins.Add((Id=3437, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_deagle.Precious_Deagle_3P_Pickup_MIC"))

//Precious M1911
	Skins.Add((Id=3438, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_m1911.Precious_M1911_3P_Pickup_MIC"))

//Precious SW500
	Skins.Add((Id=3439, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_sw500.Precious_SW500_3P_Pickup_MIC"))

//Precious Demo Knife
	Skins.Add((Id=3440, Weapondef=class'KFWeapDef_Knife_Demo', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_demoknife.Precious_DemoKnife_3P_Pickup_MIC"))

//Precious Firebug Knife
	Skins.Add((Id=3441, Weapondef=class'KFWeapDef_Knife_Firebug', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_firebugknife.Precious_FirebugKnife_3P_Pickup_MIC"))

//Precious Medic SMG
	Skins.Add((Id=3448, Weapondef=class'KFWeapDef_MedicSMG', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicsmg.Precious_MedicSMG_3P_Pickup_MIC"))

//Precious Medic Knife
	Skins.Add((Id=3449, Weapondef=class'KFWeapDef_Knife_Medic', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicknife.Precious_MedicKnife_3P_Pickup_MIC"))

//Precious Medic Shotgun
	Skins.Add((Id=3450, Weapondef=class'KFWeapDef_MedicShotgun', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicshotgun.Precious_MedicShotgun_3P_Pickup_MIC"))

//Precious AK12
	Skins.Add((Id=3459, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_ak12.Precious_AK12_3P_Pickup_MIC"))

//Precious Commando Knife
	Skins.Add((Id=3460, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_commandoknife.Precious_CommandoKnife_3P_Pickup_MIC"))

//Precious Gunslinger Knife
	Skins.Add((Id=3461, Weapondef=class'KFWeapDef_Knife_Gunslinger', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_gunslingerknife.Precious_GunslingerKnife_3P_Pickup_MIC"))

//Precious Berserker Knife
	Skins.Add((Id=3462, Weapondef=class'KFWeapDef_Knife_Berserker', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_berserkerknife.Precious_BerserkerKnife_3P_Pickup_MIC"))

//Precious C4
	Skins.Add((Id=3463, Weapondef=class'KFWeapDef_C4', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_c4.Precious_C4_3P_Pickup_MIC"))

//Precious Medic Assault
	Skins.Add((Id=3467, Weapondef=class'KFWeapDef_MedicRifle', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_1P_Mint_MIC", "WEP_SkinSet01_P01_MAT.precious_medicpistol.Precious_MedicPistol_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_medicassault.Precious_MedicAssault_3P_Pickup_MIC"))

//Precious Healer
	Skins.Add((Id=3451, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_healer.Precious_Healer_3P_Pickup_MIC"))

//Precious Welder
	Skins.Add((Id=3452, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet01_P01_MAT.precious_welder.Precious_Welder_3P_Pickup_MIC"))

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

//Tactical Desert Eagle
	Skins.Add((Id=3361, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3360, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3359, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_deagle.Tactical_Deagle_3P_Pickup_MIC"))

//Tactical 9mm
	Skins.Add((Id=3364, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3363, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3362, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_9mm.Tactical_9mm_3P_Pickup_MIC"))

//Tactical M1911
	Skins.Add((Id=3367, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=3366, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))
	Skins.Add((Id=3365, Weapondef=class'KFWeapDef_Colt1911', MIC_1P=("WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_m1911.Tactical_M1911_3P_Pickup_MIC"))

//Tactical AR15
	Skins.Add((Id=3370, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3369, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3368, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_ar15.Tactical_AR15_3P_Pickup_MIC"))

//Tactical SW500
	Skins.Add((Id=3444, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=3443, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))
	Skins.Add((Id=3442, Weapondef=class'KFWeapDef_SW500', MIC_1P=("WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.tactical_sw500.Tactical_SW500_3P_Pickup_MIC"))

//Street Punks Caulk N Burn
	Skins.Add((Id=3373, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3372, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3371, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_caulknburn.StreetPunks_CaulkNBurn_3P_Pickup_MIC"))

//Street Punks Commando Knife
	Skins.Add((Id=3376, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3375, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))
	Skins.Add((Id=3374, Weapondef=class'KFWeapDef_Knife_Commando', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_commandoknife.StreetPunks_CommandoKnife_3P_Pickup_MIC"))

//Street Punks AR15
	Skins.Add((Id=3379, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3378, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))
	Skins.Add((Id=3377, Weapondef=class'KFWeapDef_AR15', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ar15.StreetPunks_AR15_3P_Pickup_MIC"))

//Street Punks 9mm
	Skins.Add((Id=3382, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3381, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3380, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_9mm.StreetPunks_9mm_3P_Pickup_MIC"))

//Street Punks MB500
	Skins.Add((Id=3385, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3384, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3383, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_mb500.StreetPunks_MB500_3P_Pickup_MIC"))

//Street Punks AK12
	Skins.Add((Id=3455, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3454, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3453, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_ak12.StreetPunks_AK12_3P_Pickup_MIC"))

//Street Punks Desert Eagle
	Skins.Add((Id=3458, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3457, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3456, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.streetpunks_deagle.StreetPunks_Deagle_3P_Pickup_MIC"))

//Emergency Issue Caulk N Burn
	Skins.Add((Id=3388, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3387, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))
	Skins.Add((Id=3386, Weapondef=class'KFWeapDef_CaulkBurn', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_caulknburn.EmergencyIssue_CaulkNBurn_3P_Pickup_MIC"))

//Emergency Issue 9mm
	Skins.Add((Id=3391, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3390, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))
	Skins.Add((Id=3389, Weapondef=class'KFWeapDef_9mm', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_9mm.EmergencyIssue_9mm_3P_Pickup_MIC"))

//Emergency Issue Desert Eagle
	Skins.Add((Id=3394, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3393, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))
	Skins.Add((Id=3392, Weapondef=class'KFWeapDef_Deagle', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_deagle.EmergencyIssue_Deagle_3P_Pickup_MIC"))

//Emergency Issue Nailgun
	Skins.Add((Id=3412, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3411, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))
	Skins.Add((Id=3410, Weapondef=class'KFWeapDef_NailGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_nailgun.EmergencyIssue_NailGun_3P_Pickup_MIC"))

//Emergency Issue MB500
	Skins.Add((Id=3415, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3414, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3413, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC"))

//Emergency Issue Flamethrower
	Skins.Add((Id=3418, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3417, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))
	Skins.Add((Id=3416, Weapondef=class'KFWeapDef_FlameThrower', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_flamethrower.EmergencyIssue_Flamethrower_3P_Pickup_MIC"))

//Emergency Issue Microwave Gun
	Skins.Add((Id=3421, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3420, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))
	Skins.Add((Id=3419, Weapondef=class'KFWeapDef_MicrowaveGun', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_microwavegun.EmergencyIssue_MicrowaveGun_3P_Pickup_MIC"))

//Emergency Issue Sawblade
	Skins.Add((Id=3466, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))
	Skins.Add((Id=3465, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))
	Skins.Add((Id=3464, Weapondef=class'KFWeapDef_Eviscerator', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_sawblade.EmergencyIssue_SawBlade_3P_Pickup_MIC"))

//Emergency Issue Pulverizer
	Skins.Add((Id=3589, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3588, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3587, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.emergencyissue_pulverizer.EmergencyIssue_Pulverizer_3P_Pickup_MIC"))

//Predator MB500
	Skins.Add((Id=3397, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3396, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3395, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_mb500.Predator_MB500_3P_Pickup_MIC"))

//Predator HX25
	Skins.Add((Id=3400, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3399, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3398, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_hx25.Predator_HX25_3P_Pickup_MIC"))

//Predator AK12
	Skins.Add((Id=3403, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3402, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3401, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_ak12.Predator_AK12_3P_Pickup_MIC"))

//Predator L85A2
	Skins.Add((Id=3406, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3405, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))
	Skins.Add((Id=3404, Weapondef=class'KFWeapDef_Bullpup', MIC_1P=("WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.predator_l85a2.Predator_L85A2_3P_Pickup_MIC"))

//Carcass AA12
	Skins.Add((Id=3409, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3408, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3407, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.carcass_aa12.Carcass_AA12_3P_Pickup_MIC"))

//Horzine First Encounter MB500
	Skins.Add((Id=3447, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3446, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))
	Skins.Add((Id=3445, Weapondef=class'KFWeapDef_MB500', MIC_1P=("WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.horzinefe_mb500.HorzineFE_MB500_3P_Pickup_MIC"))

//Flesh Pulverizer
	Skins.Add((Id=3645, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3644, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))
	Skins.Add((Id=3643, Weapondef=class'KFWeapDef_Pulverizer', MIC_1P=("WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.flesh_pulverizer.Flesh_Pulverizer_3P_Pickup_MIC"))

//Vertebrae HX25
	Skins.Add((Id=3682, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3681, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))
	Skins.Add((Id=3680, Weapondef=class'KFWeapDef_HX25', MIC_1P=("WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.vertebrae_hx25.Vertebrae_HX25_3P_Pickup_MIC"))

//Spray Can SCAR
	Skins.Add((Id=3729, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3728, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))
	Skins.Add((Id=3727, Weapondef=class'KFWeapDef_SCAR', MIC_1P=("WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.spraycan_scar.SprayCan_SCAR_3P_Pickup_MIC"))

//Leviathan AK12
	Skins.Add((Id=3732, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3731, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3730, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet03_MAT.leviathan_ak12.Leviathan_AK12_3P_Pickup_MIC"))

//Horzine Elite Blue AK12
	Skins.Add((Id=3781, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3780, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3779, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineeliteblue_ak12.HorzineEliteBlue_AK12_3P_Pickup_MIC"))

//Horzine Elite Red AK12
	Skins.Add((Id=3784, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3783, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3782, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitered_ak12.HorzineEliteRed_AK12_3P_Pickup_MIC"))

//Horzine Elite White AK12
	Skins.Add((Id=3787, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3786, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3785, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitewhite_ak12.HorzineEliteWhite_AK12_3P_Pickup_MIC"))

//Horzine Elite Green AK12
	Skins.Add((Id=3790, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_Mint_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3789, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_FieldTested_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))
	Skins.Add((Id=3788, Weapondef=class'KFWeapDef_Ak12', MIC_1P=("WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_1P_BattleScarred_MIC", "WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_Scope_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzineelitegreen_ak12.HorzineEliteGreen_AK12_3P_Pickup_MIC"))

//Horzine First Encounter Healer
	Skins.Add((Id=3793, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=3792, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))
	Skins.Add((Id=3791, Weapondef=class'KFWeapDef_Healer', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_healer.HorzineFE_Healer_3P_Pickup_MIC"))

//Horzine First Encounter Welder
	Skins.Add((Id=3796, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=3795, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))
	Skins.Add((Id=3794, Weapondef=class'KFWeapDef_Welder', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_welder.HorzineFE_Welder_3P_Pickup_MIC"))

//Horzine First Encounter AA12
	Skins.Add((Id=3799, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_Mint_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Mint_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3798, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_FieldTested_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_FieldTested_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))
	Skins.Add((Id=3797, Weapondef=class'KFWeapDef_AA12', MIC_1P=("WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_1P_BattleScarred_MIC"), MIC_3P="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_BattleScarred_MIC", MIC_Pickup="WEP_SkinSet04_MAT.horzinefe_aa12.HorzineFE_AA12_3P_Pickup_MIC"))

}
