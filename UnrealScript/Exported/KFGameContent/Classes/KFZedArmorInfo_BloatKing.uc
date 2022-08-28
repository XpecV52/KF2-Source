//=============================================================================
// KFZedArmorInfo_BloatKing
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFZedArmorInfo_BloatKing extends KFZedArmorInfo;

//local player so we can update the UI
var KFPlayerController KFPC;

simulated function KFPlayerController GetKFPC()
{
	if (KFPC == none)
	{
		KFPC = KFPlayerController(GetALocalPlayerController());
	}

	return KFPC;
}

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
	local byte StatusField;

	switch (ArmorZoneName)
	{
	case 'head':
		StatusField = FrontBit | BackBit;
		break;
	case 'front':
		StatusField = HeadBit | BackBit;
		break;
	case 'back':
		StatusField = FrontBit | HeadBit;
		break;
	}

	ArmorZoneStatus = ArmorZoneStatus & StatusField;
	UpdateArmorPieces();
}

simulated function UpdateArmorUI()
{
	local SCompressedArmorInfo CompressedArmorInfoList[3];
	local int i;

	if (GetKFPC() == none)
	{
		return;
	}

	for (i = 0; i < ArmorZones.length; i++)
	{
		CompressedArmorInfoList[i].Percentage = ByteToFloat(RepArmorPct[i]);
		CompressedArmorInfoList[i].IconTexture = default.ArmorZones[i].ZoneIcon;
	}

	if (KFPC.MyGFxHUD != none && KFPC.MyGFxHUD.bossHealthBar != none)
	{
		KFPC.MyGFxHUD.bossHealthBar.UpdateArmorUI(CompressedArmorInfoList);
	}
}

simulated function UpdateArmorPieces()
{
	local int i;
	local Vector SocketLocation;
	local Rotator SocketRotation;
	local KFCharacterInfo_Monster MonsterArch;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		MonsterArch = GetCharacterMonsterInfo();
		switch (ArmorZoneStatus ^ PreviousArmorZoneStatus)
		{
		case HeadBit:
			//King bloat uses 2 static attachments for the head piece.  Assume these are slot 0, 1 for future possible holiday purposes.
			//		Min at list length in case there are fewer than default meshes.
			for (i = Min(1, StaticAttachList.Length - 1); i >= 0; --i)
			{
				Mesh.DetachComponent(StaticAttachList[i]);
				DetachComponent(StaticAttachList[i]);
				StaticAttachList.Remove(i, 1);
			}
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[0].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			break;
		case FrontBit:
			//Front armor is locked to attach list slot 1
			DetachComponent(ThirdPersonAttachments[1]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[1].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[1] = none;
			break;
		case BackBit:
			//Back armor is locked to attach list slot 2
			DetachComponent(ThirdPersonAttachments[2]);
			Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[2].SocketName, SocketLocation, SocketRotation);
			WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[2], SocketLocation, SocketRotation);
			PlaySoundBase(default.ArmorZones[2].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
			ThirdPersonAttachments[2] = none;
			break;
		default:
			//Nothing changed
			break;
		}

		UpdateArmorUI();
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
   ArmorZones(0)=(ArmorZoneName="head",SocketName="FX_Armor_Head",ArmorHealth=1000,ArmorHealthMax=2000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Small_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Head_Armor')
   ArmorZones(1)=(ArmorZoneName="Front",SocketName="FX_Armor_Chest",ArmorHealth=4000,ArmorHealthMax=4000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Chest_Armor')
   ArmorZones(2)=(ArmorZoneName="back",SocketName="FX_Armor_Back",ArmorHealth=3000,ArmorHealthMax=3000,ExplosionSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Large_Armor_Explo',ZoneIcon=Texture2D'zed_bloatking_ui.BloatKing_Back_Armor')
   ArmorScale=1.000000
   Name="Default__KFZedArmorInfo_BloatKing"
   ObjectArchetype=KFZedArmorInfo'KFGame.Default__KFZedArmorInfo'
}
