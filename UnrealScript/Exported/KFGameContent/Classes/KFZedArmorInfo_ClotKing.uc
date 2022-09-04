//=============================================================================
// KFZedArmorInfo_ClotKing
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_ClotKing extends KFZedArmorInfo;

simulated function UpdateArmorPiece(int PieceIdx)
{
	super.UpdateArmorPiece(PieceIdx);

	switch (ArmorZones[PieceIdx].ArmorZoneName)
	{
	case 'head':
		Mesh.DetachComponent(StaticAttachList[0]);
		DetachComponent(StaticAttachList[0]);
		break;

	case 'front':
		DetachComponent(ThirdPersonAttachments[0]);
		ThirdPersonAttachments[0] = none;
		break;
	}
}

defaultproperties
{
   ArmorZones(0)=(ArmorZoneName="head",AffectedHitZones=("head"),SocketName="FX_Armor_Head",ArmorHealth=450,ObliterateDmgThreshold=80,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo')
   ArmorZones(1)=(ArmorZoneName="Front",AffectedHitZones=("chest","heart","stomach","abdomen"),bAffectedByBackDamage=False,SocketName="FX_Armor_Chest",ArmorHealth=500,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo')
   ArmorScale=1.000000
   ArmorDamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(1.500000))
   ArmorDamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle')
   ArmorDamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun')
   ArmorDamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(1.010000))
   ArmorDamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle')
   ArmorDamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing',DamageScale=(0.850000))
   ArmorDamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon',DamageScale=(0.900000))
   ArmorDamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(3.000000))
   ArmorDamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.250000))
   ArmorDamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive')
   ArmorDamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing')
   ArmorDamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic')
   ArmorDamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Bleeding_Hemogoblin',DamageScale=(5.000000))
   Name="Default__KFZedArmorInfo_ClotKing"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
