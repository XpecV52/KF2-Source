//=============================================================================
// KFZedArmorInfo_EvilDAR
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_EvilDAR extends KFZedArmorInfo;

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
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0], SocketLocation, SocketRotation);
			}

			PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			break;
		case FrontBit:
			DetachComponent(ThirdPersonAttachments[0]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);

			if (MonsterArch.ExtraVFX.length > 1)
			{
				WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1], SocketLocation, SocketRotation);
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
   ArmorHitzoneNames(0)="head"
   ArmorHitzoneNames(1)="chest"
   ArmorHitzoneNames(2)="heart"
   ArmorHitzoneNames(3)="stomach"
   ArmorHitzoneNames(4)="abdomen"
   ArmorZones(0)=(ArmorZoneName="head",SocketName="FX_Armor_Head",ArmorHealth=550,ArmorHealthMax=550,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Headshot')
   ArmorZones(1)=(ArmorZoneName="Front",SocketName="FX_Armor_Chest",ArmorHealth=500,ArmorHealthMax=500,ExplosionSFXTemplate=AkEvent'WW_ZED_Evil_DAR.Play_ZED_EvilDAR_SFX_Jetpack_Damaged')
   ArmorScale=1.000000
   Name="Default__KFZedArmorInfo_EvilDAR"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
