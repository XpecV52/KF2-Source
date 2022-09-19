//=============================================================================
// KFZedArmorInfo_Matriarch
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_Matriarch extends KFZedArmorInfo;

simulated function UpdateArmorPiece(int PieceIdx)
{
	super.UpdateArmorPiece(PieceIdx);

	switch (ArmorZones[PieceIdx].ArmorZoneName)
	{
	case 'head':
		DetachComponent(ThirdPersonAttachments[0]);
		ThirdPersonAttachments[0] = none;
		break;

	case 'claw':
		Mesh.DetachComponent(StaticAttachList[0]);
		DetachComponent(StaticAttachList[0]);
		StaticAttachList.length = 0;
		break;
	};
}

defaultproperties
{
   ArmorZones(0)=(ArmorZoneName="head",AffectedHitZones=("dome"),bAffectedByBackDamage=False,SocketName="FX_Armor_Chest",ArmorHealth=1750,ExplosionSFXTemplate=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Armor_Break_Large',BonesToHideOnExplode=("Dome_Main"),ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Head_Armor')
   ArmorZones(1)=(ArmorZoneName="claw",AffectedHitZones=("lhandcap","lforearm"),SocketName="FX_Gun_Cap",ArmorHealth=1750,ExplosionSFXTemplate=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Armor_Break_Small',BonesToHideOnExplode=("LeftHandCap"),BonesToShowOnExplode=("LeftHandMain"),ZoneIcon=Texture2D'ZED_Matriarch_UI.Matriarch_ArmCanon')
   ArmorScale=1.000000
   ArmorDamageTypeModifiers(0)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Submachinegun',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(1)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_AssaultRifle',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(2)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Shotgun',DamageScale=(0.400000))
   ArmorDamageTypeModifiers(3)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Handgun',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(4)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_Rifle',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(5)=(DamageType=Class'KFGame.KFDT_Slashing')
   ArmorDamageTypeModifiers(6)=(DamageType=Class'KFGame.KFDT_Bludgeon')
   ArmorDamageTypeModifiers(7)=(DamageType=Class'KFGame.KFDT_Fire',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(8)=(DamageType=Class'KFGame.KFDT_Microwave',DamageScale=(0.900000))
   ArmorDamageTypeModifiers(9)=(DamageType=Class'KFGame.KFDT_Explosive',DamageScale=(0.400000))
   ArmorDamageTypeModifiers(10)=(DamageType=Class'KFGame.KFDT_Piercing',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(11)=(DamageType=Class'KFGame.KFDT_Toxic',DamageScale=(0.050000))
   ArmorDamageTypeModifiers(12)=(DamageType=Class'kfgamecontent.KFDT_Ballistic_MicrowaveRifle',DamageScale=(0.700000))
   ArmorDamageTypeModifiers(13)=(DamageType=Class'KFGame.KFDT_Toxic_HRGHealthrower',DamageScale=(0.500000))
   ArmorDamageTypeModifiers(14)=(DamageType=Class'kfgamecontent.KFDT_Shrink_ShrinkRayGun',DamageScale=(5.000000))
   ArmorDamageTypeModifiers(15)=(DamageType=Class'kfgamecontent.KFDT_Blast_HRG_CranialPopper',DamageScale=(0.000000))
   ArmorDamageTypeModifiers(16)=(DamageType=Class'kfgamecontent.KFDT_Piercing_HRG_CranialPopper',DamageScale=(2.000000))
   Name="Default__KFZedArmorInfo_Matriarch"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
