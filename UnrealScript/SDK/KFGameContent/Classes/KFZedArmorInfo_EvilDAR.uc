//=============================================================================
// KFZedArmorInfo_EvilDAR
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_EvilDAR extends KFZedArmorInfo;

function AdjustBoneDamage(out int InDamage, name BoneName, Vector DamagerSource)
{
	local byte PrevArmorZoneStatus, HeadByte;

	PrevArmorZoneStatus = PreviousArmorZoneStatus;
	super.AdjustBoneDamage(InDamage, BoneName, DamagerSource);

	// EDAR has no head, only head armor, so blow off his "head" when his head armor is blown off
	HeadByte = HeadBit;
	if (((ArmorZoneStatus ^ PrevArmorZoneStatus) & HeadByte) != 0)
	{
		HitZones[HZI_Head].GoreHealth = 0;
	}
}

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	local name AdjustedZoneName;
	local byte StatusField;

	AdjustedZoneName = ArmorZoneName;
	if (AdjustedZoneName == 'back')
	{
		AdjustedZoneName = '';
	}

	switch (AdjustedZoneName)
	{
	case 'head':
		StatusField = FrontBit;
		break;
	case 'front':
		StatusField = HeadBit;
		break;
	}

	ArmorZoneStatus = ArmorZoneStatus & StatusField;
	UpdateArmorPieces();
}

simulated function UpdateArmorPieces()
{
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local KFCharacterInfo_Monster MonsterArch;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterArch = GetCharacterMonsterInfo();
		switch (ArmorZoneStatus ^ PreviousArmorZoneStatus)
		{
		case HeadBit:
			Mesh.DetachComponent(StaticAttachList[0]);
			DetachComponent(StaticAttachList[0]);
			StaticAttachList.Remove(0, 1);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[0].SocketName, SocketLocation, SocketRotation);

			if (MonsterArch.ExtraVFX.length > 0)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0].VFX, SocketLocation, SocketRotation);
			}

			PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			break;
		case FrontBit:
			DetachComponent(ThirdPersonAttachments[0]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);

			if (MonsterArch.ExtraVFX.length > 1)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1].VFX, SocketLocation, SocketRotation);
			}

			PlaySoundBase(default.ArmorZones[1].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[0] = none;
			break;
		default:
			//Nothing changed
			break;
		}
	}

	PreviousArmorZoneStatus = ArmorZoneStatus;
}

defaultproperties
{
	// Mapping between armor piece and hit zones to block pawn damage hitting active armor and apply that damage to the armor
    ArmorHitzoneNames.Add(head)
    ArmorHitzoneNames.Add(chest)
    ArmorHitzoneNames.Add(heart)
    ArmorHitzoneNames.Add(stomach)
    ArmorHitzoneNames.Add(abdomen)

    //Armor info
    ArmorZones.Add((ArmorZoneName=head,SocketName=FX_Armor_Head,ArmorHealth=600,ArmorHealthMax=600,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Headshot')) //ArmorHealth=20, ArmorHealthMax=20
    ArmorZones.Add((ArmorZoneName=front,SocketName=FX_Armor_Chest,ArmorHealth=225,ArmorHealthMax=225,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Jetpack_Damaged')) //ArmorHealth=40, ArmorHealthMax=40
	ArmorScale=1.f
}
