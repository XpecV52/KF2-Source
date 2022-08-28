/*******************************************************************************
 * KFZedArmorInfo_EvilDAR generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFZedArmorInfo_EvilDAR extends KFZedArmorInfo within KFPawn_Monster;

function ExplodeArmor(int ArmorZoneIdx, name ArmorZoneName)
{
    local name AdjustedZoneName;
    local byte StatusField;

    AdjustedZoneName = ArmorZoneName;
    if(AdjustedZoneName == 'back')
    {
        AdjustedZoneName = 'None';
    }
    switch(AdjustedZoneName)
    {
        case 'head':
            StatusField = 2;
            break;
        case 'Front':
            StatusField = 1;
            break;
        default:
            break;
    }
    Outer.ArmorZoneStatus = byte(Outer.ArmorZoneStatus & StatusField);
    UpdateArmorPieces();
}

simulated function UpdateArmorPieces()
{
    local Vector SocketLocation;
    local Rotator SocketRotation;
    local KFCharacterInfo_Monster MonsterArch;

    if(Outer.WorldInfo.NetMode != NM_DedicatedServer)
    {
        MonsterArch = Outer.GetCharacterMonsterInfo();
        switch(Outer.ArmorZoneStatus ^ Outer.PreviousArmorZoneStatus)
        {
            case 1:
                Outer.Mesh.DetachComponent(Outer.StaticAttachList[0]);
                Outer.DetachComponent(Outer.StaticAttachList[0]);
                Outer.StaticAttachList.Remove(0, 1;
                Outer.Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[0].SocketName, SocketLocation, SocketRotation);
                if(MonsterArch.ExtraVFX.Length > 0)
                {
                    Outer.WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[0], SocketLocation, SocketRotation);
                }
                Outer.PlaySoundBase(default.ArmorZones[0].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
                break;
            case 2:
                Outer.DetachComponent(Outer.ThirdPersonAttachments[0]);
                Outer.Mesh.GetSocketWorldLocationAndRotation(default.ArmorZones[1].SocketName, SocketLocation, SocketRotation);
                if(MonsterArch.ExtraVFX.Length > 1)
                {
                    Outer.WorldInfo.MyEmitterPool.SpawnEmitter(MonsterArch.ExtraVFX[1], SocketLocation, SocketRotation);
                }
                Outer.PlaySoundBase(default.ArmorZones[1].ExplosionSFXTemplate, true, true, true, SocketLocation, true, SocketRotation);
                Outer.ThirdPersonAttachments[0] = none;
                break;
            default:
                break;
                break;
        }
    }
    Outer.PreviousArmorZoneStatus = Outer.ArmorZoneStatus;
}

defaultproperties
{
    ArmorHitzoneNames=/* Array type was not detected. */
    ArmorZones=/* Array type was not detected. */
    ArmorScale=1
}