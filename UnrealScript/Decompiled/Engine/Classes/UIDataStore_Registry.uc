/*******************************************************************************
 * UIDataStore_Registry generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UIDataStore_Registry extends UIDataStore
    transient
    native(UIPrivate)
    config(Engine)
    hidecategories(Object,UIRoot);

struct native RegistryKeyValuePair
{
    var string Key;
    var string Value;

    structdefaultproperties
    {
        Key=""
        Value=""
    }
};

var array<RegistryKeyValuePair> RegistryData;

event bool GetData(string Key, out string out_Data)
{
    local int I;

    I = 0;
    J0x0B:

    if(I < RegistryData.Length)
    {
        if(RegistryData[I].Key == Key)
        {
            out_Data = RegistryData[I].Value;
            return true;
        }
        ++ I;
        goto J0x0B;
    }
    return false;
}

event SetData(string Key, string Value)
{
    local int I;
    local RegistryKeyValuePair KVP;

    I = 0;
    J0x0B:

    if(I < RegistryData.Length)
    {
        if(RegistryData[I].Key == Key)
        {
            RegistryData[I].Value = Value;
            return;
        }
        ++ I;
        goto J0x0B;
    }
    KVP.Key = Key;
    KVP.Value = Value;
    RegistryData.AddItem(KVP;
}

defaultproperties
{
    Tag=Registry
}