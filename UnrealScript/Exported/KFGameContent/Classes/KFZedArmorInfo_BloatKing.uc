//=============================================================================
// KFZedArmorInfo_BloatKing
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_BloatKing extends KFZedArmorInfo;

simulated function UpdateArmorPiece(int PieceIdx)
{
	local int i;

	super.UpdateArmorPiece(PieceIdx);

	switch (ArmorZones[PieceIdx].ArmorZoneName)
	{
	case 'head':
		// King bloat uses 2 static attachments for the head piece.
		// Assume these are slot 0, 1 for future possible holiday purposes.
		// Min at list length in case there are fewer than default meshes.
		for (i = Min(1, StaticAttachList.Length - 1); i >= 0; --i)
		{
			Mesh.DetachComponent(StaticAttachList[i]);
			DetachComponent(StaticAttachList[i]);
			StaticAttachList.Remove(i, 1);
		}
		break;

	case 'front':
	case 'back':
		DetachComponent(ThirdPersonAttachments[PieceIdx]);
		ThirdPersonAttachments[PieceIdx] = none;
		break;
	}
}

defaultproperties
{
   ArmorZones(0)=(ArmorZoneName="head",AffectedHitZones=("head"),SocketName="FX_Armor_Head",ArmorHealth=1100,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Head_Armor')
   ArmorZones(1)=(ArmorZoneName="Front",AffectedHitZones=("chest","heart","stomach","abdomen"),bAffectedByBackDamage=False,SocketName="FX_Armor_Chest",ArmorHealth=4800,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Chest_Armor')
   ArmorZones(2)=(ArmorZoneName="back",AffectedHitZones=("chest","heart","stomach","abdomen"),bAffectedByFrontDamage=False,SocketName="FX_Armor_Back",ArmorHealth=3600,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Back_Armor')
   ArmorScale=1.000000
   ArmorDamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   ArmorDamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   ArmorDamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   ArmorDamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire')
   ArmorDamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.900000))
   ArmorDamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   ArmorDamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   ArmorDamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Toxic_BloatKingFart',DamageScale=(0.000000))
   ArmorDamageTypeModifiers(13)=(DamageType=Class'kfgamecontent.KFDT_Toxic_BloatKingPukeMine',DamageScale=(0.000000))
   ArmorDamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Toxic_BloatKingSubspawnExplosion',DamageScale=(25.000000))
   ArmorDamageTypeModifiers(15)=(DamageType=Class'KFGame.KFDT_Toxic_HRGHealthrower',DamageScale=(1.200000))
   ArmorDamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Bleeding_Hemogoblin')
   Name="Default__KFZedArmorInfo_BloatKing"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
