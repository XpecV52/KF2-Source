//=============================================================================
// KFGameReplicationInfo_WeeklySurvival
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFGameReplicationInfo_WeeklySurvival extends KFGameReplicationInfo;

struct SBrokeTraderPickupItem
{
	/** Weapons available for spawning */
	var() array<class<KFWeaponDefinition> > WeaponClasses;
};

var() array<SBrokeTraderPickupItem> BrokenTraderItemPickups;

simulated function array<int> GetKFSeqEventLevelLoadedIndices()
{
	local array<int> ActivateIndices;

	ActivateIndices[0] = 7;

	return ActivateIndices;
}

simulated function OverrideWeaponPickups(out KFPickupFactory_Item ItemFactory)
{
	local int Idx;
    local ItemPickup Pickup;

	if (ItemFactory == none)
		return;

	if ( BrokenTraderItemPickups.Length == 0 || WaveNum > BrokenTraderItemPickups.Length )
		return;

	ItemFactory.ItemPickups.Remove(0, ItemFactory.ItemPickups.Length);
	
	for(Idx = 0; Idx < BrokenTraderItemPickups[WaveNum-1].WeaponClasses.Length; Idx++)
	{
		Pickup.ItemClass = class<KFWeapon> (DynamicLoadObject(BrokenTraderItemPickups[WaveNum-1].WeaponClasses[Idx].default.WeaponClassPath, class'Class'));
		ItemFactory.ItemPickups.AddItem(Pickup);
	}
}

simulated function NotifyWaveStart()
{
    local KFPickupFactory_Item ItemFactory;

	if (WorldInfo.NetMode == NM_Client && bIsBrokenTrader)
	{
		foreach AllActors(class'KFPickupFactory_Item', ItemFactory)
		{
			OverrideWeaponPickups(ItemFactory);
			ItemFactory.SetPickupMesh();
		}
	}
   
	super.NotifyWaveStart();
}

