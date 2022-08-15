/*******************************************************************************
 * CloudSaveSystemKVSInterface generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
interface CloudSaveSystemKVSInterface extends Interface
    abstract;

function bool ReadKeyValue(int SaveSlotIndex, string KeyName, PlatformInterfaceBase.EPlatformInterfaceDataType Type, out PlatformInterfaceDelegateResult Value);

function bool WriteKeyValue(int SaveSlotIndex, string KeyName, const out PlatformInterfaceData Value);
