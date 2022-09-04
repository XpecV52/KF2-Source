//=============================================================================
// KFZedArmorInfo_EvilDAR
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_EvilDAR extends KFZedArmorInfo;

function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource, class<DamageType> DamageType)
{
	local byte PrevArmorZoneStatus;
	local int UpdatedZones;

	PrevArmorZoneStatus = PreviousArmorZoneStatus;
	super.AdjustBoneDamage(InDamage, BoneName, DamagerSource, DamageType);

	// EDAR has no head, only head armor, so blow off his "head" when his head armor is blown off
	UpdatedZones = ArmorZoneStatus ^ PrevArmorZoneStatus;
	if (bool(UpdatedZones & (1 << 0)))
	{
		HitZones[HZI_Head].GoreHealth = 0;
	}
}

simulated function UpdateArmorPiece(int PieceIdx)
{
	super.UpdateArmorPiece(PieceIdx);

	switch (ArmorZones[PieceIdx].ArmorZoneName)
	{
	case 'head':
		Mesh.DetachComponent(StaticAttachList[0]);
		DetachComponent(StaticAttachList[0]);
		StaticAttachList.Remove(0, 1);
		break;

	case 'front':
		DetachComponent(ThirdPersonAttachments[0]);
		ThirdPersonAttachments[0] = none;
		break;
	}
}

defaultproperties
{
   ArmorZones(0)=(ArmorZoneName="head",AffectedHitZones=("head"),SocketName="FX_Armor_Head",ArmorHealth=600,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Headshot')
   ArmorZones(1)=(ArmorZoneName="Front",AffectedHitZones=("chest","heart","stomach","abdomen"),bAffectedByBackDamage=False,SocketName="FX_Armor_Chest",ArmorHealth=52,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Jetpack_Damaged')
   ArmorScale=1.000000
   ArmorDamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(1.050000))
   ArmorDamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(1.050000))
   ArmorDamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(1.200000))
   ArmorDamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun')
   ArmorDamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   ArmorDamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(1.250000))
   ArmorDamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(1.250000))
   ArmorDamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(1.500000))
   ArmorDamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(3.250000))
   ArmorDamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(2.500000))
   ArmorDamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.850000))
   ArmorDamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   ArmorDamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Bleeding_Hemogoblin',DamageScale=(5.000000))
   ArmorDamageTypeModifiers(13)=(DamageType=Class'KFGame.KFDT_Toxic_HRGHealthrower',DamageScale=(1.200000))
   Name="Default__KFZedArmorInfo_EvilDAR"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