defaultproperties
{
   BrokenTraderItemPickups(0)=(WeaponClasses=(Class'KFGame.KFWeapDef_9mmDual',Class'KFGame.KFWeapDef_Crovel',Class'KFGame.KFWeapDef_MB500',Class'KFGame.KFWeapDef_MedicPistol',Class'KFGame.KFWeapDef_HX25',Class'KFGame.KFWeapDef_CaulkBurn',Class'KFGame.KFWeapDef_Remington1858Dual',Class'KFGame.KFWeapDef_Winchester1894',Class'KFGame.KFWeapDef_MP7',Class'KFGame.KFWeapDef_AR15'))
   BrokenTraderItemPickups(1)=(WeaponClasses=(Class'KFGame.KFWeapDef_Nailgun',Class'KFGame.KFWeapDef_Katana',Class'KFGame.KFWeapDef_ChainBat',Class'KFGame.KFWeapDef_FireAxe',Class'KFGame.KFWeapDef_Bullpup',Class'KFGame.KFWeapDef_Thompson',Class'KFGame.KFWeapDef_DoubleBarrel',Class'KFGame.KFWeapDef_HZ12',Class'KFGame.KFWeapDef_DragonsBreath',Class'KFGame.KFWeapDef_MedicSMG',Class'KFGame.KFWeapDef_Healthrower_HRG',Class'KFGame.KFWeapDef_M79',Class'KFGame.KFWeapDef_FlareGunDual',Class'KFGame.KFWeapDef_Mac10',Class'KFGame.KFWeapDef_HRGScorcher',Class'KFGame.KFWeapDef_Colt1911Dual',Class'KFGame.KFWeapDef_HRGWinterbite',Class'KFGame.KFWeapDef_CenterfireMB464',Class'KFGame.KFWeapDef_Crossbow',Class'KFGame.KFWeapDef_MP5RAS'))
   BrokenTraderItemPickups(2)=(WeaponClasses=(Class'KFGame.KFWeapDef_Nailgun',Class'KFGame.KFWeapDef_Katana',Class'KFGame.KFWeapDef_ChainBat',Class'KFGame.KFWeapDef_FireAxe',Class'KFGame.KFWeapDef_Bullpup',Class'KFGame.KFWeapDef_Thompson',Class'KFGame.KFWeapDef_DoubleBarrel',Class'KFGame.KFWeapDef_HZ12',Class'KFGame.KFWeapDef_DragonsBreath',Class'KFGame.KFWeapDef_MedicSMG',Class'KFGame.KFWeapDef_Healthrower_HRG',Class'KFGame.KFWeapDef_M79',Class'KFGame.KFWeapDef_FlareGunDual',Class'KFGame.KFWeapDef_Mac10',Class'KFGame.KFWeapDef_HRGScorcher',Class'KFGame.KFWeapDef_Colt1911Dual',Class'KFGame.KFWeapDef_HRGWinterbite',Class'KFGame.KFWeapDef_CenterfireMB464',Class'KFGame.KFWeapDef_Crossbow',Class'KFGame.KFWeapDef_MP5RAS'))
   BrokenTraderItemPickups(3)=(WeaponClasses=(Class'KFGame.KFWeapDef_MedicBat',Class'KFGame.KFWeapDef_Pulverizer',Class'KFGame.KFWeapDef_Rifle_FrostShotgunAxe',Class'KFGame.KFWeapDef_AK12',Class'KFGame.KFWeapDef_MKB42',Class'KFGame.KFWeapDef_M16M203',Class'KFGame.KFWeapDef_M4',Class'KFGame.KFWeapDef_SW500Dual_HRG',Class'KFGame.KFWeapDef_MedicShotgun',Class'KFGame.KFWeapDef_Hemogoblin',Class'KFGame.KFWeapDef_Mine_Reconstructor',Class'KFGame.KFWeapDef_SealSqueal',Class'KFGame.KFWeapDef_FlameThrower',Class'KFGame.KFWeapDef_HRGIncendiaryRifle',Class'KFGame.KFWeapDef_ChiappaRhinoDual',Class'KFGame.KFWeapDef_DeagleDual',Class'KFGame.KFWeapDef_M14EBR',Class'KFGame.KFWeapDef_HRG_SonicGun',Class'KFGame.KFWeapDef_MosinNagant',Class'KFGame.KFWeapDef_P90',Class'KFGame.KFWeapDef_Nailgun_HRG',Class'KFGame.KFWeapDef_HK_UMP',Class'KFGame.KFWeapDef_FreezeThrower',Class'KFGame.KFWeapDef_HRG_Kaboomstick',Class'KFGame.KFWeapDef_FAMAS'))
   BrokenTraderItemPickups(4)=(WeaponClasses=(Class'KFGame.KFWeapDef_MedicBat',Class'KFGame.KFWeapDef_Rifle_FrostShotgunAxe',Class'KFGame.KFWeapDef_M16M203',Class'KFGame.KFWeapDef_M4',Class'KFGame.KFWeapDef_MedicShotgun',Class'KFGame.KFWeapDef_FlameThrower',Class'KFGame.KFWeapDef_HRGIncendiaryRifle',Class'KFGame.KFWeapDef_DeagleDual',Class'KFGame.KFWeapDef_HRG_SonicGun',Class'KFGame.KFWeapDef_MosinNagant',Class'KFGame.KFWeapDef_HK_UMP',Class'KFGame.KFWeapDef_FreezeThrower',Class'KFGame.KFWeapDef_HRG_Kaboomstick',Class'KFGame.KFWeapDef_FAMAS',Class'KFGame.KFWeapDef_Eviscerator',Class'KFGame.KFWeapDef_FNFal',Class'KFGame.KFWeapDef_MedicRifle',Class'KFGame.KFWeapDef_ElephantGun',Class'KFGame.KFWeapDef_Seeker6',Class'KFGame.KFWeapDef_HuskCannon',Class'KFGame.KFWeapDef_SW500Dual',Class'KFGame.KFWeapDef_Kriss',Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator'))
   BrokenTraderItemPickups(5)=(WeaponClasses=(Class'KFGame.KFWeapDef_HRGTeslauncher',Class'KFGame.KFWeapDef_Eviscerator',Class'KFGame.KFWeapDef_MaceAndShield',Class'KFGame.KFWeapDef_PowerGloves',Class'KFGame.KFWeapDef_SCAR',Class'KFGame.KFWeapDef_Stoner63A',Class'KFGame.KFWeapDef_MedicRifle',Class'KFGame.KFWeapDef_FNFal',Class'KFGame.KFWeapDef_AA12',Class'KFGame.KFWeapDef_ElephantGun',Class'KFGame.KFWeapDef_Blunderbuss',Class'KFGame.KFWeapDef_HRGIncision',Class'KFGame.KFWeapDef_HRG_Vampire',Class'KFGame.KFWeapDef_RPG7',Class'KFGame.KFWeapDef_Seeker6',Class'KFGame.KFWeapDef_HuskCannon',Class'KFGame.KFWeapDef_MicrowaveGun',Class'KFGame.KFWeapDef_SW500Dual',Class'KFGame.KFWeapDef_AF2011Dual',Class'KFGame.KFWeapDef_Pistol_DualG18',Class'KFGame.KFWeapDef_RailGun',Class'KFGame.KFWeapDef_G18',Class'KFGame.KFWeapDef_Kriss',Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator',Class'KFGame.KFWeapDef_AbominationAxe',Class'KFGame.KFWeapDef_Minigun',Class'KFGame.KFWeapDef_MedicRifleGrenadeLauncher',Class'KFGame.KFWeapDef_MicrowaveRifle',Class'KFGame.KFWeapDef_CompoundBow',Class'KFGame.KFWeapDef_M99',Class'KFGame.KFWeapDef_LazerCutter',Class'KFGame.KFWeapDef_HRG_BlastBrawlers',Class'KFGame.KFWeapDef_ThermiteBore',Class'KFGame.KFWeapDef_HRG_BarrierRifle'))
   BrokenTraderItemPickups(6)=(WeaponClasses=(Class'KFGame.KFWeapDef_HRGTeslauncher',Class'KFGame.KFWeapDef_Eviscerator',Class'KFGame.KFWeapDef_MaceAndShield',Class'KFGame.KFWeapDef_PowerGloves',Class'KFGame.KFWeapDef_SCAR',Class'KFGame.KFWeapDef_Stoner63A',Class'KFGame.KFWeapDef_MedicRifle',Class'KFGame.KFWeapDef_FNFal',Class'KFGame.KFWeapDef_AA12',Class'KFGame.KFWeapDef_ElephantGun',Class'KFGame.KFWeapDef_Blunderbuss',Class'KFGame.KFWeapDef_HRGIncision',Class'KFGame.KFWeapDef_HRG_Vampire',Class'KFGame.KFWeapDef_RPG7',Class'KFGame.KFWeapDef_Seeker6',Class'KFGame.KFWeapDef_HuskCannon',Class'KFGame.KFWeapDef_MicrowaveGun',Class'KFGame.KFWeapDef_SW500Dual',Class'KFGame.KFWeapDef_AF2011Dual',Class'KFGame.KFWeapDef_Pistol_DualG18',Class'KFGame.KFWeapDef_RailGun',Class'KFGame.KFWeapDef_G18',Class'KFGame.KFWeapDef_Kriss',Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator',Class'KFGame.KFWeapDef_AbominationAxe',Class'KFGame.KFWeapDef_Minigun',Class'KFGame.KFWeapDef_MedicRifleGrenadeLauncher',Class'KFGame.KFWeapDef_MicrowaveRifle',Class'KFGame.KFWeapDef_CompoundBow',Class'KFGame.KFWeapDef_M99',Class'KFGame.KFWeapDef_LazerCutter',Class'KFGame.KFWeapDef_HRG_BlastBrawlers',Class'KFGame.KFWeapDef_ThermiteBore',Class'KFGame.KFWeapDef_HRG_BarrierRifle'))
   BrokenTraderItemPickups(7)=(WeaponClasses=(Class'KFGame.KFWeapDef_HRGTeslauncher',Class'KFGame.KFWeapDef_Eviscerator',Class'KFGame.KFWeapDef_MaceAndShield',Class'KFGame.KFWeapDef_PowerGloves',Class'KFGame.KFWeapDef_SCAR',Class'KFGame.KFWeapDef_Stoner63A',Class'KFGame.KFWeapDef_MedicRifle',Class'KFGame.KFWeapDef_FNFal',Class'KFGame.KFWeapDef_AA12',Class'KFGame.KFWeapDef_ElephantGun',Class'KFGame.KFWeapDef_Blunderbuss',Class'KFGame.KFWeapDef_HRGIncision',Class'KFGame.KFWeapDef_HRG_Vampire',Class'KFGame.KFWeapDef_RPG7',Class'KFGame.KFWeapDef_Seeker6',Class'KFGame.KFWeapDef_HuskCannon',Class'KFGame.KFWeapDef_MicrowaveGun',Class'KFGame.KFWeapDef_SW500Dual',Class'KFGame.KFWeapDef_AF2011Dual',Class'KFGame.KFWeapDef_Pistol_DualG18',Class'KFGame.KFWeapDef_RailGun',Class'KFGame.KFWeapDef_G18',Class'KFGame.KFWeapDef_Kriss',Class'KFGame.KFWeapDef_HRG_EMP_ArcGenerator',Class'KFGame.KFWeapDef_AbominationAxe',Class'KFGame.KFWeapDef_Minigun',Class'KFGame.KFWeapDef_MedicRifleGrenadeLauncher',Class'KFGame.KFWeapDef_MicrowaveRifle',Class'KFGame.KFWeapDef_CompoundBow',Class'KFGame.KFWeapDef_M99',Class'KFGame.KFWeapDef_LazerCutter',Class'KFGame.KFWeapDef_HRG_BlastBrawlers',Class'KFGame.KFWeapDef_ThermiteBore',Class'KFGame.KFWeapDef_HRG_BarrierRifle'))
   Name="Default__KFGameReplicationInfo_WeeklySurvival"
   ObjectArchetype=KFGameReplicationInfo'KFGame.Default__KFGameReplicationInfo'
}
